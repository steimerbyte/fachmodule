# Fachmodul: (REST)APIs mit Java ansprechen

**Kurs-ID:** 2615
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2615
**Bezugsstand:** Java 21 LTS

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was sind REST APIs?](#2-was-sind-rest-apis)
3. [HTTP-Status-Codes](#3-http-status-codes)
4. [Anatomie einer HTTP-Anfrage](#4-anatomie-einer-http-anfrage)
5. [JSON-Parsing: Jackson vs. Gson](#5-json-parsing-jackson-vs-gson)
6. [Der eingebaute Java HttpClient (Java 11+)](#6-der-eingebaute-java-httpclient-java-11)
7. [Apache HttpClient 5](#7-apache-httpclient-5)
8. [OkHttp](#8-okhttp)
9. [Spring HTTP-Clients](#9-spring-http-clients)
10. [JSON-Deserialisierung zu Java-Objekten](#10-json-deserialisierung-zu-java-objekten)
11. [Authentifizierung](#11-authentifizierung)
12. [Fehlerbehandlung und Resilience-Patterns](#12-fehlerbehandlung-und-resilience-patterns)
13. [Praxisbeispiel: OpenWeatherMap API](#13-praxisbeispiel-openweathermap-api)
14. [Praxisbeispiel: GitHub REST API](#14-praxisbeispiel-github-rest-api)
15. [Asynchrone Verarbeitung mit CompletableFuture](#15-asynchrone-verarbeitung-mit-completablefuture)
16. [Tests und Mocking](#16-tests-und-mocking)
17. [Logging und Observability](#17-logging-und-observability)
18. [Bild- und Diagrammverweise](#18-bild-und-diagrammverweise)
19. [Best Practices](#19-best-practices)
20. [Quellen](#20-quellen)
21. [Zusammenfassung](#21-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- REST-Constraints, HTTP-Methoden und Status-Codes erläutern,
- das Richardson Maturity Model einordnen,
- HTTP-Anfragen mit dem eingebauten `java.net.http.HttpClient` stellen,
- JSON-Antworten mit Jackson oder Gson deserialisieren,
- Timeouts, Fehlerbehandlung und Retry-Patterns implementieren,
- zwischen RestTemplate, RestClient und WebClient wählen,
- Bearer-Token (OAuth 2.0 / JWT) und API-Keys einsetzen,
- asynchrone Calls mit `CompletableFuture` durchführen,
- externe APIs (OpenWeatherMap, GitHub) anbinden,
- Tests mit WireMock und Mockito schreiben.

---

## 2. Was sind REST APIs?

**REST** (Representational State Transfer) ist ein Architekturstil für verteilte Hypermedia-Systeme, definiert 2000 in der Dissertation von Roy Fielding. Eine REST-API ist eine Sammlung von Ressourcen, die über zustandslose HTTP-Kommunikation angesprochen werden.

### 2.1 REST-Constraints

| Constraint | Bedeutung |
|---|---|
| Client-Server | Trennung von UI und Datenspeicherung |
| Stateless | Jeder Request enthält alle Infos |
| Cacheable | Responses tragen Cache-Informationen |
| Uniform Interface | Standardisierte Schnittstelle |
| Layered System | Klare Schichtenarchitektur |
| Code on Demand | Optional: ausführbarer Code |

### 2.2 HTTP-Methoden

| Methode | Bedeutung | Idempotent | Sicher |
|---|---|---|---|
| GET | Lesen | ja | ja |
| POST | Erstellen/Aktion | nein | nein |
| PUT | Komplett ersetzen | ja | nein |
| PATCH | Teilweise ändern | nein | nein |
| DELETE | Löschen | ja | nein |
| HEAD | Wie GET, ohne Body | ja | ja |
| OPTIONS | Methoden abfragen | ja | ja |

**Idempotent**: Mehrfachausführung liefert dasselbe Ergebnis wie Einzelausführung.

### 2.3 Richardson Maturity Model

| Level | Name | Charakteristika |
|---|---|---|
| 0 | Swamp of POX | Ein URI, HTTP als Transport |
| 1 | Resources | Einzelne URIs pro Ressource |
| 2 | HTTP Verbs | Korrekte Verwendung der Methoden |
| 3 | HATEOAS | Responses enthalten Links zu nächsten Aktionen |

---

## 3. HTTP-Status-Codes

| Klasse | Bedeutung | Beispiele |
|---|---|---|
| 1xx | Informational | 100 Continue |
| 2xx | Erfolg | 200 OK, 201 Created, 204 No Content |
| 3xx | Redirect | 301, 304 Not Modified |
| 4xx | Client-Fehler | 400, 401, 403, 404, 422 |
| 5xx | Server-Fehler | 500, 502, 503 |

### 3.1 Wichtige Codes im REST-Kontext

| Code | Wann |
|---|---|
| 200 OK | Standard für GET |
| 201 Created | POST-Antwort mit Location |
| 202 Accepted | Asynchrone Verarbeitung |
| 204 No Content | PUT, DELETE ohne Daten |
| 400 Bad Request | Ungültiges JSON |
| 401 Unauthorized | Authentifizierung fehlt |
| 403 Forbidden | Nicht autorisiert |
| 404 Not Found | Unbekannte ID |
| 409 Conflict | Konflikt mit Zustand |
| 422 Unprocessable Entity | Business-Regel verletzt |
| 429 Too Many Requests | Rate Limit |
| 500 Internal Server Error | Bug |
| 503 Service Unavailable | Wartung/Überlastung |

---

## 4. Anatomie einer HTTP-Anfrage

### 4.1 Sequenzdiagramm

```
Client           API-Gateway         Auth-Service      Resource-Server
   |                   |                   |                   |
   |--POST /login----->|                   |                   |
   |                   |--Validate User--->|                   |
   |                   |<--JWT-Token-------|                   |
   |<--200 + JWT-------|                   |                   |
   |                   |                   |                   |
   |--GET /api/users-->|                   |                   |
   |   + Bearer JWT    |                   |                   |
   |                   |--Verify JWT------>|                   |
   |                   |<--OK + claims-----|                   |
   |                   |--GET /db/users (intern)------------------>|
   |                   |<--User-Daten--------------------------|
   |<--200 + JSON------|                   |                   |
```

### 4.2 Request-Aufbau

```
POST /api/v1/users HTTP/1.1
Host: api.example.com
Authorization: Bear********************[REDACTED:Bearer Token]
Content-Type: application/json
Accept: application/json
User-Agent: Java/17.0.2
Content-Length: 48

{"name":"Max","email":"max@example.com"}
```

### 4.3 Response-Aufbau

```
HTTP/1.1 201 Created
Content-Type: application/json
Location: /api/v1/users/42
X-RateLimit-Remaining: 99
Date: Mon, 28 Jul 2026 22:00:00 GMT

{"id":42,"name":"Max","email":"..."}
```

---

## 5. JSON-Parsing: Jackson vs. Gson

| Kriterium | Jackson | Gson | JSON-B |
|---|---|---|---|
| Serialisierungs-Speed | Schnellste | Moderat | Langsam |
| API-Komplexität | Mittel | Sehr einfach | Standardisiert |
| Streaming API | Ja | Nein | Ja |
| Spring-Default | Ja | Nein | Optional |

### 5.1 Jackson-Beispiel

```java
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.DeserializationFeature;

public record User(int id, String name, String email) {}

public class JacksonDemo {
    public static void main(String[] args) throws Exception {
        ObjectMapper mapper = new ObjectMapper()
            .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        String json = "{\"id\":42,\"name\":\"Max\",\"email\":\"max@ex.de\"}";
        User user = mapper.readValue(json, User.class);
        System.out.println(user.name());

        User neu = new User(43, "Anna", "anna@ex.de");
        String out = mapper.writeValueAsString(neu);
        System.out.println(out);
    }
}
```

### 5.2 Gson-Beispiel

```java
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GsonDemo {
    public static void main(String[] args) {
        Gson gson = new GsonBuilder()
            .setPrettyPrinting()
            .serializeNulls()
            .create();

        User user = gson.fromJson("{\"id\":42,\"name\":\"Max\"}", User.class);
        String json = gson.toJson(user);
        System.out.println(json);
    }
}
```

---

## 6. Der eingebaute Java HttpClient (Java 11+)

### 6.1 Eigenschaften

- Klassenpfad: `java.net.http`
- Protokolle: HTTP/1.1, HTTP/2, WebSocket
- Modi: synchron (`send()`) und asynchron (`sendAsync()` mit `CompletableFuture`)
- Body-Handling: Reaktive Streams via `BodyHandlers`
- Builder-Pattern

### 6.2 Synchroner GET-Request

```java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

public class SyncGet {
    public static void main(String[] args) throws Exception {
        HttpClient client = HttpClient.newBuilder()
            .version(HttpClient.Version.HTTP_2)
            .connectTimeout(Duration.ofSeconds(5))
            .build();

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://api.github.com/users/octocat"))
            .header("Accept", "application/json")
            .header("User-Agent", "Java-Fachmodul/1.0")
            .timeout(Duration.ofSeconds(10))
            .GET()
            .build();

        HttpResponse<String> response = client.send(
            request, HttpResponse.BodyHandlers.ofString());

        System.out.println("Status: " + response.statusCode());
        System.out.println("Body: " + response.body());
    }
}
```

### 6.3 POST mit JSON-Body

```java
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse.BodyHandlers;

String json = """
    {"name":"Max Mustermann","email":"max@beispiel.de"}
    """;

HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://api.beispiel.de/users"))
    .header("Content-Type", "application/json")
    .header("Authorization", "Bearer MEIN_TOKEN")
    .POST(BodyPublishers.ofString(json))
    .build();

HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
```

### 6.4 Timeouts

| Ebene | Konfiguration |
|---|---|
| Connect-Timeout | `HttpClient.connectTimeout()` — TCP-Handshake |
| Request-Timeout | `HttpRequest.timeout()` — Gesamte Dauer |
| Per-Call-Timeout | `CompletableFuture.get(timeout)` |

### 6.5 Asynchroner Aufruf

```java
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;
import java.util.List;

List<String> urls = List.of(
    "https://api.github.com/users/octocat",
    "https://api.github.com/users/torvalds"
);

List<CompletableFuture<HttpResponse<String>>> futures = urls.stream()
    .map(url -> client.sendAsync(
        HttpRequest.newBuilder(URI.create(url))
            .header("Accept", "application/json")
            .timeout(Duration.ofSeconds(10))
            .GET()
            .build(),
        HttpResponse.BodyHandlers.ofString()))
    .collect(Collectors.toList());

CompletableFuture.allOf(futures.toArray(new CompletableFuture[0]))
    .thenRun(() -> futures.forEach(f -> {
        try {
            HttpResponse<String> r = f.get();
            System.out.println(r.uri() + " -> " + r.statusCode());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }))
    .join();
```

---

## 7. Apache HttpClient 5

Apache HttpClient 5.x ist ein bewährter HTTP-Client mit moderner API (`org.apache.hc.client5.http.*`).

```xml
<dependency>
    <groupId>org.apache.httpcomponents.client5</groupId>
    <artifactId>httpclient5</artifactId>
    <version>5.3.1</version>
</dependency>
```

### 7.1 GET-Request

```java
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.io.entity.EntityUtils;

try (CloseableHttpClient client = HttpClients.createDefault()) {
    HttpGet request = new HttpGet("https://api.github.com/users/octocat");
    request.setHeader("Accept", "application/json");

    String body = client.execute(request, response -> {
        System.out.println("Status: " + response.getCode());
        return EntityUtils.toString(response.getEntity());
    });
    System.out.println("Body: " + body);
}
```

### 7.2 POST mit Timeout

```java
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.config.RequestConfig;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.apache.hc.core5.http.ContentType;
import org.apache.hc.core5.util.Timeout;

RequestConfig config = RequestConfig.custom()
    .setConnectionRequestTimeout(Timeout.ofMilliseconds(2000))
    .setResponseTimeout(Timeout.ofMilliseconds(10000))
    .build();

try (CloseableHttpClient client = HttpClients.custom()
        .setDefaultRequestConfig(config)
        .build()) {

    String json = "{\"name\":\"Max\"}";
    HttpPost post = new HttpPost("https://api.beispiel.de/users");
    post.setEntity(new StringEntity(json, ContentType.APPLICATION_JSON));
    post.setHeader("Authorization", "Bearer TOKEN");

    client.execute(post, response -> response.getReasonPhrase());
}
```

---

## 8. OkHttp

OkHttp von Square ist ein moderner HTTP-Client mit HTTP/2, Connection-Pooling, transparenter GZIP-Kompression und Cache.

```xml
<dependency>
    <groupId>com.squareup.okhttp3</groupId>
    <artifactId>okhttp</artifactId>
    <version>4.12.0</version>
</dependency>
```

```java
import okhttp3.*;
import java.util.concurrent.TimeUnit;

OkHttpClient client = new OkHttpClient.Builder()
    .connectTimeout(5, TimeUnit.SECONDS)
    .readTimeout(10, TimeUnit.SECONDS)
    .build();

Request request = new Request.Builder()
    .url("https://api.github.com/users/octocat")
    .header("Accept", "application/json")
    .get()
    .build();

try (Response response = client.newCall(request).execute()) {
    System.out.println("Status: " + response.code());
    System.out.println("Body: " + response.body().string());
}
```

---

## 9. Spring HTTP-Clients

| Client | Eingeführt | Modus | Empfehlung |
|---|---|---|---|
| RestTemplate | 2009 | Synchron | Maintenance Mode |
| WebClient | 2017 | Reaktiv, non-blocking | Für WebFlux |
| RestClient | 2023 | Synchron, Fluent | Empfohlen für neue synchrone Projekte |

### 9.1 RestTemplate

```java
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

RestTemplate rest = new RestTemplate();

User user = rest.getForObject(
    "https://api.github.com/users/octocat", User.class);

User neu = new User(0, "Anna", "anna@ex.de");
ResponseEntity<User> response = rest.postForEntity(
    "https://api.beispiel.de/users", neu, User.class);
```

### 9.2 RestClient — die moderne Lösung

```java
import org.springframework.web.client.RestClient;

RestClient client = RestClient.builder()
    .baseUrl("https://api.github.com")
    .defaultHeader("User-Agent", "Java-Fachmodul/1.0")
    .build();

User user = client.get()
    .uri("/users/octocat")
    .retrieve()
    .body(User.class);

User neu = new User(0, "Anna", "anna@ex.de");
User created = client.post()
    .uri("/users")
    .header("Authorization", "Bearer TOKEN")
    .body(neu)
    .retrieve()
    .body(User.class);
```

### 9.3 WebClient

```java
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

WebClient client = WebClient.builder()
    .baseUrl("https://api.github.com")
    .build();

Mono<User> userMono = client.get()
    .uri("/users/octocat")
    .retrieve()
    .bodyToMono(User.class);

userMono.subscribe(System.out::println);
```

---

## 10. JSON-Deserialisierung zu Java-Objekten

### 10.1 Pattern: Data-Transfer-Object (DTO)

```java
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public record WeatherResponse(
    @JsonProperty("name") String city,
    @JsonProperty("main") MainData main,
    @JsonProperty("weather") List<Weather> weather
) {
    public record MainData(
        @JsonProperty("temp") double temperature,
        @JsonProperty("humidity") int humidity
    ) {}

    public record Weather(
        @JsonProperty("description") String description
    ) {}
}
```

### 10.2 Robuste Konfiguration

```java
ObjectMapper mapper = new ObjectMapper()
    .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
    .configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true)
    .registerModule(new JavaTimeModule());
```

### 10.3 Fehlerbehandlung

```java
try {
    User user = mapper.readValue(json, User.class);
} catch (JsonProcessingException e) {
    log.error("Parse-Fehler: {}", e.getOriginalMessage());
} catch (MismatchedInputException e) {
    log.error("Feldtyp-Fehler bei: {}", e.getPathReference());
}
```

---

## 11. Authentifizierung

### 11.1 API-Key

```java
HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://api.openweathermap.org/data/2.5/weather?q=Berlin&appid=DEIN_KEY"))
    .GET()
    .build();
```

Im Header (besser, nicht in Logs):

```java
.header("X-API-Key", "dein-api-key")
```

### 11.2 Bearer Token (OAuth 2.0 / JWT)

```java
HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://api.beispiel.de/protected"))
    .header("Authorization", "Bearer MEIN_TOKEN")
    .GET()
    .build();
```

**Aufbau eines JWT**: `Header.Payload.Signature`

### 11.3 OAuth 2.0 Authorization Code Flow

```
Browser             Java-App           Auth-Server         Resource-Server
   |                    |                   |                     |
   |  Klick "Login"     |                   |                     |
   |------------------->|                   |                     |
   |                    |  Redirect to Auth |                     |
   |<-------------------|----------------->|                     |
   |   User-Login + Consent                                                  |
   |---------------------------------------------->|                     |
   |   Redirect mit ?code=XYZ                                                  |
   |<----------------------------------------------|                     |
   |   ?code=XYZ      |                   |                     |
   |------------------>|                   |                     |
   |                    |  POST /token     |                     |
   |                    |----------------->|                     |
   |                    |  access_token + refresh_token            |
   |                    |<----------------|                     |
   |                    |  GET /api mit Bearer                     |
   |                    |--------------------------------------------->|
   |                    |  Protected Resource                       |
   |                    |<---------------------------------------------|
```

### 11.4 Bearer-Token mit Java HttpClient

```java
public class BearerAuthDemo {
    public static void main(String[] args) throws Exception {
        String token = System.getenv("GITHUB_TOKEN");
        if (token == null || token.isBlank()) {
            throw new IllegalStateException("GITHUB_TOKEN nicht gesetzt");
        }

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://api.github.com/user"))
            .header("Authorization", "Bearer " + token)
            .header("Accept", "application/vnd.github+json")
            .GET()
            .build();

        HttpResponse<String> response = client.send(
            request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() == 401) {
            System.err.println("Token ungültig oder abgelaufen");
        } else {
            System.out.println(response.body());
        }
    }
}
```

> **Wichtig:** API-Keys NIE im Code committen — `.env`/Vault nutzen.

---

## 12. Fehlerbehandlung und Resilience-Patterns

### 12.1 Häufige Exceptions

| Exception | Wann |
|---|---|
| `java.net.ConnectException` | Server nicht erreichbar |
| `java.net.http.HttpTimeoutException` | Timeout überschritten |
| `HttpResponse.statusCode() != 2xx` | Logischer Fehler |
| `com.fasterxml.jackson.core.JsonProcessingException` | JSON-Parse-Fehler |

### 12.2 Retry mit Resilience4j

```java
import io.github.resilience4j.retry.annotation.Retry;

@Retry(name = "weatherApi", fallbackMethod = "fallbackWeather")
public String getWeather(String city) {
    return client.get()
        .uri(uri -> uri.path("/weather")
            .queryParam("q", city)
            .queryParam("appid", System.getenv("OWM_KEY"))
            .build())
        .retrieve()
        .body(String.class);
}

private String fallbackWeather(String city, Throwable t) {
    return "{\"city\":\"" + city + "\",\"temp\":0,\"note\":\"Fallback\"}";
}
```

Konfiguration:

```yaml
resilience4j:
  retry:
    instances:
      weatherApi:
        max-attempts: 4
        wait-duration: 1s
        exponential-backoff-multiplier: 2
```

### 12.3 Manueller Retry mit Exponential Backoff

```java
public static <T> T retryWithBackoff(
        Supplier<T> action, int maxAttempts, long initialDelayMs) {

    RuntimeException last = null;
    long delay = initialDelayMs;
    for (int i = 1; i <= maxAttempts; i++) {
        try {
            return action.get();
        } catch (RuntimeException e) {
            last = e;
            if (i == maxAttempts) break;
            try {
                Thread.sleep(delay);
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                throw new RuntimeException("Aborted during retry", ie);
            }
            delay *= 2;
        }
    }
    throw new RuntimeException("Failed after " + maxAttempts + " attempts", last);
}
```

---

## 13. Praxisbeispiel: OpenWeatherMap API

### 13.1 Setup

1. Account auf [openweathermap.org](https://openweathermap.org/api) erstellen
2. API-Key generieren (kostenloser Tier: 60 Calls/Min)
3. Warten ~10 Min bis Key aktiviert ist

### 13.2 Endpoint

```
GET https://api.openweathermap.org/data/2.5/weather
?q={city}&appid={key}&units=metric
```

### 13.3 Beispiel-Response (Auszug)

```json
{
  "name": "Berlin",
  "main": {"temp": 18.5, "humidity": 72, "pressure": 1013},
  "weather": [{"description": "leicht bewölkt", "icon": "02d"}],
  "wind": {"speed": 3.2}
}
```

### 13.4 Vollständiger Java-Client

```java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class OpenWeatherMapClient {
    private static final String BASE = "https://api.openweathermap.org/data/2.5/weather";
    private final HttpClient httpClient;
    private final String apiKey;

    public OpenWeatherMapClient(String apiKey) {
        this.apiKey = apiKey;
        this.httpClient = HttpClient.newBuilder()
            .connectTimeout(java.time.Duration.ofSeconds(5))
            .build();
    }

    public WeatherResponse getWeather(String city) throws Exception {
        String encodedCity = URLEncoder.encode(city, StandardCharsets.UTF_8);
        String url = BASE + "?q=" + encodedCity + "&appid=" + apiKey + "&units=metric&lang=de";

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(url))
            .header("Accept", "application/json")
            .timeout(java.time.Duration.ofSeconds(10))
            .GET()
            .build();

        HttpResponse<String> response = httpClient.send(
            request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() == 401) {
            throw new SecurityException("API-Key ungültig");
        } else if (response.statusCode() == 404) {
            throw new IllegalArgumentException("Stadt nicht gefunden: " + city);
        } else if (response.statusCode() == 429) {
            throw new IllegalStateException("Rate-Limit erreicht");
        } else if (response.statusCode() >= 500) {
            throw new IllegalStateException("Server-Fehler: " + response.statusCode());
        }

        return parseJson(response.body());
    }

    private WeatherResponse parseJson(String json) throws Exception {
        return new com.fasterxml.jackson.databind.ObjectMapper()
            .readValue(json, WeatherResponse.class);
    }
}
```

### 13.5 Verwendung

```java
public class App {
    public static void main(String[] args) {
        String key = System.getenv("OWM_API_KEY");
        OpenWeatherMapClient client = new OpenWeatherMapClient(key);
        try {
            WeatherResponse w = client.getWeather("Berlin");
            System.out.printf("Berlin: %.1f°C, %s%n",
                w.main().temperature(),
                w.weather().get(0).description());
        } catch (Exception e) {
            System.err.println("Fehler: " + e.getMessage());
        }
    }
}
```

---

## 14. Praxisbeispiel: GitHub REST API

### 14.1 Öffentliche Endpoints

```
GET https://api.github.com/users/{username}
GET https://api.github.com/users/{username}/repos
GET https://api.github.com/repos/{owner}/{repo}/issues
```

### 14.2 Java-Code

```java
public class GitHubUserFetcher {
    private final HttpClient client = HttpClient.newHttpClient();

    public record GithubUser(String login, String name, int followers, String bio) {}

    public GithubUser fetch(String username) throws Exception {
        HttpRequest req = HttpRequest.newBuilder()
            .uri(URI.create("https://api.github.com/users/" + username))
            .header("Accept", "application/vnd.github+json")
            .header("X-GitHub-Api-Version", "2022-11-28")
            .GET()
            .build();

        HttpResponse<String> resp = client.send(req,
            HttpResponse.BodyHandlers.ofString());

        if (resp.statusCode() == 404) {
            throw new IllegalArgumentException("User existiert nicht");
        }
        if (resp.statusCode() == 403 && resp.body().contains("rate limit")) {
            throw new IllegalStateException("Rate-Limit erreicht");
        }

        return new com.fasterxml.jackson.databind.ObjectMapper()
            .readValue(resp.body(), GithubUser.class);
    }

    public static void main(String[] args) throws Exception {
        var fetcher = new GitHubUserFetcher();
        GithubUser user = fetcher.fetch("octocat");
        System.out.printf("%s (%s) hat %d Follower%n",
            user.name(), user.login(), user.followers());
    }
}
```

### 14.3 Authentifizierte Requests

```java
String token = System.getenv("GITHUB_TOKEN");

HttpRequest req = HttpRequest.newBuilder()
    .uri(URI.create("https://api.github.com/user"))
    .header("Authorization", "Bearer " + token)
    .header("Accept", "application/vnd.github+json")
    .header("X-GitHub-Api-Version", "2022-11-28")
    .GET()
    .build();
```

Mit Token: 5.000 Requests/Stunde statt 60.

---

## 15. Asynchrone Verarbeitung mit CompletableFuture

### 15.1 Warum asynchron?

- Skalierbarkeit: Ein Thread kann mehrere Anfragen parallel
- Latenz: Gesamtdauer = Maximum, nicht Summe
- Ressourcen: Threads sind teuer (1 MB Stack)

### 15.2 HTTP-Requests parallelisieren

```java
public CompletableFuture<List<String>> fetchAllUrls(List<String> urls) {
    HttpClient client = HttpClient.newHttpClient();

    List<CompletableFuture<String>> futures = urls.stream()
        .map(url -> client.sendAsync(
            HttpRequest.newBuilder(URI.create(url)).GET().build(),
            HttpResponse.BodyHandlers.ofString())
            .thenApply(HttpResponse::body))
        .toList();

    return CompletableFuture.allOf(futures.toArray(new CompletableFuture[0]))
        .thenApply(v -> futures.stream()
            .map(CompletableFuture::join)
            .toList());
}
```

### 15.3 Exception-Handling

```java
client.sendAsync(req, BodyHandlers.ofString())
    .thenApply(HttpResponse::body)
    .thenAccept(System.out::println)
    .exceptionally(ex -> {
        log.error("Fehler beim Request", ex);
        return null;
    });
```

### 15.4 Compose vs. Combine

```java
// thenCompose: nächster Schritt gibt Future zurück
CompletableFuture<String> result = fetchUserAsync(id)
    .thenCompose(user -> fetchReposAsync(user.login()));

// thenCombine: zwei parallele Futures kombinieren
CompletableFuture<String> combined = fetchUserAsync(id)
    .thenCombine(fetchReposAsync(id), (user, repos) ->
        user + " hat " + repos.size() + " Repos");
```

---

## 16. Tests und Mocking

### 16.1 WireMock für End-to-End-Tests

```xml
<dependency>
    <groupId>org.wiremock.integrations</groupId>
    <artifactId>wiremock-spring-boot</artifactId>
    <version>3.5.4</version>
    <scope>test</scope>
</dependency>
```

```java
@SpringBootTest
@AutoConfigureWireMock(port = 0)
class WeatherServiceTest {

    @Autowired private WeatherService service;

    @Test
    void shouldReturnWeather() {
        stubFor(get(urlPathEqualTo("/weather"))
            .willReturn(aResponse()
                .withStatus(200)
                .withHeader("Content-Type", "application/json")
                .withBody("""
                    {"name":"Berlin","main":{"temp":20.0,"humidity":50}}
                    """)));

        WeatherResponse w = service.getWeather("Berlin");
        assertThat(w.city()).isEqualTo("Berlin");
        assertThat(w.main().temperature()).isEqualTo(20.0);
    }
}
```

### 16.2 Mockito für Unit-Tests

```java
@ExtendWith(MockitoExtension.class)
class GitHubFetcherTest {
    @Mock private HttpClient httpClient;

    @Test
    void shouldParseUser() throws Exception {
        HttpResponse<String> mockResp = mock(HttpResponse.class);
        when(mockResp.statusCode()).thenReturn(200);
        when(mockResp.body()).thenReturn(
            "{\"login\":\"octocat\",\"name\":\"The Octocat\"}");
        when(httpClient.send(any(), any())).thenReturn(mockResp);

        var fetcher = new GitHubUserFetcher(httpClient);
        var user = fetcher.fetch("octocat");
        assertThat(user.login()).isEqualTo("octocat");
    }
}
```

---

## 17. Logging und Observability

### 17.1 Request/Response loggen

```java
public class LoggingFilter {
    private static final Logger log = LoggerFactory.getLogger(LoggingFilter.class);

    public static HttpResponse<String> logAndSend(
            HttpClient client, HttpRequest request) throws Exception {

        log.debug("HTTP-Request: {} {}", request.method(), request.uri());
        request.headers().map().forEach((k, v) ->
            log.trace("Header {}: {}", k, v));

        HttpResponse<String> response = client.send(
            request, HttpResponse.BodyHandlers.ofString());

        log.debug("HTTP-Response: Status {} für {}",
            response.statusCode(), request.uri());
        return response;
    }
}
```

### 17.2 Micrometer für Metriken

```java
@Timed(value = "http.requests", description = "HTTP-Request-Dauer")
public WeatherResponse getWeather(String city) {
    // ... Request
}
```

---

## 18. Bild- und Diagrammverweise

- HTTP-Lebenszyklus: <https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/http_lifecycle.png>
- HTTP Request/Response: <https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/http_request_response.png>
- OAuth 2.0 Flow: <https://oauth.net/getting-started/images/oauth-sequence-horizontal.png>
- Spring WebClient Stack: <https://docs.spring.io/spring-framework/reference/images/webflux-architecture.png>
- Apache HttpClient Architektur: <https://hc.apache.org/httpcomponents-client-5.2.x/current/images/httpcomponents-clientside.png>

---

## 19. Best Practices

| Empfehlung | Begründung |
|---|---|
| HTTP-Client einmal als Bean/Statisch erzeugen | Connection-Pooling |
| Timeouts IMMER setzen | Hängende Requests blockieren |
| `Retry-After`-Header beachten | Server-Quota respektieren |
| API-Keys NIE im Code committen | Sicherheit, .env/Vault |
| HTTPS verwenden | Verschlüsselung |
| Records für DTOs | Immutable, weniger Boilerplate |
| Response-Status vor Body parsen | 401/403 sofort erkennen |
| `@JsonIgnoreProperties(UNKNOWN)` | Robust gegen API-Erweiterungen |
| Resilience4j statt eigener Retry-Logik | Bewährt, deklarativ, getestet |
| WireMock für API-Tests | Kein Live-API im Test |
| `User-Agent`-Header setzen | APIs wie GitHub blockieren Default |
| CompletableFuture für parallele Calls | Skalierbarkeit |

---

## 20. Quellen

- Oracle – HttpClient: <https://docs.oracle.com/en/java/javase/11/docs/api/java.net.http/java/net/http/HttpClient.html>
- Spring HTTP Clients: <https://spring.io/blog/2025/09/30/the-state-of-http-clients-in-spring/>
- Apache HttpClient: <https://hc.apache.org/httpcomponents-client-5.2.x/current/>
- OkHttp: <https://square.github.io/okhttp/>
- Jackson: <https://github.com/FasterXML/jackson>
- Resilience4j: <https://resilience4j.readme.io/>
- OpenWeatherMap: <https://openweathermap.org/api>
- GitHub REST: <https://docs.github.com/en/rest>
- OAuth 2.0 RFC 6749: <https://datatracker.ietf.org/doc/html/rfc6749>
- Richardson Maturity Model: <https://martinfowler.com/articles/richardsonmaturitymodel.html>

---

## 21. Zusammenfassung

REST APIs sind das Rückgrat moderner Microservice-Architekturen. Java bietet mehrere ausgereifte HTTP-Clients: den eingebauten `java.net.http.HttpClient`, Apache HttpClient 5, OkHttp und Spring-Clients (RestTemplate, RestClient, WebClient). Asynchrone Verarbeitung erfolgt über `CompletableFuture`. Authentifizierung läuft über API-Keys oder OAuth 2.0/JWT-Bearer-Tokens.

### Wichtigste Merksätze

1. `java.net.http.HttpClient` (Java 11+) ist die eingebaute Wahl.
2. Asynchrone Calls über `sendAsync()` und `CompletableFuture` skalieren besser.
3. Timeouts IMMER setzen (Connect- und Request-Timeout).
4. API-Keys gehören in Umgebungsvariablen oder Vault, nie in den Code.
5. HTTP-Status-Codes strukturieren Fehlerbehandlung.
6. Records eignen sich als DTOs (Java 16+).
7. `RestClient` ist die moderne Spring-Empfehlung.
8. Resilience4j bietet deklaratives Retry, Circuit Breaker, Time Limiter.
9. WireMock isoliert API-Tests von Live-Systemen.
10. `@JsonIgnoreProperties(UNKNOWN)` schützt vor API-Erweiterungen.

### Selbsttest-Checkliste

- [ ] Ich erläutere REST-Constraints und Richardson Maturity Model.
- [ ] Ich wähle die passende HTTP-Client-Bibliothek.
- [ ] Ich konfiguriere Timeouts.
- [ ] Ich nutze Bearer-Token und API-Keys korrekt.
- [ ] Ich parallelisiere Anfragen mit `CompletableFuture`.
- [ ] Ich implementiere Retry- und Fehlerbehandlung.
- [ ] Ich teste APIs mit WireMock.

---

*Stand: Java 21 LTS — Quelle: https://moodle.oszimt.de/course/view.php?id=2615 — Recherche 2026*

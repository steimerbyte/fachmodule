# Fachmodul: Netzwerke und Dienste bereitstellen

**Kurs-ID:** 3600
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3600

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was sind Netzwerkdienste?](#2-was-sind-netzwerkdienste)
3. [DHCP – Dynamic Host Configuration Protocol](#3-dhcp--dynamic-host-configuration-protocol)
4. [DNS – Domain Name System](#4-dns--domain-name-system)
5. [Webserver (HTTP/HTTPS)](#5-webserver-httphttps)
6. [E-Mail-Dienste (SMTP, IMAP, POP3)](#6-e-mail-dienste-smtp-imap-pop3)
7. [Verzeichnisdienste (LDAP, Active Directory)](#7-verzeichnisdienste-ldap-active-directory)
8. [File-Server (SMB, NFS)](#8-file-server-smb-nfs)
9. [VPN und Fernzugriff](#9-vpn-und-fernzugriff)
10. [DHCPv6 und DNS64](#10-dhcpv6-und-dns64)
11. [Service Level und Monitoring](#11-service-level-und-monitoring)
12. [Übungen](#12-übungen)
13. [Zusammenfassung](#13-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die wichtigsten Netzwerkdienste benennen und erklären,
- DHCP, DNS, Web, E-Mail, Verzeichnisdienste und File-Server einrichten,
- DHCPv6 und DNS64 im Dual-Stack-Betrieb verstehen,
- VPN-Lösungen planen,
- Monitoring und SLAs aufsetzen.

---

## 2. Was sind Netzwerkdienste?

**Netzwerkdienste** (Network Services) sind Serverdienste, die im Netzwerk für Clients bereitgestellt werden.

**Wichtige Dienste:**

- **DHCP**: dynamische IP-Vergabe
- **DNS**: Namensauflösung
- **Web**: HTTP/HTTPS
- **E-Mail**: SMTP, IMAP, POP3
- **Verzeichnisdienst**: LDAP, Active Directory
- **Datei**: SMB (Windows), NFS (Linux)
- **VPN**: Fernzugriff
- **PKI**: Zertifikate

**Bereitstellungsmodelle:**

- **On-Premises**: lokale Server im eigenen Rechenzentrum
- **Cloud**: SaaS, IaaS, PaaS bei AWS, Azure, Google Cloud
- **Hybrid**: Mischung

---

## 3. DHCP – Dynamic Host Configuration Protocol

(Siehe auch Fachmodul 3600.)

### 3.1 Funktionsweise

DHCP weist Clients automatisch IP-Konfiguration zu:

- IP-Adresse
- Subnetzmaske
- Default-Gateway
- DNS-Server
- Lease-Zeit

### 3.2 Ablauf (DORA)

```
1. DISCOVER (Client broadcastet)
2. OFFER (Server bietet an)
3. REQUEST (Client fordert an)
4. ACKNOWLEDGE (Server bestätigt)
```

### 3.3 Konfiguration

```
# /etc/dhcp/dhcpd.conf
subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.100 192.168.1.200;
    option routers 192.168.1.1;
    option domain-name-servers 8.8.8.8, 1.1.1.1;
    default-lease-time 600;
    max-lease-time 7200;
}
```

### 3.4 DHCP-Sicherheit

- **DHCP Snooping** (Switch-Funktion): nur vertrauenswürdige Ports erlauben DHCP-Server
- **DHCP Authentifizierung** (802.1X)
- Statische DHCP-Reservierungen für kritische Geräte

---

## 4. DNS – Domain Name System

### 4.1 Funktionsweise

DNS übersetzt Domainnamen in IP-Adressen.

### 4.2 DNS-Server-Rollen

| Rolle | Beschreibung |
|---|---|
| **Resolver** (Client) | fragt Nameserver |
| **Recursive Resolver** | fragt rekursiv andere Server |
| **Authoritative Nameserver** | autoritativ für eine Zone |
| **Root-Server** | Top-Level-DNS (13 logische Server) |
| **TLD-Server** | .com, .de, .org etc. |

### 4.3 DNS-Records

| Typ | Zweck |
|---|---|
| **A** | IPv4-Adresse |
| **AAAA** | IPv6-Adresse |
| **CNAME** | Alias |
| **MX** | Mail-Server |
| **NS** | Name-Server |
| **TXT** | Text (SPF, DKIM) |
| **PTR** | Reverse Lookup |
| **SOA** | Start of Authority |

### 4.4 BIND-Konfiguration

```
# /etc/bind/named.conf.local
zone "beispiel.de" {
    type master;
    file "/etc/bind/db.beispiel.de";
};
```

### 4.5 Sicherheit

- **DNSSEC**: digitale Signaturen für DNS-Records
- **DNS over HTTPS (DoH)**: verschlüsselt
- **DNS over TLS (DoT)**: verschlüsselt

---

## 5. Webserver (HTTP/HTTPS)

### 5.1 Webserver-Software

- **Apache HTTP Server**: weit verbreitet, Open Source
- **Nginx**: hochperformant, Reverse Proxy
- **Microsoft IIS**: Windows-Standard
- **LiteSpeed**: performanter Apache-Klon

### 5.2 Virtual Hosts

Ein Server, mehrere Domains:

```
<VirtualHost *:80>
    ServerName www.beispiel.de
    DocumentRoot /var/www/beispiel
</VirtualHost>

<VirtualHost *:443>
    ServerName www.beispiel.de
    DocumentRoot /var/www/beispiel
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/beispiel.crt
</VirtualHost>
```

### 5.3 HTTPS / TLS

- **Let's Encrypt**: kostenlose Zertifikate
- **TLS 1.3**: aktuelle Version
- **HSTS**: HTTP Strict Transport Security
- **Cipher-Suites**: nur starke Algorithmen zulassen

---

## 6. E-Mail-Dienste (SMTP, IMAP, POP3)

### 6.1 Protokolle

| Protokoll | Port | Funktion |
|---|---|---|
| **SMTP** | 25 (587 für Submission) | Mail-Versand |
| **POP3** | 110 (995 TLS) | Mail-Abholung (Download) |
| **IMAP** | 143 (993 TLS) | Mail-Synchronisation (Server) |
| **SMTPS** | 465 (TLS) | Verschlüsselt |

### 6.2 Mailserver-Software

- **Postfix**: weit verbreitet, sicher, Open Source
- **Sendmail**: klassisch, komplex
- **Exim**: Debian-Standard
- **Microsoft Exchange**: Enterprise, kommerziell
- **Zimbra, iRedMail**: Komplettpakete

### 6.3 SPF, DKIM, DMARC

E-Mail-Authentifizierung gegen Spam und Phishing:

- **SPF (Sender Policy Framework)**: erlaubt IP-Bereiche
- **DKIM (DomainKeys Identified Mail)**: digitale Signatur
- **DMARC**: Policy für SPF/DKIM-Fehler

---

## 7. Verzeichnisdienste (LDAP, Active Directory)

### 7.1 LDAP (Lightweight Directory Access Protocol)

- Hierarchische Datenbank
- Speichert Benutzer, Gruppen, Computer
- Basis für Single Sign-On

### 7.2 Active Directory (AD)

- Microsoft-Implementierung von LDAP + Kerberos + DNS
- Zentrales Identitätsmanagement in Windows-Netzwerken
- Group Policies für zentrale Konfiguration

### 7.3 Open-Source-Alternativen

- **OpenLDAP**: Standard-LDAP
- **FreeIPA**: AD-Alternative für Linux
- **389 Directory Server**: Red Hat
- **Samba**: AD-kompatibel für Linux

---

## 8. File-Server (SMB, NFS)

### 8.1 SMB/CIFS (Server Message Block)

- Windows-Standard für Datei-Freigaben
- Heute oft als **SMBv3** mit Verschlüsselung
- Linux-Zugriff über Samba

### 8.2 NFS (Network File System)

- Linux/Unix-Standard
- Version 4 mit starker Authentifizierung (Kerberos)
- Gut für Linux-zu-Linux-Freigaben

### 8.3 Auswahl

| Einsatz | Empfehlung |
|---|---|
| Windows-zu-Windows | SMB |
| Linux-zu-Linux | NFS |
| Gemischt | Samba |

---

## 9. VPN und Fernzugriff

### 9.1 VPN-Typen

- **Site-to-Site VPN**: Standort-zu-Standort
- **Remote Access VPN**: einzelner Client zu Netzwerk
- **SSL/TLS VPN** (z. B. OpenVPN, WireGuard)
- **IPsec VPN**: traditionell, IPsec-Tunnel

### 9.2 Vergleich

| Lösung | Protokoll | Komplexität | Performance |
|---|---|---|---|
| **WireGuard** | UDP | niedrig | hoch |
| **OpenVPN** | TCP/UDP | mittel | gut |
| **IPsec** | ESP/AH | hoch | hoch |
| **WireGuard + Linux** | UDP | sehr niedrig | sehr hoch |

### 9.3 Remote Access

- **WireGuard**: modern, einfach, schnell
- **OpenVPN**: bewährt, weit verbreitet
- **Tailscale, ZeroTier**: Zero-Config-VPN
- **Cisco AnyConnect**: Enterprise

---

## 10. DHCPv6 und DNS64

### 10.1 IPv6-Adressierung

- **Stateless Address Autoconfiguration (SLAAC)**: Client wählt Adresse selbst
- **Stateful DHCPv6**: Server vergibt Adressen
- Beide mit oder ohne DNS

### 10.2 DNS64 + NAT64

- Übersetzung IPv6 ↔ IPv4
- Wichtig im Übergang von IPv4 zu IPv6

---

## 11. Service Level und Monitoring

### 11.1 SLA (Service Level Agreement)

- Verfügbarkeit (z. B. 99,9 % = 8,76 h Ausfall/Jahr)
- Antwortzeit
- Wiederherstellungszeit

### 11.2 Monitoring-Tools

- **Prometheus + Grafana**: Open Source, sehr verbreitet
- **Zabbix**: Komplettlösung
- **Nagios**: klassisch
- **PRTG, Solarwinds**: kommerziell

### 11.3 Überwachungsmetriken

- CPU, RAM, Disk
- Netzwerkdurchsatz, Latenz, Paketverlust
- Diensteverfügbarkeit (HTTP-Status)
- Log-Analyse

---

## 12. Übungen

### Übung 1 — DHCP

Konfigurieren Sie einen DHCP-Server für das Netz 192.168.50.0/24.

### Übung 2 — DNS

Richten Sie eine DNS-Zone für beispiel.de ein.

### Übung 3 — Webserver

Konfigurieren Sie Apache mit Virtual Hosts für www und api.

### Übung 4 — VPN

Erstellen Sie ein WireGuard-VPN zwischen zwei Standorten.

### Übung 5 — Monitoring

Setzen Sie Prometheus + Grafana zur Überwachung auf.

---

## 13. Zusammenfassung

**Netzwerkdienste** sind das Rückgrat jedes Netzwerks:

| Dienst | Funktion |
|---|---|
| DHCP | Dynamische IP-Vergabe |
| DNS | Namensauflösung |
| Web | HTTP/HTTPS |
| E-Mail | SMTP, IMAP, POP3 |
| Verzeichnis | LDAP, AD |
| Datei | SMB, NFS |
| VPN | Fernzugriff |

**Bereitstellung:**

- On-Premises, Cloud oder Hybrid
- Hohe Verfügbarkeit durch Redundanz
- Monitoring mit Prometheus/Grafana

### Selbsttest-Checkliste

- [ ] Ich konfiguriere DHCP und DNS.
- [ ] Ich richte Webserver mit HTTPS ein.
- [ ] Ich betreibe Mailserver mit SPF/DKIM/DMARC.
- [ ] Ich implementiere VPN.
- [ ] Ich nutze Monitoring-Tools.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3600 — Recherche 2026*

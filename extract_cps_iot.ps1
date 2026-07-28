# Moodle Course 2865 - Cyber-physische Systeme / Internet of Things
# Extract all text pages

$outputFile = "C:/Users/benjamin.steimer/workspace/osz-fachmodule/2865_Fachmodul-Cyber-physische-Systeme-IoT.md"
$baseUrl = "https://moodle.oszimt.de/mod/page/view.php?id="

# Page IDs to extract (text pages only)
$pageIds = @(
    "278539",  # Was ist ein Service und was ist ein Wert im IT Service Management?
    "272768",  # Was steckt hinter ITIL® ?
    "282063",  # Information: Incident
    "282064",  # Information: Incident Management
    "282066",  # Information: Service Desk
    "282077",  # Information: Problem
    "282080",  # Information: Problem Management
    "282085",  # Information: Change
    "285481",  # Information: Change Enablement
    "285192",  # Information: Service Request
    "285193",  # Information: Service Request Management
    "691764",  # Übungsaufgabe - Service-Request vs. Incident
    "292643",  # Information: Service Level Agreement (SLA)
    "282106",  # Information: SLA, OLA und UC (Deutsch)
    "624513",  # Information: SLA, OLA und UC (Englisch)
    "292644",  # Information: Service Level Management
    "355346",  # Information: Configuration Item ("CI")
    "355347",  # Information: Service Configuration Management
    "355338",  # Information: Release und Deployment
    "355340"   # Information: Release Management
)

Write-Host "Starting extraction of $($pageIds.Count) pages..."

# Start markdown file
$header = @"
# Fachmodul: Cyber-physische Systeme / Internet of Things

Kurs-ID: 2865
Quelle: https://moodle.oszimt.de/course/view.php?id=2865
Datum: $(Get-Date -Format "yyyy-MM-dd HH:mm")

---

"@

$header | Out-File -FilePath $outputFile -Encoding UTF8

$extractedPages = @()

foreach ($pageId in $pageIds) {
    $url = $baseUrl + $pageId
    Write-Host "Extracting: $url"
    
    # Use chrome extension to navigate
    $navResult = chrome_navigate -url $url -background `$false
    
    # Wait for page load
    Start-Sleep -Milliseconds 1500
    
    # Extract content using JavaScript
    $jsCode = @'
(() => {
  const h1 = document.querySelector('h1')?.textContent?.trim() || 'No title';
  const main = document.querySelector('[role="main"]') || document.querySelector('main');
  if (!main) return { title: h1, content: document.body.innerText };
  const content = main.cloneNode(true);
  const removeSelectors = [
    'nav', '.breadcrumb', '.moremenu', '.drawer-toggler', 
    '[aria-hidden="true"]', '.secondary', '.course-content',
    '.section', '.activity', '.actions', '.activity-navigation',
    'button', '.全体导航', '.course-section'
  ];
  removeSelectors.forEach(sel => {
    try { content.querySelectorAll(sel).forEach(el => el.remove()); } catch(e) {}
  });
  const text = content.innerText.replace(/\s+/g, ' ').trim();
  return { title: h1, content: text.substring(0, 15000) };
})()
'@
    
    $result = chrome_evaluate -expression $jsCode -background `$false
    
    if ($result) {
        $extractedPages += @{
            id = $pageId
            title = $result.title
            content = $result.content
        }
        Write-Host "  -> Extracted: $($result.title)"
    }
    
    Start-Sleep -Milliseconds 500
}

# Write all extracted content to markdown
foreach ($page in $extractedPages) {
    $mdContent = @"

## $($page.title)

**Seiten-ID:** $($page.id)
**URL:** https://moodle.oszimt.de/mod/page/view.php?id=$($page.id)

---

$($page.content)

---

"@
    $mdContent | Out-File -FilePath $outputFile -Append -Encoding UTF8
}

Write-Host "Extraction complete! File saved to: $outputFile"
Write-Host "Total pages extracted: $($extractedPages.Count)"

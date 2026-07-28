# Scraping Plan - Full Content Extraction

## Approach

To get the **full content** of each course, I need to:

1. **Course page** (`/course/view.php?id=...`) - Get the course title, description, sections, and all activity links
2. **Text pages** (`/mod/page/view.php?id=...`) - These contain the actual lesson content (Markdown/HTML)
3. **Resource files** (`/mod/resource/view.php?id=...`) - These are usually PDFs/images that are downloaded
4. **URLs** (`/mod/url/view.php?id=...`) - External links, can be visited to capture target content
5. **Book modules** (`/mod/book/view.php?id=...`) - Multi-page books with chapters

## Extraction Function

For each course, I'll use this JavaScript to get the course page content:
```js
(() => {
  const main = document.querySelector('main, [role="main"]');
  if (!main) return { title: document.title, text: '' };
  const content = main.cloneNode(true);
  content.querySelectorAll('nav, .breadcrumb, .moremenu, .drawer-toggler, [aria-hidden="true"]').forEach(el => el.remove());
  return {
    title: document.title,
    text: content.innerText,
    pageLinks: Array.from(document.querySelectorAll('a[href*="/mod/page/view.php"]'))
      .map(a => ({ text: a.textContent.trim().replace(/ Textseite$/, ''), href: a.href.split('?')[0] + '?' + a.href.split('?')[1] }))
      .filter((v, i, a) => a.findIndex(t => t.href === v.href) === i)
      .filter(l => l.text && l.text.length > 2 && l.text !== 'Erweiterte Suche')
  };
})()
```

For each text page found, visit it and extract:
```js
(() => {
  const main = document.querySelector('main, [role="main"]');
  if (!main) return { title: document.title, text: '' };
  const content = main.cloneNode(true);
  content.querySelectorAll('nav, .breadcrumb, .moremenu, .drawer-toggler, [aria-hidden="true"]').forEach(el => el.remove());
  return {
    title: document.title,
    text: content.innerText,
    html: content.innerHTML
  };
})()
```

## Strategy

1. For each course, extract all activities and text pages
2. For each text page, fetch its content
3. Compile everything into one comprehensive Markdown file
4. Save all original PDF/HTML assets to a `media/` subfolder

## Tools Used

- `chrome_navigate` - Navigate to URLs
- `chrome_evaluate` - Extract page content
- `write` - Save Markdown files
- `bash` - Download PDFs/HTML files

## Courses to Scrape with Full Content

- All ~90 Fachmodule courses
- For each: extract course page + all text pages
- Total: ~90 courses × 1-10 text pages = 100-500 page extractions

## Image Extraction

For images, I'll use the `/mod/resource/view.php?id=...` URLs which often lead to images.
Also, image URLs can be found in the HTML of text pages: `<img src="...">`.

The `pluginfile.php` URLs are the actual file URLs in Moodle.

## Output Format

```markdown
# {COURSE TITLE}

**Kurs-ID:** {ID}
**Kategorie:** {BREADCRUMB}
**Quelle:** {URL}

---

## Beschreibung

{Page description}

## Inhalte / Themen

### Section 1

{Activity list}

## Textseiten-Inhalte

### ⭐ Page Title 1

{Page text content}

### Page Title 2

{Page text content}
...
```

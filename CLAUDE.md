# CLAUDE.md — Nexor AI Website Template

## What This Is

This is the **Nexor AI** website template: a generic, brandless **home‑services business** site
built to be customized per client. Every page ships with neutral placeholder content
(`Your Business Name`, `Service One`–`Service Six`, `[City]`, `[Region]`, `(555) 000-0000`,
`hello@yourbusiness.com`) and a neutral placeholder color system. When onboarding a real client,
swap the placeholders for that client's real business identity, services, service area, colors,
logo, photos, and copy — but **keep the structure, section rhythm, nav pattern, dark sections,
footer layout, and design system intact**.

> Treat the placeholder tokens as fill‑in‑the‑blank fields. Do not invent client facts; ask the
> operator or leave the placeholder until real content is provided.

### Placeholder token reference

| Token | Meaning |
| --- | --- |
| `Your Business Name` | The client's business name (wordmark + everywhere) |
| `Service One` … `Service Six` | The six core services (one dedicated page each) |
| `service-one.html` … `service-six.html` | Service page filenames under `/services/` |
| `[City]` | Primary city / physical-location city |
| `[City 2]` … `[City 6]` | Additional service-area cities, in priority order |
| `city-one.html` … `city-six.html` | City page filenames under `/areas/` |
| `[Region]` | The broader region the business serves |
| `(555) 000-0000` / `tel:+15550000000` | Phone (display / link) |
| `hello@yourbusiness.com` | Contact email |
| `yourbusiness.com` | Canonical domain (used in canonical/OG URLs + sitemap) |

### Placeholder color system (swap per client)

Defined once via CSS custom properties / Tailwind config and reused everywhere. Neutral by design
so a client palette drops in cleanly:

- **Neutral dark** `#1A1A2E` — dark backgrounds, dark sections, footer, structural surfaces.
- **Accent** `#E63946` — CTAs, highlights, accent text/icons. This is the single "pop" color and
  the easiest thing to rebrand: change the accent token and the site re-skins.
- Whites for body backgrounds, neutral grays for muted text.

Do not reintroduce a hardcoded brand palette until the client's real colors are confirmed. When
they are, update the CSS custom properties + Tailwind `theme.extend.colors` first, then sweep any
remaining inline color literals.

### Integration placeholders (wire up per client)

The template ships with clearly-marked placeholder comments where third‑party embeds go. Replace
the comment with the client's real embed when available:

- `<!-- GHL CONTACT FORM EMBED GOES HERE -->`
- `<!-- GHL CHAT WIDGET SCRIPT GOES HERE -->`
- `<!-- GHL EXTERNAL TRACKING SCRIPT GOES HERE -->`
- `<!-- GHL REVIEW WIDGET EMBED GOES HERE -->`
- `<!-- GOOGLE MAPS EMBED GOES HERE -->`
- Social share image: `brand_assets/og-image.jpg` (1200×630) — create before launch.

## Site Architecture

- Homepage (`index.html`)
- About (`about.html`)
- Contact / Thank You (`thank-you.html` — `noindex, nofollow`)
- 6 service pages at `/services/service-[one..six].html`
- 6 city pages at `/areas/city-[one..six].html`

## Always Do First

Invoke the **frontend-design** skill before writing any frontend code, every session, no exceptions.

## Content Writing Methodology

For all page COPY/content, read and follow `SEO-CONTENT-PROMPT.md` (in the project root) as the
PRIMARY writing methodology before writing any page content. Apply the COMPLETE methodology — the
writing mission, all optimization guidelines (Google Algorithm + AI Systems), the balanced writing
approach, content structure, language guidelines, quality signals, and the Words to Avoid list. The
Local SEO Requirements below govern TECHNICAL implementation and work in tandem. If wording/content
approach ever conflicts, `SEO-CONTENT-PROMPT.md` takes precedence.

## Local SEO Requirements (technical)

This is a local service business template — local SEO is the primary lead driver once customized.

### Per-page metadata (every page)
- Unique `<title>` under 60 chars: `"[Page Topic] | Your Business Name in [City]"`
- Unique `<meta name="description">` under 160 chars: include a service, a city, and a CTA with phone
- `<meta name="keywords">` with relevant local terms (service + city combinations)
- `<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">`
- `<link rel="canonical">` pointing to that page's own URL
- `<html lang="en">` and a proper viewport meta

### Open Graph + Twitter (every page)
- `og:title`, `og:description`, `og:url`, `og:type`, `og:image`, `og:locale`, `og:site_name`
- `twitter:card` (summary_large_image), `twitter:title`, `twitter:description`, `twitter:image`
- `og:image` / `twitter:image` → 1200×630 social share image (flag if not yet created)

### Structured Data (JSON-LD)
- Homepage: `LocalBusiness` schema. Include `name`, `telephone`, `email`, `priceRange`,
  `openingHoursSpecification`, `areaServed` (the cities), `hasOfferCatalog` (the six services).
  Add `PostalAddress` and `aggregateRating` only when the client has a real address / real reviews.
- Service pages: `Service` schema referencing the parent business.
- City pages: `areaServed` for that specific city.
- Validate at search.google.com/test/rich-results before launch.

### Visible on-page SEO
- Exactly ONE `<h1>` per page with the page's primary keyword
- H2/H3 for hierarchy, no skipped levels
- City names appear in human-readable body text, not just metadata
- Service + city combinations appear naturally in copy
- All images need descriptive alt text including service/location context where relevant

### City pages — anti-duplicate rule (critical when customizing)
- Each city page MUST have 30–40% unique content minimum
- Do NOT just swap the city name across otherwise-identical pages — Google penalizes doorway pages
- Reference local landmarks, neighborhoods, highways, or area-specific details per city
- Unique intro paragraph + unique "why [City] chooses us" angle per page

### Technical SEO files
- `sitemap.xml` listing all indexable pages (homepage, about, all service + city pages; exclude thank-you)
- `robots.txt` allowing crawl, disallowing the thank-you page, pointing to the sitemap
- Thank-you page must have `<meta name="robots" content="noindex, nofollow">`

### Title/description patterns
- Homepage: `"[Primary Service] & [Secondary] in [City] | Your Business Name"`
- Service page: `"[Service] in [City] | Your Business Name"`
- City page: `"[Primary Service] in [City] | Your Business Name"`

## Final CTA Section Pattern (every page)

All pages end with the same final CTA section just before the footer:
- Background: `brand_assets/cta-background.jpg` with a dark overlay (~55–65% opacity) for text readability
- Headline + supporting copy + dual CTAs (Call + Get a Free Quote)
- Same treatment across all pages for brand consistency

## Brand Assets

Always check the `brand_assets/` folder before designing. It may hold logos, color guides, style
guides, or images. If real assets exist there, use them — do not use placeholders where real assets
are available. If a logo is present, use it. If a palette is defined, use those exact values.

- Hero background: `brand_assets/Hero_background.jpg`
- Final-CTA background: `brand_assets/cta-background.jpg`
- Logo: styled text wordmark (`Your Business Name`) until a client logo is provided.

## Reference Images

For THIS template we build ORIGINAL pages from the brief, NOT matching a provided reference. The
reference-matching rules apply ONLY when a reference image is explicitly provided.

If a reference image is provided: match layout, spacing, typography, and color exactly. Swap in
placeholder content (images via https://placehold.co/, generic copy). Do not improve or add to the
design. Screenshot your output, compare against the reference, fix mismatches, re-screenshot — at
least 2 comparison rounds. Stop only when no visible differences remain or the user says so.

If no reference image: design from scratch with high craft (see guardrails below).

## Local Server

- Always serve on localhost — never screenshot a `file:///` URL.
- Start the dev server: `node serve.mjs` (serves the project root at http://localhost:3000).
- `serve.mjs` lives in the project root. Start it in the background before taking screenshots.
- If the server is already running, do not start a second instance.

## Screenshot Workflow

- Always screenshot from localhost: `node screenshot.mjs http://localhost:3000`
- Screenshots save to `./temporary screenshots/screenshot-N.png` (auto-incremented, never overwritten).
- Optional label suffix: `node screenshot.mjs http://localhost:3000 label` → `screenshot-N-label.png`
- `screenshot.mjs` lives in the project root. Use it as-is.
- After screenshotting, read the PNG from `temporary screenshots/` with the Read tool and analyze it.
- When comparing, be specific: "heading is 32px but reference shows ~24px", "card gap is 16px but should be 24px".
- Check: spacing/padding, font size/weight/line-height, colors (exact hex), alignment, border-radius, shadows, image sizing.

## Output Defaults

- Self-contained HTML files, styles inline in `<style>`/Tailwind config, unless the user says otherwise.
- Tailwind CSS via CDN: `<script src="https://cdn.tailwindcss.com"></script>`.
- Placeholder images: https://placehold.co/WIDTHxHEIGHT.
- Mobile-first responsive.

## Anti-Generic Guardrails

- **Colors**: Never use default Tailwind palette (indigo-500, blue-600, etc.). Drive everything from
  the brand tokens and derive shades from them.
- **Shadows**: Never use flat `shadow-md`. Use layered, color-tinted shadows with low opacity.
- **Typography**: Never use the same font for headings and body. Pair a display/serif with a clean
  sans. Tight tracking (-0.03em) on large headings, generous line-height (1.7) on body.
- **Gradients**: Layer multiple radial gradients. Add grain/texture via SVG noise filter for depth.
- **Animations**: Only animate `transform` and `opacity`. Never `transition-all`. Spring-style easing.
- **Interactive states**: Every clickable element needs hover, focus-visible, and active states. No exceptions.
- **Images**: Add a gradient overlay (`bg-gradient-to-t from-black/60`) and a color treatment layer with `mix-blend-multiply`.
- **Spacing**: Intentional, consistent spacing tokens — not random Tailwind steps.
- **Depth**: Surfaces use a layering system (base → elevated → floating), not all on one z-plane.

## Hard Rules

- Do not add sections, features, or content not in the reference (when a reference is provided).
- Do not "improve" a reference design — match it (when a reference is provided).
- Do not stop after one screenshot pass.
- Do not use `transition-all`.
- Do not use default Tailwind blue/indigo as the primary color.

## Git Discipline

- Commit or push only when the user asks. If on the default branch, branch first.
- Keep the placeholder tokens consistent across files when editing — a renamed service or city must
  update its filename, all hrefs, nav/footer labels, schema, title/meta, and breadcrumb together.

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

## Business Identity (per client)

Fill every field from the onboarding form. Leave [NEEDS INPUT] for anything
not yet confirmed — never invent or infer.

- Business name: [NEEDS INPUT]
- Industry / trade: [NEEDS INPUT]
- Owner: [NEEDS INPUT — confirm directly with client, do not infer from
  social posts or social media frequency]
- Staff / team on lot or in office: [NEEDS INPUT — names + roles. Confirm
  whether each person is an owner or staff member. Do NOT assume ownership
  from how often someone appears in social posts.]
- Relationship claims (e.g. "husband-and-wife team"): PROHIBITED unless
  the client explicitly confirms in writing. "Family-run" and "locally
  owned" are acceptable tone signals without implying specific structure.
  Do not use "couple," "husband and wife," or any relationship claim
  without explicit written confirmation.
- Supplier / franchise / dealer relationship: [NEEDS INPUT]
- Physical address (or "service-area only — no public address"): [NEEDS INPUT]
- Phone: [NEEDS INPUT] — display format + E.164 tel: href
- Email: [NEEDS INPUT]
- Domain: [NEEDS INPUT]
- Founded year: [NEEDS INPUT]
- Licenses / certifications: [NEEDS INPUT]
- Official tagline: [NEEDS INPUT]
- Review / reputation status: [NEEDS INPUT — do not add widgets until
  confirmed]

## Site Architecture

- Homepage (`index.html`)
- About (`about.html`)
- Contact / Thank You (`thank-you.html` — `noindex, nofollow`)
- 6 service pages at `/services/service-[one..six].html`
- 6 city pages at `/areas/city-[one..six].html`

## Always Do First

Invoke the **frontend-design** skill before writing any frontend code, if available in the
current environment. (Note: this skill may not be installed in Claude Code's environment —
proceed without it if unavailable.)

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

Schema patterns locked across 4 builds:
- Service pages: always 3 JSON-LD blocks — Service + FAQPage +
  BreadcrumbList. FAQPage is non-optional (minimum 6 Q&As).
- City pages: always 3 JSON-LD blocks — LocalBusiness ref (same @id as
  homepage, not a full re-declaration) + FAQPage + BreadcrumbList.
  FAQPage is non-optional (minimum 4 city-scoped Q&As).
- areaServed scoping: homepage LocalBusiness carries the full city list.
  Individual city page schemas: areaServed = that city only. Never copy
  the full list into a city page — it dilutes city-specific relevance.
- Inventory / gallery pages: ImageGallery or CollectionPage schema only.
  Never Service. Never in hasOfferCatalog.
- aggregateRating: include ONLY when reviews are actually displayed.
- PostalAddress: include ONLY when the client has a public physical
  address. Omit entirely for service-area-only businesses.
- Thank-you trio (verify as a single atomic unit before launch):
  noindex/nofollow meta + excluded from sitemap.xml + Disallow in
  robots.txt. All three must be present together — any one without
  the other two = misconfigured.
- Per-page title collision: flagship service page title must be
  differentiated from the homepage title even when they share the same
  primary keyword (e.g. add "for Sale," "Near You," or similar).

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

## Photo Tier Allocation (default — override per client)

Lock at strategy session. Do not re-derive per build session.

| Page type | Body photos | Hero |
|-----------|-------------|------|
| Flagship service (primary moneymaker) | 5 | ✓ |
| Secondary push service | 3 | ✓ |
| Standard service | 2 | ✓ |
| City pages | 1 | ✓ |
| About | 2 | ✓ |
| Inventory / gallery | No limit (reuse accepted) | ✓ |

Rules:
- One-photo-one-slot across all non-inventory pages — no photo appears
  twice on the same page.
- Cross-page reuse accepted on inventory; minimized elsewhere.
- Reuse priority: prefer photos already on the inventory page when
  cross-page reuse is unavoidable.
- Excluded photo types (apply everywhere including inventory): readable
  license plates, strong tilt/rotation, stained/damaged interiors.
- Owner/people photo slots: use aspect-[3/4] container +
  object-position: center top. Portrait orientation is the norm for
  headshots; landscape containers crop faces too tightly.
- Logo filenames: document EXACT filenames confirmed by ls brand_assets/
  — do not assume naming conventions (_2x_ vs @2x differ by tool).

## Hero & Asset Patterns

### Hero background (default — all clients)
Full-bleed static image: full-viewport min-h-screen, left-anchored
hero-outer/hero-text-block container, background image + dark overlay +
edge vignette + text-shadows. This is the default for every page on
every build, including the homepage.

### Hero video (enhancement — only when client provides a usable clip)
Homepage hero only. Replaces the static image on the homepage; static
image becomes the poster/fallback. Mandatory sequence — never skip steps:
1. Trim only first → save as preview file → client approves in/out points
2. Compress separately (H.264, strip audio, ~2-3MB target)
3. Wire into the hero last, replacing the static image source
gitignore: raw source file + trim preview. Only the final compressed
clip gets committed.

### City-page clone pattern
Four CITY-SWAP comment zones mark unique content per city:
```
<!-- CITY-SWAP: intro -->
<!-- CITY-SWAP: local-anchors -->
<!-- CITY-SWAP: why-city -->
<!-- CITY-SWAP: faq -->
```
Everything else is a SHARED zone. The Areas We Serve dropdown (desktop
+ mobile) must be explicitly marked and NEVER touched during a city-page
clone pass:
```
<!-- SHARED ZONE: Areas We Serve dropdown —
     do NOT modify during city-page clone-and-localize pass -->
```

### Screenshot discipline
Claude Code MUST save actual PNG files to ./temporary screenshots/ and
report the exact file path. Prose descriptions of a page are not a
substitute for a real screenshot. Non-negotiable.

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
- Do not publish fixed prices for quote-driven products (carports, custom
  builds, configured/sized items). Route pricing intent to quote/visit/call.
  Applies in body copy, FAQ answers, AND JSON-LD Offer blocks.
- Do not state or imply any APR, interest rate, specific monthly payment,
  or credit score threshold for financing — unless explicitly confirmed in
  this file. Keep financing language general (affordable, flexible,
  no-credit-check). EXCEPTION: a time-limited promo strip in a clearly
  marked PROMO-START/END comment zone (outside permanent copy) may contain
  specific figures since it is designed to be rotated without touching
  page content.
- Do not use "husband-and-wife team," "couple," or any relationship claim
  without explicit written confirmation from the client. "Family-run" is
  a tone signal, not a factual claim — safe without confirmation.
- Product upgrades that carry exclusions must be documented as a PAIRED
  entry in CLAUDE.md: the upgrade description AND its exclusion list
  together. They cannot be decoupled during a build prompt.
- Do not add review widgets, star ratings, or review counts until
  reputation status is confirmed with the client.
- Do not infer ownership, roles, or relationships from social media posts.
  Confirm directly.

## Git Discipline

- Commit or push only when the user asks. If on the default branch, branch first.
- Keep the placeholder tokens consistent across files when editing — a renamed service or city must
  update its filename, all hrefs, nav/footer labels, schema, title/meta, and breadcrumb together.
- Three-command pre-commit check every commit without exception:
  git status (scope), git branch (on main), git remote -v (correct
  client repo — not nexor-template). Never skip.
- Logical commit separation: CLAUDE.md → own commit; brand_assets/ →
  own commit; page builds → grouped by phase. Never mix client-layer
  decisions with build work in one commit.
- Commit assets immediately on placement. Do not batch asset commits
  with page edits.
- Set the canonical host as Primary in Vercel on day one — not at
  launch. Code and Vercel must agree from the first deploy.
- Submit sitemap to GSC as the full URL:
  https://www.domain.com/sitemap.xml — not the bare filename.
- GSC indexing priority order: services → primary city → remaining
  cities → about. Daily cap ~10-12 URL inspections. Spread across days.
- Re-check homepage canonical fields in GSC after 3-5 days post-launch —
  first real confirmation that the host migration held.

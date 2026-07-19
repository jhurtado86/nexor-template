# TEMPLATE-SPEC.md — the optimized nexor-template contract

This defines what the master `nexor-template` **ships with** after optimization — the
locked structure every client build inherits. It is the target state for the upgrade and
the permanent record of the template's frozen layout.

## Prime directive: the template stays NEUTRAL

The template bakes in **structure, image slots, dimensions, tokens, section order, and
schema scaffolds** — never client content. Specifically:
- Colors are neutral overwrite-me tokens with a `derive from logo` comment — never a real
  brand palette.
- Copy stays as `[Business Name]`, `[City]`, `[Service]`, `[Tagline]` tokens.
- Every image is `https://placehold.co/WxH` at the locked dimensions below.
- No real phone, address, schema values, or reviews — placeholders/tokens only.

If a client fact could end up baked in, it's a bug. The neutralization discipline from the
original OptiGlass→template conversion holds.

---

## Page inventory (15) — FROZEN

`index.html` · `about.html` · `thank-you.html` ·
6 service pages under `/services/` · 6 city pages under `/areas/`.
No inventory/gallery page in the base template — it's an optional module (below).

At least **one fully-built reference inner page** (a service page) ships built to the
quality bar — the template is not all-placeholder skeletons. Clones inherit from it.

---

## Global systems — FROZEN

### Color tokens
All colors live in `:root` + `tailwind.config` as named tokens (`--color-primary`,
`--color-primary-mid`, `--color-accent`, `--color-accent-deep`, `--color-dark` (single
canonical dark, same as primary), `--color-ink`, `--color-muted`, `--color-bg`). Neutral
placeholder values + comment: `/* primary = derive from client logo */`. No per-page
hardcoded hexes anywhere. Template ships **no red** as primary. A deprecated-alias block
in `brand.css` remaps old token names so a future recolor is one sweep.

### Named background slots (hero + final-CTA)
- The hero background and final-CTA background are dedicated slots, sourced **only** from
  `brand_assets/hero-background.*` and `brand_assets/cta-background.*`.
- They **never** take a client content/gallery photo.
- Template ships them as `placehold.co/1920x1080`, with off-limits markers:
  `<!-- OFF-LIMITS: hero-background — dedicated named file only, never a content photo -->`
  `<!-- OFF-LIMITS: cta-background — dedicated named file only, never a content photo -->`
- Overlay standardized at ~0.7 + edge vignette + text-shadows for legibility.

### Uniform content-photo container
One shared photo class used for **every** content photo on every page:
aspect-ratio container + `object-fit: cover` — **never** a fixed `h-[Npx]`. One ratio
site-wide so no photo differs in size from another. Owner/people slots are the only
exception: `aspect-[3/4]` + `object-position: center top`.

### Gallery module (optional)
When a build enables the gallery: a uniform responsive grid — equal cells, one locked
ratio, consistent gutters, **no dead space and no ragged/orphaned last row** (column count
+ item count chosen so rows fill). Blocked until real photos exist. Ships commented-out /
flagged in the base template, not active.

### Removable optional modules
Two modules, each wrapped in clearly-marked `<!-- OPTIONAL MODULE: … -->` blocks and
commented out so a build enables/deletes them in one cut, not a hunt: **insurance
carrier-logo row** and **review-widget block**. Each module's paired nav + footer links
are commented out alongside it (a build that enables a module re-enables its links).
None are active by default. Financing is **not** a module in the base template — "&
Financing" was dropped from the insurance heading; add financing per-client only if
offered. (The service pages keep a separate, always-on "Straightforward Pricing" section
under `id="pricing"` — that is page content, not an optional module.)

### Navigation
Sticky nav: transparent-at-top → solid on scroll. Standardized **Services** and **Areas**
dropdowns (desktop + mobile). Nav height sized off the logo; logo left-aligned. The Areas
dropdown carries the shared-zone guard:
`<!-- SHARED ZONE: Areas We Serve dropdown — do NOT modify during city clone pass -->`

### Footer
Locked column structure; footer logo at a legible default size (not the old 50/60px);
same canonical dark background token as the hero/dark sections.

### Final-CTA partial
A single shared final-CTA section (cta-background slot + ~0.7 overlay + headline + dual
CTAs: Call + Get a Quote) — **identical on every page**, before the footer.

### Guardrails realized in CSS (ship by default, not re-applied per build)
Distinct display + body font pairing; layered color-tinted shadows (no flat `shadow-md`);
layered radial gradients + SVG-noise grain; `transform`/`opacity`-only transitions with
spring easing (no `transition-all`); hover + focus-visible + active states on every
interactive element; deliberate light/dark section rhythm (dark hero + exactly one dark
section per file — the footer); strengthened `.divider` hairline for adjacent white
sections.

---

## Per-page structure — FROZEN

Each page ships with its section order, its photo tier (count of uniform photo slots), and
its JSON-LD scaffold (placeholder values/tokens).

### `index.html`
Sections: dark hero (hero-background slot) → value/why-us → services grid (links to the 6
service pages) → proof/about strip → areas strip → final-CTA partial → footer.
Schema scaffold: homepage business `@type` **token** (`[BUSINESS @TYPE]`), with
`openingHoursSpecification`, `areaServed` (full city list), `hasOfferCatalog` (6 services),
`PostalAddress` present **and** commented as removable for service-area clients, no
`aggregateRating`.

### Service page (reference-built) + 5 clones — `/services/`
Section order: hero (hero-background slot) → service intro → what's included → process →
FAQ → final-CTA → footer. Photo tier slots: flagship 5 / secondary 3 / standard 2 (all
uniform-container placeholders). Schema scaffold: **3 blocks** — `Service` + `FAQPage`
(≥6 Q&As, placeholder Q&As) + `BreadcrumbList`. Title token differentiated from the
homepage title pattern.

### City page (with swap zones) + 5 clones — `/areas/`
Four unique zones marked, everything else shared:
`<!-- CITY-SWAP: intro -->` · `<!-- CITY-SWAP: local-anchors -->` ·
`<!-- CITY-SWAP: why-city -->` · `<!-- CITY-SWAP: faq -->`.
Photo tier: 1 uniform slot. Schema scaffold: **3 blocks** — `LocalBusiness` ref (same
`@id` as homepage) + `FAQPage` (≥4 Q&As) + `BreadcrumbList`; `areaServed` = single-city
token, not the full list.

### `about.html`
Owner-story section (2 photo slots, one owner-portrait 3:4) → team (optional) → value →
final-CTA → footer.

### `thank-you.html`
Ships the **trio pre-wired**: `<meta robots noindex,nofollow>` + excluded from
`sitemap.xml` + Disallowed in `robots.txt`. "Request Received" badge lives here only.

---

## Metadata scaffold — FROZEN (tokens on every page)
Unique `<title>` token <60 chars; `<meta description>` token <160; local `keywords`;
`robots` index/follow (except thank-you); self-referential `canonical` (production-host
token, never localhost/staging); `lang` + viewport; full OG + Twitter set with
`og:image`/`twitter:image` → the 1200×630 slot.

---

## Asset dimensions — FROZEN template defaults (override per client only if needed)

| Slot | Ratio | Placeholder dims |
|---|---|---|
| hero-background | 16:9 | 1920×1080 |
| cta-background | 16:9 | 1920×1080 |
| og-image / twitter-image | 1.91:1 | 1200×630 |
| content photo (standard) | 4:3 | 1200×900 |
| owner / people | 3:4 | 900×1200 |
| gallery cell (when enabled) | one locked ratio, uniform | (set at enable) |

Every placeholder ships with **final-form alt text** already written (`[Service] in
[City]` token pattern) so the real-asset swap never touches alt text. All asset paths are
root-relative (`/brand_assets/…`).

---

## Files present in template root — FROZEN
`serve.mjs`, `screenshot.mjs`, `sitemap.xml` (tokened), `robots.txt`, `brand.css` (tokens
+ deprecated-alias block), and `CLAUDE.md` = the current `CLAUDE-SKELETON.md` (so every
clone starts from the blank skeleton, not a prior client's file).

---

## What Code must NOT bake in
Real colors, copy, phone/address, schema values, reviews, or client photos. Any client
fact belongs in a per-build `CLAUDE.md`, never in the template. Placeholders and tokens
only.

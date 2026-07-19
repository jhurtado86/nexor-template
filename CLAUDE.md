# CLAUDE-SKELETON.md — Nexor AI blank CLAUDE.md

This is the **starting point for every client's `CLAUDE.md`**. Copy it to the new client
repo, rename it `CLAUDE.md`, and fill it in from the onboarding form.

## How to use this skeleton

Two layers, marked throughout:

- **FROZEN** — identical on every build. The proven Nexor conventions. Do NOT rewrite
  these per client. If you improve one, improve it *here* and roll it to all future
  builds — never fork it silently in one client's file.
- **`[NEEDS INPUT — …]`** — a client fact to fill from the onboarding form. If the form
  didn't provide it, leave the flag; do NOT invent it. `[DECIDE — …]` marks a judgment
  call to resolve at strategy lock. `[DERIVE — …]` marks something computed from an asset
  (e.g. palette from logo).

Fill every `[NEEDS INPUT]` you can, flag the rest, resolve every `[DECIDE]` at the
strategy-lock gate. When every flag is either filled or consciously deferred to backfill,
`CLAUDE.md` is locked and the build (BUILD-PROMPTS.md, Code-only) begins.

---

## What This Is — FILL PER CLIENT (boilerplate frozen)

This is the **[NEEDS INPUT — Business Name]** website, built on the Nexor AI template.
The generic template placeholders are resolved to this client's real identity below;
anything not yet confirmed is left `[NEEDS INPUT]` and must NOT be invented. Keep the
template's structure, section rhythm, nav pattern, dark sections, footer layout, and
design system intact — only content, brand, service area, colors, logo, photos, and copy
are client-specific.

Trade: **[NEEDS INPUT — industry/trade]**. Several template modules are home-services
artifacts that may not apply to this trade — see "Template Sections to DELETE."

Treat any remaining `[NEEDS INPUT]` field as fill-in-the-blank. Do not invent client
facts; confirm with the client / Juan before filling.

---

## Resolved token reference — FILL PER CLIENT

| Token | Resolved value |
|---|---|
| Business name | [NEEDS INPUT] (short brand: [NEEDS INPUT]) |
| Service One … Service Six | [NEEDS INPUT — the six locked service names] |
| service slugs | [NEEDS INPUT — one slug per service] |
| Primary city | [NEEDS INPUT — physical-location city; anchors NAP + homepage] |
| City 2 … City 6 | [NEEDS INPUT — priority order below] |
| city slugs | [NEEDS INPUT] |
| Region | [NEEDS INPUT] |
| State (full) | [NEEDS INPUT — e.g. Texas] |
| State abbreviation | [NEEDS INPUT — e.g. TX] |
| Phone (site) | [NEEDS INPUT — GHL tracking number ONLY; owner's personal line is never published] |
| Email | [NEEDS INPUT] |
| Domain | [NEEDS INPUT] — canonical host [NEEDS INPUT — www vs non-www, set as Vercel Primary day one] |

> ⚠️ **Email domain may differ from website domain.** If so, both can be correct — do NOT
> "fix" one to match the other, and never build a URL off the email domain. Confirm.

---

## Brand color system — FROZEN methodology, FILL the values

Palette is **derived from the client logo every build** — extract the hexes from
`brand_assets/logo.png`; never assume the template's colors. Define once via CSS custom
properties + Tailwind `theme.extend.colors`; reuse everywhere; never hardcode hexes per
page.

| Token | Hex | Role |
|---|---|---|
| `--color-primary` | [DERIVE from logo] | Primary brand — dark hero/sections, footer, nav, primary buttons |
| `--color-primary-mid` | [DERIVE] | Mid-tone — hover, secondary buttons, borders/dividers on dark |
| `--color-accent` | [DERIVE] | Accent — icons, link accents, eyebrow, highlights on dark |
| `--color-accent-deep` | [DERIVE] | On-light fallback for the accent (see rule below) |
| `--color-silver` / neutral | [DERIVE] | Muted borders, secondary text on dark, chrome |
| `--color-dark` (canonical) | [= primary] | THE single dark-section background token |
| `--color-ink` | [DERIVE] | Near-black headings/body |
| `--color-bg` | `#FFFFFF` | Body/content backgrounds |
| `--color-muted` | [DERIVE] | Muted/secondary text |

**FROZEN rules:**
- **Accent-on-light fallback:** a bright accent is fine as fill / text-on-dark; as small
  text or dividers on white it goes low-contrast — fall back to `--color-accent-deep`.
- **One canonical dark token:** `--color-dark` is the only dark-section background. Never
  let a second near-identical dark hex drift in.
- **Strip the template's red.** The template ships red as de-facto primary — remove it.
  Red is semantic (emergency/urgency) only, and only if the brand actually uses it.
  `[DECIDE — does this brand's palette include red at all? Default: no.]`
- **Never use default Tailwind blue/indigo/sky/cyan.** Drive every color from the brand
  tokens and derive shades from them.

---

## Nav & logo sizing — FROZEN methodology, FILL the values

Nav height is **sized off the client logo** — a documented cross-build issue: past builds
needed a 96–104px nav to fit 76px+ logos, and the template never inherited it. It is now
driven by three tokens in `brand.css` (the defaults are a **starting point, not a fixed
value** — resize per client from the logo):

| Token | Default | Role |
|---|---|---|
| `--nav-height` | `96px` | Nav bar height. |
| `--nav-logo-height` | `72px` | Client logo `<img>` height in the nav (swap the `<span>` wordmark for `<img class="nav-logo">`). |
| `--footer-logo-height` | `116px` | Client logo `<img>` height in the footer (`<img class="footer-logo">`). |

**FROZEN rules:**
- These tokens are the ONLY place nav/logo heights are set. Every page consumes them —
  the sticky + scrolled nav state, the mobile nav, and the desktop dropdowns all key off
  `--nav-height` — so per-client resizing is **one edit in `brand.css`, never a 15-file sweep.**
- Size `--nav-height` off the logo: it must clear `--nav-logo-height` with breathing room.
- Changing the token keeps the scrolled/solid nav, the transparent-at-top state, hero
  clearance, the mobile toggle, and the dropdown menus aligned — verify these after a resize.

---

## Integration placeholders — FROZEN insertion points, DECIDE per client

- `<!-- GHL CONTACT FORM EMBED -->` — [NEEDS INPUT — form name]. Use the GHL embed; never a custom form.
- `<!-- GHL CHAT WIDGET SCRIPT -->` — [NEEDS INPUT] (insert before `</body>`).
- `<!-- GHL EXTERNAL TRACKING SCRIPT -->` — [NEEDS INPUT] (insert in `<head>`).
- `<!-- GHL REVIEW WIDGET EMBED -->` — [DECIDE]. Wire ONLY if review count/rating is
  confirmed AND displayed. Until then: no widget, no stars, no counts, no `aggregateRating`.
- `<!-- GOOGLE MAPS EMBED -->` — [DECIDE — wire only if the client has a public address].
- `<!-- INSURANCE CARRIER LOGO ROW -->` — [DECIDE]. DO NOT wire unless specific carrier
  partnerships are confirmed. Shipping a logo row means fabricating logos (burned prior
  builds). Cover insurance in copy, not a logo wall.
- `<!-- FINANCING SECTION -->` — [DECIDE — delete unless financing is actually offered].
- Social share image: `brand_assets/og-image.jpg` (1200×630) — [NEEDS INPUT — create before launch].

---

## Template Sections to DELETE for this client — FROZEN candidates, FILL the list

Standard removable modules (delete any this trade doesn't offer):
- Financing block / CTA — [DECIDE]
- Insurance carrier-logo row — [DECIDE]
- Review widget / star rating / review-count blocks — [DECIDE, default delete until confirmed]
- Inventory / gallery page — [DECIDE — see gallery rules below]
- Trust-badge pill row in the hero — delete by default (redundant with the eyebrow)
- [NEEDS INPUT — any other home-services artifact irrelevant to this trade]

---

## Business Identity — FILL PER CLIENT (guardrails frozen)

Every field is confirmed from onboarding or flagged `[NEEDS INPUT]`. Nothing inferred.

- Business name / short brand: [NEEDS INPUT]
- Industry / trade: [NEEDS INPUT]
- Owner: [NEEDS INPUT]. **FROZEN rule:** owner name is referenced only in a dedicated
  "About the Owner" section or where genuinely required — never threaded through general
  body copy, headings, meta/OG, or CTAs.
- Staff / team: [NEEDS INPUT — names + roles]. **Never infer staff or roles from social
  posts. Confirm directly with the client.**
- Relationship claims: **FROZEN** — no "family owned," "husband and wife," "couple," or
  any relationship structure without explicit written confirmation. "Family-run" is a
  tone signal (safe); a relationship *claim* is a fact (needs confirmation). [NEEDS INPUT]
- Differentiator / ownership signal (e.g. veteran-owned): [NEEDS INPUT — confirmed only]
- Owner background (for About page): [NEEDS INPUT]
- **FROZEN framing rule:** an experience figure is a PERSONAL claim, not a business-age
  claim. Write "[N] years in the [trade]" — never "[N] years serving [City]" (implies
  business age). Founding year is separate and [NEEDS INPUT] until confirmed.
- Supplier / franchise / dealer relationship: [NEEDS INPUT]
- Physical address: [NEEDS INPUT — or "service-area only, no public address"]
  → this sets the schema variant (PostalAddress included vs omitted; see SEO section).
- Phone (site): [NEEDS INPUT — GHL tracking number]
- Phone (owner personal — NOT FOR PUBLICATION): [NEEDS INPUT — recorded only so it's never
  mistaken for the site number; must return zero grep hits before deploy]
- Email: [NEEDS INPUT]
- Domain + canonical host: [NEEDS INPUT]
- Founded year: [NEEDS INPUT — do not state or compute until confirmed]
- Licenses / certifications: [NEEDS INPUT — publish none until confirmed]
- Official tagline: [NEEDS INPUT]
- Review / reputation status: [NEEDS INPUT — until confirmed: no widget, no stars, no
  counts, no `aggregateRating`, no testimonials. Unattributed testimonials are never published.]
- Price range: [NEEDS INPUT — for JSON-LD `priceRange`]

### Key operational facts — [NEEDS INPUT] (must be accurate everywhere once filled)
- Service model (in-shop / mobile / both): [NEEDS INPUT]
- Service-area / free-travel radius: [NEEDS INPUT]
- Intake method / primary CTA framing: [NEEDS INPUT]
- Any confirmed differentiators: [NEEDS INPUT]

### Hours — [NEEDS INPUT] (for `openingHoursSpecification`)

---

## Services — FROZEN methodology, FILL the six

**FROZEN:** select service pages for search volume + lead intent (broad high-intent
categories over narrow component terms). Minor/related services fold in as on-page
sections or FAQ, not their own pages. Default is six pages; flex only if the client
genuinely needs more/fewer.

- Flagship (highest volume + call volume): [NEEDS INPUT]
- Secondary push (differentiator / highest ticket): [NEEDS INPUT]
- Standard ×4: [NEEDS INPUT]
- Folded-in sub-services (sections/FAQ, not pages): [NEEDS INPUT]

> ⚠️ **FROZEN anti-cannibalization:** keep distinct search intents on distinct pages
> (e.g. repair vs replacement). Never introduce a broad umbrella page that cannibalizes
> two narrower ones.

---

## Site Architecture — FROZEN structure, FILL the slugs

> ⚠️ **FROZEN — VERIFY BEFORE WRITING PATHS.** After cloning the template and before
> finalizing any path here, run `find . -name "*.html"` and confirm the real tree matches.
> Prior builds shipped `CLAUDE.md` paths that didn't match the repo and paid for it every
> session. **Disk is the source of truth.**

- Homepage `index.html`
- About `about.html`
- Contact / Thank-You `thank-you.html` (noindex, nofollow)
- 6 service pages under `/services/`: [NEEDS INPUT — slugs]
- 6 city pages under `/areas/`: [NEEDS INPUT — slugs]
- Inventory/gallery page: [DECIDE — include only if applicable; see gallery rules]

### City priority — FROZEN methodology, FILL the order
Home city anchors the homepage + NAP. Deepest city page = highest-volume target and
becomes the CITY-PAGE TEMPLATE. Order drives GSC indexing sequence.
- [NEEDS INPUT — primary → secondary → … with a one-line rationale each]
- [DECIDE — any cities pending real search-volume data]

---

## Always Do First — FROZEN
Invoke the frontend-design skill before writing frontend code **if available** in the
environment (it may not be installed in Claude Code — proceed without it if not).

## Content Writing Methodology — FROZEN
For all page copy, read and follow `SEO-CONTENT-PROMPT.md` in full as the PRIMARY writing
methodology before writing any content. If wording ever conflicts with the technical rules
below, `SEO-CONTENT-PROMPT.md` wins on wording; the rules below govern technical
implementation.

---

## Local SEO Requirements — FROZEN (fill only the title/description tokens)

**Per-page metadata (every page):** unique `<title>` <60 chars; unique
`<meta description>` <160 with a service + city + CTA; local `keywords`;
`robots` index/follow with max-image/snippet/video-preview; self-referential `canonical`;
`<html lang="en">` + viewport.

**Open Graph + Twitter (every page):** og:title/description/url/type/image/locale/site_name;
twitter summary_large_image + title/description/image; images → 1200×630 (flag if not created).

**Structured Data (JSON-LD) — FROZEN patterns:**
- Homepage: the correct `@type` for the trade `[NEEDS INPUT — e.g. AutoRepair / HVACBusiness / LocalBusiness]`
  (never a mismatched type, never bare LocalBusiness if a specific subtype fits). Include
  name, telephone (GHL), email, priceRange (pending), `openingHoursSpecification`,
  `areaServed` (full city list), `hasOfferCatalog` (the six services).
- **PostalAddress:** INCLUDE only if the client has a public address; OMIT entirely for
  service-area businesses. `[DECIDE per address field above]`
- **`aggregateRating`:** include ONLY when real reviews are confirmed AND displayed.
- License numbers → `additionalProperty`.
- **Service pages:** 3 blocks — `Service` + `FAQPage` (min 6 Q&As) + `BreadcrumbList`.
- **City pages:** 3 blocks — `LocalBusiness` ref (same `@id` as homepage, not a
  re-declaration) + `FAQPage` (min 4 city-scoped Q&As) + `BreadcrumbList`.
  `areaServed` = that city only, never the full list.
- **Inventory/gallery pages:** `ImageGallery` or `CollectionPage` only — never `Service`.
- **Thank-you trio (one atomic unit):** noindex/nofollow meta + excluded from `sitemap.xml`
  + Disallow in `robots.txt`.
- **Per-page title collision:** the flagship service title must lead with a different
  phrase than the homepage title even when they share a keyword.
- **Offer-catalog count == live service-page count.**
- Validate at `search.google.com/test/rich-results` before launch.

**Visible on-page SEO — FROZEN:** exactly one `<h1>`/page; H2/H3 hierarchy, no skipped
levels; city names in human-readable body text; service+city combos appear naturally;
descriptive alt text with service/location context.

**City pages — anti-duplicate — FROZEN:** each city page ≥30–40% unique content; never
just swap the city name (doorway-page penalty); reference real, VERIFIED local anchors
(highways/neighborhoods/landmarks/districts) — flag `[VERIFY]` rather than invent; unique
intro + unique "why [City] chooses us" per page.

**Technical SEO files — FROZEN:** `sitemap.xml` (all indexable pages; exclude thank-you);
`robots.txt` (allow crawl, disallow thank-you, point to sitemap).

**Title/description patterns — FILL:**
- Homepage: [NEEDS INPUT]
- Service page: [NEEDS INPUT]
- City page: [NEEDS INPUT]

---

## Hero & Asset Patterns — FROZEN

### Hero + Final-CTA backgrounds — dedicated named slots ONLY
- The hero background and the final-CTA background are **their own asset slots.** They are
  filled **only** by a purpose-made image named exactly `hero-background.*` and
  `cta-background.*` in `brand_assets/`.
- **They NEVER use a client content/job photo.** A client's section/gallery photos are
  never promoted into either background. Ever.
- Until the dedicated file exists, both stay on `https://placehold.co/1920x1080` at exact
  final dimensions. Flag as pending — never substitute another image to "fill" it.
- **Off-limits on every content-photo and layout pass** (also enforced in WORKFLOW.md).
  A photo/layout prompt must not touch these two backgrounds unless it is explicitly about
  them.
- Static full-bleed image is the default hero on every page including the homepage
  (`min-h-screen`, left-anchored text block, image + dark overlay ~0.7 + edge vignette +
  text-shadows).

### Hero video — enhancement, homepage only
Only when the client provides a usable clip. Replaces the static homepage hero; the
`hero-background` image becomes the poster/fallback. **FROZEN sequence, never skipped:**
trim only → save preview → client approves in/out → compress separately (H.264, strip
audio, ~2–3MB) → wire in last. `.gitignore` the raw source + trim preview; commit only the
final compressed clip.

### Uniform photo sizing — every section, every page
- **Every content photo uses the same-size aspect-ratio container** (`aspect-ratio` +
  `object-fit: cover`), never a fixed `h-[Npx]`. One ratio applied site-wide so no photo
  is a different size than another within or across sections.
- This is independent of the photo *tier* (which sets how MANY photos a page gets, below).
  Tiers govern count; this rule governs that every container is the same dimensions.

### Split-section layout — FROZEN
Interior page content is built from **alternating split sections**: two ~50/50 columns —
a text column and **one** uniform `.photo-frame` photo — stacking text-first on mobile.
The photo side alternates down the page (right, left, right…) and section backgrounds
alternate light/dark. **One photo per split; never a photo grid inside a split.** Text
column = optional eyebrow → H2 → 1–2 short paragraphs → optional 2×2 checklist → optional
inline `link-arrow`. The photo *tier* (below) sets how many splits a page gets — one split
per photo slot (flagship service = 5 splits, standard = 2, city = 1 coverage split).

### Cards — icon-free, centered — FROZEN
Service / feature / value cards ship **without icons or emblems** (no icon squares, no
emblem circles) and with **centered text**. Card containers (border/shadow/radius) are
unchanged. **Numbered step cards keep their 01–04 numbers** — those aren't icons. Cards on
a dark section take a translucent dark-card treatment so text stays legible. The contact
block keeps its functional call/email/address icons (contact affordances, not card emblems).

### Homepage FAQ + gallery — FROZEN
The homepage ships an **active** FAQ accordion (5–6 token Q&As, same `<details>` styling as
service/city pages) and an **active** uniform gallery grid (8 `.photo-frame` tiles at 2-
and 4-column breakpoints so the last row always fills). These are page sections, distinct
from the optional inventory/gallery *page* below.

### Gallery / inventory section — uniform grid, no dead space
If the client has a dedicated gallery or inventory section:
- **Uniform grid:** equal cells, consistent gutters, every image the same size.
- **No dead space and no ragged last row** — size the grid so the final row fills or is
  balanced; never leave an orphaned single image floating in an empty row.
- Inventory/gallery page is **blocked until real photos exist** — do not ship it against
  placeholders.
- Excluded photo types apply here too (see below).

### Photo Tier Allocation — FROZEN default (override per client at strategy lock)
| Page type | Body photos | Hero |
|---|---|---|
| Flagship service | 5 | ✓ |
| Secondary push service | 3 | ✓ |
| Standard service | 2 | ✓ |
| City page | 1 | ✓ |
| About | 2 (2 splits) | ✓ |
| Inventory / gallery | No limit (reuse accepted) | ✓ |

**FROZEN rules:** one-photo-one-slot on all non-inventory pages (no photo twice on a
page); cross-page reuse minimized except on inventory; excluded types everywhere —
readable license plates, strong tilt/rotation, stained/damaged subjects, anything
privacy-sensitive; owner/people slots use `aspect-[3/4]` + `object-position: center top`
(portrait is the norm for headshots); document EXACT asset filenames confirmed by
`ls brand_assets/` — never assume naming.

### City-page clone zones — FROZEN
Four unique zones per city, everything else shared:
`<!-- CITY-SWAP: intro -->` · `<!-- CITY-SWAP: local-anchors -->` ·
`<!-- CITY-SWAP: why-city -->` · `<!-- CITY-SWAP: faq -->`
The Areas We Serve dropdown (desktop + mobile) is a protected shared zone — mark it and
never modify it during a city clone pass:
`<!-- SHARED ZONE: Areas We Serve dropdown — do NOT modify during city clone pass -->`

---

## Screenshot discipline — FROZEN (tiered)

Code MUST save real PNG files to `./temporary screenshots/` and report the exact path — a
prose description is never a substitute. **Number of rounds is tiered by page type:**

- **Gated template pages — homepage, flagship service, deepest city: 2 comparison rounds.**
  These set the pattern everything inherits; iterate until right.
- **Clones and structural pages — remaining services/cities, about, thank-you: 1 round +
  a click-through.** They inherit an approved parent, so verify, don't re-iterate.
- More rounds only if the 1-round check surfaces a real problem.

(Serve on localhost first — never screenshot a `file:///` path.)

---

## Reference Images — FROZEN
Default: build ORIGINAL pages from this file with high craft — do NOT match a provided
reference. The match-exactly rules apply ONLY when a reference image is explicitly
provided (then: match layout/spacing/type/color, swap placeholder content, don't improve
the design, 2 comparison rounds).

## Local Server / Screenshot Workflow — FROZEN
`node serve.mjs` (root at `http://localhost:3000`, background, don't double-start).
`node screenshot.mjs http://localhost:3000 [label]` → `./temporary screenshots/screenshot-N[-label].png`
(auto-incremented). Read the PNG back and analyze specifics (px sizes, exact hexes,
spacing, alignment, radii, shadows).

## Output Defaults — FROZEN
Self-contained HTML; Tailwind via CDN; `https://placehold.co/WIDTHxHEIGHT` placeholders;
mobile-first responsive.

## Anti-Generic Guardrails — FROZEN
Brand tokens only (never default Tailwind palette). Layered color-tinted shadows (never
flat `shadow-md`). Distinct display + body fonts; tight tracking on large headings,
generous body line-height. Layered radial gradients + SVG-noise grain for depth. Animate
only `transform`/`opacity` (never `transition-all`), spring easing. Every clickable
element has hover + focus-visible + active states. Image overlays + a color-treatment
layer. Intentional spacing tokens. A base→elevated→floating depth system.

---

## Locked Language — FROZEN framework, FILL per client
Freeze anything that must never drift:
- Insurance framing: [NEEDS INPUT — e.g. "works with all carriers"; never name a carrier
  or promise coverage outcomes / $0 deductible; route to "we'll help you file the claim"]
- Warranty: [NEEDS INPUT — publish no warranty scope until confirmed in writing]
- Certification/quality claims: [NEEDS INPUT — no cert claim until confirmed]
- Ownership signal: [NEEDS INPUT — confirmed only]
- Experience framing: [NEEDS INPUT — personal-experience wording, not business-age]
- Testimonials/reviews: [NEEDS INPUT — none publishable until reputation confirmed]
- **Guarantee / warranty scope, licensing & insurance status, and insurance-coverage
  outcomes are `[NEEDS INPUT]` per client and must NEVER be asserted in base template
  copy** — not in body, headings, cards, trust badges/pills, meta, or JSON-LD. Ship them
  as claim-free or self-flagged placeholders (see the service-page guarantee-FAQ answer
  for the pattern); the client confirms scope in writing before any such claim goes live.
  Covers "satisfaction guarantee," "Licensed & Insured," and "we bill your carrier / most
  claims cost little or nothing."

## Hard Rules — FROZEN
- No invented facts; confirm before filling any `[NEEDS INPUT]`.
- No price / range / "starting at" unless explicitly confirmed here — route pricing intent
  to the quote CTA (applies to copy, FAQ, AND JSON-LD Offer blocks).
- No insurance coverage-outcome claims.
- No relationship claim without written confirmation.
- No review widgets/stars/counts/`aggregateRating` until reputation is confirmed.
- Never infer ownership/roles/relationships from social posts.
- Never publish the owner's personal number — GHL tracking number only; grep returns zero
  hits for the personal number before deploy.
- Never promote a client photo into the `hero-background` / `cta-background` slots.
- No readable license plates or privacy-sensitive photos.
- Strip the template's red; no default Tailwind blue/indigo as primary.
- No `transition-all`.
- Follow the tiered screenshot rule above — don't stop after one pass on a *gated template
  page*; a single round + click-through is correct for clones.

## Git Discipline — FROZEN
- Commit/push only when asked; branch first if on the default branch.
- Rename a service/city → update its filename, all hrefs, nav/footer labels, schema,
  title/meta, and breadcrumb together.
- Three-command pre-commit check, no exceptions: `git status`, `git branch`,
  `git remote -v` (the client repo, NOT nexor-template).
- Logical commit separation: CLAUDE.md → own commit; brand_assets → own commit; page
  builds grouped by phase. Never mix client-layer decisions with build work.
- Commit assets immediately on placement (their own commit).
- Set the canonical host as Vercel **Primary on day one**, not at launch.
- Submit the sitemap to GSC as the full canonical URL. Indexing order: services → primary
  city → remaining cities → about. ~10–12 URL inspections/day; spread across days. Re-check
  the homepage canonical in GSC 3–5 days post-launch.

---

## Active Blockers — [NEEDS INPUT] summary (fill per client)

**Launch-blocking:** [NEEDS INPUT — e.g. GHL tracking number, GHL form embed, chat/tracking scripts, og-image]

**Backfillable (build against placeholders, swap in one pass):** [NEEDS INPUT — e.g.
photos, review status, certifications, founding year, social links, priceRange, warranty terms]

**Open decisions for Juan (resolve at strategy lock):** [DECIDE — e.g. cities pending
volume data, any framing calls, gallery/inventory page yes/no]

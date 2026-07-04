# TEMPLATE HARVEST — CONSOLIDATED PUNCH-LIST

Merged from four builds, oldest → newest: **OptiGlass+** (auto glass, the blueprint),
**ELCO** (HVAC/electrical, most production-hardened), **G-Uprooted** (tree service,
service-area / no-address), **Mesquite Sheds & More** (sheds/storage, first
retail/inventory client). Each item is tagged with how many of the four builds hit it.
**[4/4] and [3/4] items are highest-priority — do these first.** [2/4] items are
confirmed debt. [1/4] items are real but lower-confidence; adopt where they fit.

---

## TIER 1 — Confirmed across multiple builds (highest priority)

### 1. Stop shipping red as the default primary [3/4 palette, 2/4 red-specifically]
Named explicitly as the #1 thing that makes the template read generic.
- **Derive the palette from the client logo every time** — extract hex from `logo.png`
  via Python; never assume the template's red. (OptiGlass: white-balance correction
  needed; ELCO: blue primary; G-Uprooted: green primary; Mesquite: cream/charcoal.)
- **Red becomes semantic, not decorative** — reserve red for emergency/urgency only.
  Template should NOT ship red as de-facto primary.
- Template action: replace the hardcoded red primary with a neutral token that's
  obviously meant to be overwritten, and add a comment: "primary = derive from logo."

### 2. Centralize color tokens so a recolor is one sweep [2/4]
- All colors live in `:root` + `tailwind.config` as named tokens — never per-page
  hardcoded hexes. (ELCO's 15-file recolor stayed byte-identical because of this.)
- Ship a **deprecated-alias block** in `brand.css`: old token names remap onto new
  values so a rebrand doesn't require touching every selector. (G-Uprooted migration
  pattern.)
- One canonical **dark-section background token**, defined once, referenced everywhere.
  (OptiGlass had two near-identical dark hexes drift apart.)

### 3. Accent-on-light contrast fallback [2/4]
- Any accent doing double duty needs an on-light fallback. Bright accent is fine as
  fill / text-on-dark; as text/dividers on white it goes low-contrast and must fall
  back to the primary or a darkened accent. (OptiGlass A/B/C rule; ELCO gold-on-white.)
- Companion trap: aliased accents render dim on dark surfaces — dark sections need a
  dedicated bright variant token. (G-Uprooted dark-on-dark.)

### 4. Canonical Host Rule — audit side is as important as the rule itself [4/4]
**Confirmed by all four builds.** The single most expensive recurring problem
(www/non-www mismatch silently blocked indexing for weeks on multiple sites).
- Set www vs non-www in CLAUDE.md **on day one** of the project.
- **Set that host as Primary in Vercel → Domains immediately** — do NOT wait until
  launch. Code and Vercel must agree from the first deploy. Delayed Vercel
  configuration risks indexing a mixed-host version before the correct one takes hold.
  (Mesquite added this hard-won step.)
- Verify canonical/OG URLs hardcode the **production domain**, never localhost/staging.
- **Diff** canonicals vs sitemap `<loc>` vs `og:url` — must return empty.
- Confirm the **domain string matches the registered domain** (Elco pointed at
  elcotx.com instead of elcorgv.com — caught only by the audit).
- Submit sitemap to GSC as the full URL: `https://www.domain.com/sitemap.xml` — not
  the bare filename; GSC sometimes doesn't resolve bare filenames correctly.

### 5. Audit-first, report-don't-fix for any site-wide change [4/4]
**Confirmed by all four builds.** On Mesquite alone, applied to: canonical host
migration, footer dedup, nav fragment links, dropdown fix, and ownership copy sweep —
caught real bugs every single time.
- Claude Code scans all files, reports findings with exact locations + proposed
  replacements, **waits for approval**, then executes.
- Never combine the audit and fix into a single step on a site-wide operation.
- Save the **6-section pre-launch SEO audit** as a standard prompt (sitemap/robots,
  per-page metadata, OG/Twitter, JSON-LD, heading structure, internal links — audit
  only, no changes).

### 6. Verify file state — never trust a "complete" report [4/4]
**Confirmed by all four builds** in different costumes every time:
- OptiGlass: PROJECT-STATUS.md said 6 area pages "not built" — they were complete
  1,270-line pages.
- ELCO: CLAUDE.md listed a stale phone number while the live site used the GHL number.
- G-Uprooted: a "chrome sweep complete" report had not reached 10 of 15 pages.
- **Mesquite: photo placement report header said "12 photos into 13 slots" while the
  detail section said 17. The detail was right; the header was stale.**
- Rules: (a) **kill any separate status/planning doc** — CLAUDE.md is the only source
  of truth; (b) **spot-check actual files before scoping downstream work**; (c) always
  verify the math by counting directly from file content, never from a summary header.

### 7. Deleting a section = sweep its anchors + references site-wide [3/4]
- OptiGlass warranty cleanup; ELCO dead `/#insurance` anchor + sitemap drift;
  **Mesquite nav and footer fragment links required a site-wide sweep.**
- Rule: removing a section means sweeping its nav anchors, internal links, and sitemap
  entries in the **same task**.
- **Ship all nav and footer fragment links as root-relative from the first commit:**
  `href="/#section"` not `href="#section"`. Bare fragments work on the homepage (where
  those sections live) but are dead on every subpage. This applies to both the sticky
  nav AND the footer. Never plan to "fix this later" — it requires a sweep across all
  pages. Ship it right and it never needs fixing.

### 8. Zero-remaining grep as a hard deploy gate [3/4]
- Before "done": grep returns zero for old phone (all formats: `tel:`, JSON-LD,
  OG/meta descriptions), zero placeholder tokens (`[Neighborhood]`/`[Highway]`/
  `[Landmark]`), zero old color tokens.
- **Thank-you trio is a single atomic unit** (Mesquite confirmed): verify all three
  together — `<meta name="robots" content="noindex, nofollow">` in `<head>` + page
  excluded from `sitemap.xml` + `Disallow: /thank-you.html` in `robots.txt`. Any one
  present without the other two = misconfigured. Add a "thank-you trio verified"
  checkbox to the pre-launch audit.
- Check: **offer-catalog count == live service-page count.**
- Check: **people names in copy** — run a grep for every person name referenced on the
  site and verify each instance is accurate. (Mesquite required a site-wide sweep after
  an ownership inference error.)

### 9. Conditional schema by business type [4/4]
**Confirmed by all four builds.** `@type` is a per-client field, not a fixed default.
- **Omit `PostalAddress` entirely** for service-area businesses; include full address
  only when there's a public lot. (G-Uprooted = no address; Mesquite = address-bearing
  — both variants now confirmed.)
- Include `aggregateRating` **only when reviews are actually displayed.**
- License numbers go in `additionalProperty`.
- **Service page JSON-LD: always 3 blocks** — `Service` + `FAQPage` + `BreadcrumbList`,
  in that order, on every service page.
- **City page JSON-LD: always 3 blocks** — `LocalBusiness` ref (same `@id` as homepage,
  not a full re-declaration) + `FAQPage` + `BreadcrumbList`, in that order.
- **FAQPage schema is non-optional** on both page types — service pages (6 Q&As min),
  city pages (4 Q&As min, city-scoped). Bake it into template scaffolding so it can't
  be omitted on a clone-and-localize pass.
- **areaServed scoping:** homepage `LocalBusiness` carries the full city list + broad
  region. Individual city page schemas: `areaServed` = that city only. Never copy the
  full list into a city page — it dilutes city-specific relevance.
- **Inventory page schema: `ImageGallery` or `CollectionPage` only** — never `Service`,
  never in `hasOfferCatalog`. A gallery is a content page, not a service offering.
  (Mesquite — new page type.)

### 10. Logo sizing — template defaults are too small [2/4]
- OptiGlass: nav bar sized to 104px to fit a 76px logo. G-Uprooted: 96px nav / 116px
  footer (template's 50/60 read too small).
- Rule: **size the nav bar off the logo height**, don't assume a fixed default. Bump
  template footer-logo default.
- Handle on-dark legibility via a plate/sizing, **not** a white-filter logo swap.
- **Verify logo filenames from the filesystem (`ls brand_assets/`) before documenting
  them in CLAUDE.md.** Never document from memory or from the filename the client
  mentioned. A `_2x_` vs `@2x` discrepancy caused broken asset references on Mesquite
  that traced to a false CLAUDE.md record. Disk is the source of truth.

### 11. Git + Vercel repo discipline [3/4] — caused a production outage
- **Repoint origin to a dedicated client repo immediately after cloning
  nexor-template, before any commits.** The G-Uprooted outage traced to commits
  landing on the template repo.
- **Three-command pre-commit check every time** (Mesquite confirmed necessity):
  `git status` (scope matches intent) → `git branch` (on main, not detached HEAD or
  accidental branch) → `git remote -v` (client repo, not nexor-template). No exceptions.
- **Verify the Vercel project's Git integration target before first deploy.**
- **Commit straight to main** — no feature branches. Intentional efficiency choice for
  single-developer static-site builds. Document so a new operator doesn't add overhead.
- **Logical commit separation**: CLAUDE.md changes → own commit; brand_assets additions
  → own commit; page builds → grouped by phase (all service pages together, all city
  pages together). Never mix client-layer decisions with build work in one commit.
  Mixed commits are impossible to audit or roll back cleanly.

### 12. CLAUDE.md path structure must mirror the real repo [2/4]
**Confirmed by G-Uprooted AND Mesquite.** Both builds had CLAUDE.md listing page paths
(city pages at root, `contact.html`) that didn't match the real template structure
(`/areas/`, no `contact.html`). The mismatch generated per-session confusion on every
single session of both builds.
- **Verify file tree with `ls -R` or `find . -name "*.html"` BEFORE writing any CLAUDE.md
  page paths.** Never document from memory or from the template README.
- Order is mandatory: confirm actual structure → then write CLAUDE.md. Without exception.
- Add this as a named step in Phase 1 (client intake) of the SOP.

---

## TIER 2 — Strong single-build lessons worth adopting

### Media / asset handling (ELCO + G-Uprooted + Mesquite)

**Hero pattern — static image default [Mesquite]:**
The template ships with a **static-image hero** as the universal standard. Structure:
`min-h-screen` full-viewport container, left-anchored `hero-outer`/`hero-text-block`
layout, full-bleed background image + dark overlay (≈0.7 opacity) + edge vignette +
text-shadows on heading/subhead. Poster/fallback `<img>` slot wired in HTML so the hero
always renders before the client provides a photo.

Hero **video** is a client-specific enhancement, not the default — only wire it on the
homepage when the client provides usable source footage.

**Hero video workflow — trim-first sequence [ELCO + G-Uprooted + Mesquite]:**
- `<video autoplay muted loop playsinline>` + `object-fit: cover` + `object-position`
  pan; static image as CSS fallback (also the `poster=` attribute).
- **Mandatory sequence: trim before compressing.** Save a low-quality trim preview →
  get client approval on in/out points → compress (H.264, strip audio, target ≈2–3 MB,
  Lanczos or `sips`) → wire → commit. Compressing the wrong cut wastes client time and
  creates double-compression artifacts when the correct trim is reprocessed.
- gitignore: raw source file + trim preview. Commit: compressed final clip only.
- Homepage hero only. All other pages stay static-image.
- On tall phones stay on `cover` — `contain` breaks layering, `scale()` doesn't reveal
  more frame.

**Photo tier system [Mesquite]:**
Default photo allocation per page type. Document this table in the template CLAUDE.md
starter and in page scaffolding comments so the builder never has to derive it:
- Flagship service page (moneymaker): **5 body photos**
- Secondary push-service page (e.g. carports): **3 body photos**
- Standard service page: **2 body photos**
- City pages: **1 body photo + hero**
- About page: **2 body photos + hero**
- Inventory page: real-asset gallery only — see Inventory page pattern below

When photos arrive from the client, assign them to pages by tier first. Do not
distribute ad hoc by which pages happen to be open.

**Aspect-ratio containers, never fixed-height [ELCO + G-Uprooted]:**
`object-fit: cover` on fixed `h-[Npx]` crops/zooms — recurred multiple times.
Default the photo grid to `aspect-ratio: 4/3` (or native ratio).

**Owner/person photo slot — portrait-default [Mesquite]:**
Default container for any headshot or owner photo: `aspect-[3/4]` + `object-position:
center top`. Portrait orientation is the norm for phone selfies and headshots; a
landscape container crops faces. Override to landscape only when the client explicitly
provides a horizontal crop.

**One-photo-one-slot across all non-inventory pages [Mesquite]:**
No photo appears twice on the same page. Cross-page reuse is acceptable (there will
never be enough unique photos for every slot) but minimize it. When reuse is
unavoidable, prefer photos already placed on the inventory page — that page is built
for reuse. Photos on service and city pages should be prioritized for fresh placement.

**Photo exclusion rules — permanent [Mesquite]:**
These categories are excluded from any page including the inventory gallery: text/price
overlays that can't be removed, readable license plates (privacy/legal risk), strong
tilt or rotation artifacts, stained or damaged interiors. An exclusion follows the
photo — a photo excluded from one page does not become acceptable on another.
**Add excluded filenames to `.gitignore` immediately** after the review pass that
identifies them. "Mentally noted" exclusions can leak into a future `git add .`.

**Inventory page pattern [Mesquite]:**
- Pure visual gallery — NOT a service page, NOT in `hasOfferCatalog`.
- Schema: `ImageGallery` or `CollectionPage` only.
- Copy framing: "browse what we build" — not "live current stock."
- Primary CTA: link to the live dealer feed.
- **Do NOT build from placeholder photos.** A gallery of grey rectangles is worthless
  to the client and to Google. This is the one page type where "structurally done"
  requires real assets. Hold the build; ship a minimal "Inventory coming soon — visit
  [dealer feed URL]" stub in the interim. Build the gallery in a dedicated fast pass
  once photos exist.

**Overlay opacity [all builds]:**
Converges ≈0.7 for legible text on background images (ELCO 0.72, OptiGlass 0.55–0.65,
G-Uprooted + Mesquite dark). Standardize ~0.7.

**White-on-white divider [OptiGlass]:**
Strengthen the `.divider` hairline (gradient opacity ~0.18 + inset box-shadow lift) to
separate adjacent white sections without a table-rule look.

**Brand assets — commit discipline [ELCO + Mesquite]:**
- Commit new brand assets immediately on placement — ELCO lost `commercial-hero.jpg` by
  batching commits.
- **Commit brand_assets/ as its own dedicated commit**, separate from page builds.
  Mixed commits (assets + page work) are impossible to audit or roll back cleanly.

**Verify AI-generated image dimensions before placing [OptiGlass + Mesquite]:**
AI generators frequently cap output resolution lower than the prompt requests. Always
verify actual pixel dimensions before placing. Minimum for a full-bleed hero: 1920px
wide. A correctly prompted generation that delivers 512×512 will look blurry at full
viewport. Verification command on Mac: `sips -g pixelWidth pixelHeight filename`.

---

### AI image-generation pitfalls [OptiGlass + Mesquite]
- **Never describe "a gradient for text placement"** — generators paint a literal black
  panel. Describe natural directional shadow from lighting instead.
- Generate at/above target resolution (1920×1080 hero) and crop any watermark (Gemini/
  Nano Banana corner mark) before going live.

---

### Screenshot discipline [Mesquite]
Claude Code MUST:
1. Save screenshots as actual PNG files to `./temporary screenshots/screenshot-N.png`
2. Report the exact file path in its response
3. Read the PNG with the Read tool before reporting visual findings

Describing a page in prose is NOT a substitute for a screenshot. This failure recurred
multiple times on the Mesquite build. Add as an explicit guardrail in WORKFLOW.md —
it must not be treated as optional.

---

### City-page CITY-SWAP comment zones [Mesquite]
Four and only four zones are swap zones during per-city cloning. Document the exact
comment format in the template and in CLAUDE.md:

```html
<!-- CITY-SWAP: INTRO — replace city name, opening hook, distance reference -->
<!-- CITY-SWAP: LOCAL-ANCHORS — replace highways/neighborhoods/landmarks -->
<!-- CITY-SWAP: WHY-CITY — replace the "why [City] chooses us" angle -->
<!-- CITY-SWAP: FAQ — replace city-scoped FAQ Q&As and areaServed field -->
```

The Areas We Serve dropdown and all other nav/footer markup is a **SHARED zone —
never touch it during per-city cloning.** Wrap the full dropdown in a prominent comment:

```html
<!-- ═══════════════════════════════════════════════════
     SHARED ZONE — Areas We Serve dropdown
     Contains ALL city links. Do NOT modify during city cloning.
     ═══════════════════════════════════════════════════ -->
```

Root cause of the Mesquite McAllen slot-2 overwrite (hit 5 of 6 area pages): the clone
pass treated the dropdown as a swap zone. This comment block is the prevention.

---

### Removable / optional template modules
- **Insurance & Financing section** (carrier-logo row + 3-step block) is a
  home-services artifact irrelevant to most trades — made cleanup work in BOTH ELCO
  (fake carriers) and G-Uprooted. Make it a **removable optional module**, not baked
  into `index.html`.
- **Contact card:** ship a documented **service-area variant** that drops the
  street-address + city/zip lines and rebalances spacing (no empty gap).

---

### Reusable components to bank into the template
- **Final CTA section** as a single shared partial: background image + ~0.7 overlay +
  headline + dual CTAs (Call + Get a Quote). Identical on every page.
- **Step-circle component** with locked on-dark vs on-light variants (contrast never
  breaks).
- **Sticky nav**: transparent-at-top → solid on scroll, Services + Areas dropdowns
  standardized.
- **Standard service page structure (locked):** Hero (full-viewport, static-image
  default) → alternating text-beside-photo blocks (cream/charcoal rhythm) → FAQ block
  (6 Q&As min) → Final CTA. JSON-LD: 3 blocks always — `Service` + `FAQPage` +
  `BreadcrumbList`.
- **Standard city page structure (locked):** Hero (full-viewport, city-specific
  headline) → text bands + 1 body photo → city-specific FAQ block (4 Q&As min) →
  Final CTA. JSON-LD: 3 blocks always — `LocalBusiness` ref + `FAQPage` +
  `BreadcrumbList`.
- **Proof block**: vertical 9:16 video embeds via `facebook.com/plugins/video.php` +
  2×2 photo grid. **Do NOT use Facebook `/reel/` URLs — they render blank.**
- **Two-column embed-form section** (pitch copy + CRM iframe) as the default for forms;
  LeadConnector form + responsive Google Map iframe as a standard contact pairing.
- **GHL chat-widget + tracking script**: add documented insertion points (widget before
  `</body>`, tracking in `<head>`) so it's a token swap, not a hunt.
- **Footer column structure (locked):** Buildings column = service links + Financing.
  Company column = About, Contact, etc. Financing is a service, not a company page —
  ship this correct from day one. Financing in the Company column creates a dedup
  problem and looks structurally odd. (Mesquite §6.3.)
- **Ship one fully-built reference inner page** — not all-placeholder inner pages. The
  quality bar should exist in the template.

---

### Section rhythm / de-templating defaults
- Default page skeleton: deliberate alternating light/dark rhythm (dark hero, dark
  value/why-us, etc.). Pure-white content backgrounds; **exactly one dark section per
  file** (footer) plus the dark hero. Navy bands + gray fills are the "generic tell" —
  default off them.
- Hero ships **without** the trust-badge pill row (redundant with the eyebrow); keep
  the "Request Received" badge only on thank-you.

---

### SEO additions to standardize
- **FAQPage schema on both page types** (confirmed by Mesquite as required, not
  optional): service pages minimum 6 Q&As, city pages minimum 4 Q&As (city-scoped).
  Bake into template scaffolding — can't be accidentally omitted on a clone pass.
- **Phone in three places**, verified: E.164 `tel:` href, JSON-LD `telephone`, and
  meta/OG/Twitter descriptions.
- **thank-you trio**, verified together as one atomic unit: `noindex,nofollow` meta +
  excluded from sitemap + disallowed in robots.txt. Add a named checkbox to pre-launch
  audit.
- **areaServed scoping (Mesquite):** homepage `LocalBusiness` schema carries the full
  city list + broad region. Individual city page schemas: `areaServed` = that city only.
  Never copy the full list into a city page — it dilutes city-specific relevance and
  contradicts the anti-duplicate content rule.
- **Per-page title collision prevention (Mesquite):** the flagship service page title
  must be differentiated from the homepage title even when they share the primary
  keyword. Add a differentiator word or phrase. Example: homepage = "Storage Sheds in
  Alamo, TX | Mesquite Sheds & More" → service page = "Storage Sheds for Sale in
  Alamo, TX | Mesquite Sheds & More." Document the required differentiator pattern in
  CLAUDE.md's Per-Page Title section at strategy lock — not discovered during an audit.
- **City-agnostic service pages vs deep-per-city city pages** (anti-cannibalization);
  30–40% unique per city page. Keep explicit.
- **City page local anchors must be verified, not asserted (Mesquite):** specific
  highways, neighborhoods, landmarks, and school districts must be real and verifiable.
  When in doubt, flag with `[VERIFY]` in the draft. Invented local details are worse
  than generic copy — they signal inauthenticity to both readers and Google. Uniqueness
  must come from real differentiation.
- **GSC post-launch checklist (Mesquite operational detail):** request indexing in
  priority order (service pages → primary city → remaining cities → about); daily cap
  ≈10–12 URL inspections, spread across days. After 3–5 days, re-inspect the homepage
  canonical fields — "User-declared canonical" must exactly match "Google-selected
  canonical." If they differ, there is a host conflict to resolve before indexing other
  pages. "Page with redirect" entries for the non-canonical host variant are correct and
  expected — do not attempt to fix or re-request these.
- **Indexing priority + rate limit** (WORKFLOW): request indexing service pages →
  primary city → remaining cities → About; GSC caps ~10–12 inspections/day.

---

### Content / copy rules [Mesquite — new cluster]

**Verify ownership and staff roles before writing any personalized copy:**
Never infer who owns the business from social media posts. Social content often features
employees who are not owners. Add a mandatory field to CLAUDE.md:

```
Owner / Staff roles (confirmed directly from client, NOT inferred from social):
  - Owner(s): [NAME — confirmed]
  - Staff / lot contacts (not owners): [NAME, ROLE]
NOTE: Do not assume relationship or ownership status from social posts.
      Confirm explicitly before writing any personalized copy.
```

Root cause on Mesquite: early copy drafts positioned staff as owners based on social
post frequency. The actual owner required a site-wide copy sweep after the error was
caught. This single miss cost more time than the original build.

**"Family-run" vs. relationship claims:**
"Family-run" and "locally owned" are safe without implying specific structure. Do NOT
use "husband-and-wife team," "couple," or any relationship claim unless the client
explicitly confirms it in the onboarding form. The distinction between tone signal
("family feel") and factual claim ("run by husband and wife") must be held clearly.

**No-price rule for quote-driven products:**
Never publish fixed prices for carports, custom buildings, or any configured/sized
product — not in body copy, not in FAQ answers, not in JSON-LD `Offer` blocks. Pricing
is size-based and quote-driven. Always route to: quote request / call / visit CTA.
Document in CLAUDE.md's Hard Rules section so it applies to every page build.

**No-numbers rule for financing:**
No APR, no specific interest rate, no specific monthly payment, no credit score
threshold — unless these figures are explicitly confirmed in CLAUDE.md by the client.
Keep financing language general: "affordable monthly payments," "no credit check,"
"rent-to-own or buy outright." Unconfirmed financial figures are a compliance risk.

**Promo strip exception to the no-numbers rule:**
Specific dollar amounts in a time-limited promo banner (e.g. "$99 Down" Summer Sale
strip) are acceptable because: the banner is time-limited by design; it lives in a
clearly marked PROMO-START/END comment zone outside permanent copy; it can be rotated
or removed without touching any page body, metadata, or schema. Document both the
exception and the reason so future operators don't over-apply the rule.

**Product exclusions must travel with the feature:**
When a product has add-ons or options that carry exclusions, the exclusions must appear
whenever the upgrade is mentioned. Lock both the upgrade language AND the exclusion
language as a paired entry in CLAUDE.md. They cannot be decoupled during a build
prompt. (Mesquite example: Smart Space loft add-on carries height/size exclusions that
must appear any time the loft is mentioned.)

---

## CONSTANT-FILE EDITS (so these stop leaking)

### CLAUDE.md template — add these standing sections/fields
- **Owner / Staff roles field** (confirmed directly from client): owners vs. staff;
  relationship claims prohibited unless confirmed. (Mesquite addition — most expensive
  miss of the build.)
- **"Template sections to DELETE for this client"** field (insurance/financing block,
  fake carriers, any home-services artifact this trade doesn't offer).
- **"Locked Language"** section (per-client): warranty scope, insurance framing,
  depersonalization rules, anything that must never drift. Freeze unconfirmed claims.
- **No-price / No-numbers Hard Rules fields** with applicable page scope and exceptions
  documented. Promo strip exception noted alongside the rule. (Mesquite addition.)
- **Product upgrades + exclusions as paired entries** — never document the upgrade
  without its exclusion in the same field. (Mesquite addition.)
- **Single canonical display-phone field** + tracking-number-swap note.
- **`@type` / schema-variant field** + the conditional-schema rules (address, reviews,
  license, areaServed scoping, inventory page type).
- **Photo tier allocation table** (flagship / secondary push / standard service / city /
  about / inventory) so the builder never has to derive it per session.
- **Per-page title pattern** with a required differentiator documented at strategy lock,
  not discovered during an audit.
- **Shared-asset location + token-name registry** — record the moment assets/tokens are
  created.
- **CLAUDE.md must mirror the template's REAL path structure** — verify with `ls -R`
  before writing any page paths. Confirmed recurring failure on G-Uprooted and Mesquite.
- Soften the **frontend-design mandate** from "always, no exceptions" to "if available"
  — it isn't installed in Claude Code's env and threw a warning every session on both
  G-Uprooted and Mesquite.
- Keep what's working: `[NEEDS INPUT]` flag convention, "0 reviews → no widgets,"
  "Assets Status / pending blockers," `[VERIFY]` flag for unconfirmed local anchors.
- **thank-you trio verified** checkbox in the pre-launch audit section.

### WORKFLOW.md — add
- **File routing note up top:** Chat gets WORKFLOW + SOP + SEO-CONTENT + CLAUDE;
  Claude Code gets **only** SEO-CONTENT + CLAUDE. Any builder rule must live in
  CLAUDE.md — never assumed-read from WORKFLOW/SOP.
- **Audit-first / report-don't-fix** as the standard for ALL site-wide changes.
- **Verify file state before scoping**; never trust a "complete" report; verify math by
  counting directly from file content, not from a summary header.
- **Screenshot discipline:** Claude Code MUST save actual PNG files to
  `./temporary screenshots/screenshot-N.png`, report the exact path, and read the PNG
  with the Read tool before reporting visual findings. Prose descriptions of a page
  are not screenshots. Non-negotiable.
- **Three-command pre-commit check every commit:** `git status` (scope), `git branch`
  (on main), `git remote -v` (client repo). No exceptions.
- **Commit straight to main** — no feature branches. Intentional efficiency choice for
  single-developer static-site builds; document so a new operator doesn't add overhead.
- **Logical commit separation:** CLAUDE.md → own commit; brand_assets/ → own commit;
  page builds → grouped by phase. Never mix client-layer decisions with build work.
- **Commit assets immediately on placement.** Commit brand_assets/ in its own dedicated
  commit, separate from page builds.
- **Repo discipline:** dedicated client repo before commits; verify Vercel git target
  before deploy; set canonical host as Primary in Vercel on day one, not at launch.
- **One-page-at-a-time** for content builds; batch only for uniform sweeps (nav fix,
  color token change, asset rollout). State scope explicitly when a sweep is site-wide.
- **Vercel = dashboard-only** (plain HTML auto-detects "Other," no build command, root
  `./`); gitignore raw video and trim preview files.
- **GSC post-launch operational detail** (full URL for sitemap submission, priority
  indexing order, daily cap, canonical verification after 3–5 days, redirect entries
  are expected).
- Honest expectation: template reuse saves ~20–25% (mostly prompt/decision time),
  not 40%.

### SEO-CONTENT-PROMPT.md — add
- FAQPage-on-city-pages requirement; word-count targets written to the actual section
  rhythm (a 600–800 target lands ~900–1000 given section count — write the real number).

---

## NEW SOP PHASE — confirmed permanent

**Phase 7 — Harvest & roll-back (build close-out)** is now a proven phase, completed
after G-Uprooted and Mesquite. Add to NEXOR-BUILD-SOP.md as a formal close-out
requirement — not optional:

Before a finished client project goes dormant, run the template-harvest extraction
prompt in a fresh chat in that project. Merge the report into the master template +
constant files. Without this step, improvements stay trapped in per-project silos.
The Phase 7 harvest is what upgrades the template — every build should make the next
one materially better. The two harvests merged here prove the pattern works.

**Also add to NEXOR-BUILD-SOP.md Phase 1 (Client intake):**
As a named mandatory step: after cloning the template and before writing CLAUDE.md,
run `ls -R` or `find . -name "*.html"` to confirm the actual file tree, then document
paths in CLAUDE.md from what's on disk. (Confirmed recurring failure: G-Uprooted and
Mesquite both had CLAUDE.md list wrong paths for city pages and contact/thank-you.)

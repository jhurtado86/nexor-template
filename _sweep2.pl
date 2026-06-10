# Multiline structural sweep — run with: perl -0777 -i -p _sweep2.pl <files>

# Fix email (previous pass mis-interpolated the @)
s{mroptiglass\@outlook\.com}{hello\@yourbusiness.com}g;

# ── Remove global GHL script blocks (comment + script) -> placeholder ──────
s{[ \t]*<!-- GHL chat widget[^>]*-->\s*<script\b.*?</script>}{  <!-- GHL CHAT WIDGET SCRIPT GOES HERE -->}gs;
s{[ \t]*<!-- GHL external tracking[^>]*-->\s*<script\b.*?</script>}{  <!-- GHL EXTERNAL TRACKING SCRIPT GOES HERE -->}gs;
s{[ \t]*<!-- GHL form embed script[^>]*-->\s*<script\b[^>]*?form_embed\.js[^>]*></script>}{  <!-- GHL FORM EMBED SCRIPT GOES HERE -->}gs;

# ── Schema: AutoRepair -> LocalBusiness ───────────────────────────────────
s{"\@type": "AutoRepair"}{"\@type": "LocalBusiness"}g;

# ── Schema: strip PostalAddress block (+ its trailing comma) ──────────────
s{\s*"address":\s*\{[^{}]*"PostalAddress"[^{}]*\},}{}gs;

# ── Schema: strip aggregateRating block (+ its leading comma) ─────────────
s{,\s*"aggregateRating":\s*\{[^{}]*\}}{}gs;

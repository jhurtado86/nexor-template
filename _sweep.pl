# Global templatization sweep — run with: perl -i -p _sweep.pl <files>
# Order matters. Group 0 (full phrases) runs before token-level swaps so whole
# brand sentences are replaced before their parts get tokenized.

# ── Group 0: recurring full phrases / claims ──────────────────────────────
s{\QA Safer Way To Cruise The Road\E}{Trusted Local Home Services}g;
s{\QKeeping your loved ones safe on the road — expert auto glass repair and replacement across McAllen and the Rio Grande Valley.\E}{Professional home services you can count on — serving [City] and the surrounding [Region].}g;

# Insurance claims -> neutral value props
s{\Qfree with your insurance\E}{backed by our satisfaction guarantee}g;
s{\Qfree with most insurance\E}{with clear, upfront pricing}g;
s{\QFree With Insurance\E}{Free Estimates}g;
s{\QFree with insurance\E}{Free estimates}g;
s{\Qfree with insurance\E}{with no hidden fees}g;
s{\QWith Insurance\E}{Free Estimates}g;

# Warranty -> satisfaction guarantee
s{\QLifetime Warranty on Repairs\E}{Satisfaction Guaranteed}g;
s{\Qlifetime warranty on repairs\E}{a satisfaction guarantee}g;
s{\QLifetime warranty\E}{Satisfaction guarantee}g;
s{\Qlifetime warranty\E}{a satisfaction guarantee}g;

# Review-count specifics -> generic
s{\QSeventy-one five-star reviews\E}{Five-star reviews}g;
s{\Q71+ Five-Star Reviews\E}{Five-Star Reviews}g;
s{\Q71+ five-star reviews\E}{five-star reviews}g;
s{\Q71 five-star reviews\E}{five-star reviews}g;
s{\Q71 reviews\E}{our reviews}g;
s{\Q71+\E}{Top}g;

# Insurance carrier list (FAQ prose) -> generic
s{\QAllstate, USAA, Geico, Nationwide, Progressive, Liberty Mutual, Farmers, and Assurance\E}{most major providers}g;
s{\QAllstate, USAA, Geico, Nationwide, Progressive, Liberty Mutual, Farmers Insurance, and Assurance\E}{most major providers}g;

# ── Group 1: brand wordmark markup (before OptiGlass+ literal) ─────────────
s{\QOptiGlass<span class="plus">+</span>\E}{Your Business Name}g;

# ── Group 2: domain + email (lowercase, independent) ──────────────────────
s{\Qoptiglassplus.com\E}{yourbusiness.com}g;
s{\Qmroptiglass@outlook.com\E}{hello\@yourbusiness.com}g;

# ── Group 3: brand name ───────────────────────────────────────────────────
s{\QOptiGlass+\E}{Your Business Name}g;
s{OptiGlass}{Your Business Name}g;

# ── Group 4: phone ────────────────────────────────────────────────────────
s{\Q(956) 403-6132\E}{(555) 000-0000}g;
s{\Q+19564036132\E}{+15550000000}g;

# ── Group 5: region ───────────────────────────────────────────────────────
s{\QRio Grande Valley\E}{[Region]}g;
s{\bRGV\b}{[Region]}g;
s{\bthe Valley\b}{the [Region]}g;
s{\bValley\b}{[Region]}g;

# ── Group 6: cities (Title Case) ──────────────────────────────────────────
s{\bMcAllen\b}{[City]}g;
s{\bEdinburg\b}{[City 2]}g;
s{\bMission\b}{[City 3]}g;
s{\bPharr\b}{[City 4]}g;
s{\bSan Juan\b}{[City 5]}g;
s{\bPalm View\b}{[City 6]}g;

# ── Group 7: service display labels (longest/specific first) ──────────────
s{\QWindshield Chip &amp; Crack Repair\E}{Service Two}g;
s{\QWindshield Chip & Crack Repair\E}{Service Two}g;
s{\QRear Windshield Replacement\E}{Service Six}g;
s{\QMobile Auto Glass Service\E}{Service Four}g;
s{\QHeadlight Restoration\E}{Service Three}g;
s{\QWindow Replacement\E}{Service Five}g;
s{\QWindshield Replacement\E}{Service One}g;
s{\QWindshield Repair\E}{Service Two}g;
s{\QChip &amp; Crack Repair\E}{Service Two}g;
s{\QChip & Crack Repair\E}{Service Two}g;
# generic "Auto Glass" leftovers (after Mobile Auto Glass Service handled)
s{\QAuto Glass Services\E}{Our Services}g;
s{\QAuto Glass Repair and Replacement\E}{Professional Home Services}g;
s{\QAuto Glass Repair\E}{Home Services}g;
s{\QAuto Glass Service\E}{Home Services}g;
s{\QAuto Glass\E}{Home Services}g;

# ── Group 8: owner name ───────────────────────────────────────────────────
s{\bLuis\b}{our team}g;

# ── Group 9: file paths (rear before windshield-replacement) ──────────────
s{\Qrear-windshield-replacement.html\E}{service-six.html}g;
s{\Qwindshield-chip-crack-repair.html\E}{service-two.html}g;
s{\Qmobile-auto-glass-service.html\E}{service-four.html}g;
s{\Qheadlight-restoration.html\E}{service-three.html}g;
s{\Qwindow-replacement.html\E}{service-five.html}g;
s{\Qwindshield-replacement.html\E}{service-one.html}g;
s{\Qmcallen.html\E}{city-one.html}g;
s{\Qedinburg.html\E}{city-two.html}g;
s{\Qmission.html\E}{city-three.html}g;
s{\Qpharr.html\E}{city-four.html}g;
s{\Qsan-juan.html\E}{city-five.html}g;
s{\Qpalm-view.html\E}{city-six.html}g;

# ── Group 10: hex colors (case-insensitive) ───────────────────────────────
# darks -> neutral dark
s{#0a1220}{#1A1A2E}gi;
s{#091422}{#1A1A2E}gi;
s{#0e1d30}{#1A1A2E}gi;
s{#0c1d30}{#1A1A2E}gi;
s{#0c1c30}{#1A1A2E}gi;
s{#112540}{#26263E}gi;
s{#182f52}{#2E2E46}gi;
s{#1d2d3e}{#26263E}gi;
s{#253545}{#2E2E46}gi;
s{#2c3f52}{#34344E}gi;
# accents -> red family
s{#d96418}{#E63946}gi;
s{#e47528}{#D62F3D}gi;
s{#ef9550}{#F2737D}gi;
s{#1a5296}{#E63946}gi;
s{#2463af}{#D62F3D}gi;
s{#2d6dbf}{#E04250}gi;
s{#4a8fd6}{#EC5A66}gi;
s{#c2d9f2}{#F2C9CD}gi;
s{#eaf2fc}{#FCEEEF}gi;
s{#7fb0e6}{#F0888F}gi;
s{#9cc4ee}{#F09AA2}gi;
s{#a7cbee}{#F2A6AC}gi;
# neutral grays / light UI
s{#53667a}{#5B5B68}gi;
s{#88a0b4}{#8E8E9C}gi;
s{#4b5a6e}{#54545F}gi;
s{#8a99aa}{#9A9AA8}gi;
s{#8fa3be}{#9C9CAC}gi;
s{#9db2cc}{#A6A6B6}gi;
s{#cfe0f4}{#D8D8E2}gi;
s{#dce7f4}{#ECECF1}gi;
s{#f4f7fa}{#F3F3F6}gi;
s{#c8d8e8}{#D0D0DA}gi;
s{#f7fafd}{#F7F7FA}gi;

# ── Group 11: rgb triplets (lookarounds guard against partial numbers) ────
s{(?<![\d.])26,\s*82,\s*150(?![\d.])}{26,26,46}g;
s{(?<![\d.])217,\s*100,\s*24(?![\d.])}{230,57,70}g;
s{(?<![\d.])74,\s*143,\s*214(?![\d.])}{230,57,70}g;
s{(?<![\d.])9,\s*20,\s*34(?![\d.])}{26,26,46}g;
s{(?<![\d.])5,\s*12,\s*28(?![\d.])}{15,15,26}g;
s{(?<![\d.])6,\s*16,\s*28(?![\d.])}{20,20,34}g;
s{(?<![\d.])10,\s*18,\s*32(?![\d.])}{22,22,38}g;
s{(?<![\d.])100,\s*50,\s*10(?![\d.])}{90,30,40}g;

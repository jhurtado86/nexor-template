# Remove the footer "street address" block (no address placeholder per template).
# run: perl -0777 -i -p _sweep3.pl <files>
s{\n[ \t]*<div class="flex items-start gap-2 text-slate-light text-sm">\s*<svg\b[^>]*>.*?</svg>\s*4515 N 10th St[^<]*</div>}{}gs;

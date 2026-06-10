// Splice a generic body (hero + <main>) into a page, replacing everything
// from the hero <section> through </main>. Keeps nav (above) and footer (below).
// usage: node _apply.mjs <targetFile> <bodyFile> <token>
import fs from 'fs';
const [, , target, bodyFile, token] = process.argv;
let html = fs.readFileSync(target, 'utf8');
let body = fs.readFileSync(bodyFile, 'utf8')
  .replaceAll('__SVC__', token)
  .replaceAll('__CITY__', token);
const start = html.indexOf('<section class="hero-bg');
let endIdx, consume;
if (html.includes('</main>')) { endIdx = html.indexOf('</main>'); consume = '</main>'.length; }
else { endIdx = html.search(/\n[ \t]*<!--[^]*?FOOTER|<footer/); consume = 0; } // fallback: cut at footer block
if (start < 0 || endIdx < 0) { console.error('ANCHORS NOT FOUND in ' + target); process.exit(1); }
const before = html.slice(0, start);
const after = html.slice(endIdx + consume);
fs.writeFileSync(target, before + body.trimEnd() + '\n\n  ' + after.trimStart());
console.log('spliced ' + target + ' (token=' + token + ')');

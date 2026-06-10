// Genericize per-page <head> descriptions/keywords + first JSON-LD description.
// usage: node _fixhead.mjs <file> <token> <kind>   kind = service | city
import fs from 'fs';
const [, , file, token, kind] = process.argv;
let h = fs.readFileSync(file, 'utf8');

const desc = kind === 'city'
  ? `Professional home services in ${token}, TX. Same-day service, free estimates, and clear upfront pricing across the [Region]. Call Your Business Name at (555) 000-0000.`
  : `Professional ${token} in [City], TX and across the [Region]. Same-day service, free estimates, and clear upfront pricing. Call Your Business Name at (555) 000-0000.`;
const ogdesc = kind === 'city'
  ? `Home services in ${token}, TX — six core services, same-day, mobile to your door. Free estimates. Call Your Business Name at (555) 000-0000.`
  : `Professional ${token} in [City], TX. Same-day service, free estimates, mobile to your door. Call Your Business Name at (555) 000-0000.`;
const kw = kind === 'city'
  ? `home services ${token} TX, ${token} home services, service one ${token}, service two ${token}, local home services ${token}, Your Business Name`
  : `${token} [City] TX, ${token} [Region], ${token} [City 2], ${token} [City 3], home services [City] TX, Your Business Name`;
const schemaDesc = kind === 'city'
  ? `Professional home services in ${token}, TX and across the [Region]. Six core services, same-day availability, free estimates, clear upfront pricing, and a satisfaction guarantee.`
  : `Professional ${token} in [City], TX and across the [Region]. Same-day service, free estimates, clear upfront pricing, and a satisfaction guarantee. Serving [City], [City 2], [City 3], [City 4], [City 5], and [City 6].`;

const setMeta = (re, val) => { h = h.replace(re, (m, a, b) => a + val + b); };
setMeta(/(<meta name="description" content=")[^"]*(")/, desc);
setMeta(/(<meta name="keywords" content=")[^"]*(")/, kw);
setMeta(/(<meta property="og:description" content=")[^"]*(")/, ogdesc);
setMeta(/(<meta name="twitter:description" content=")[^"]*(")/, ogdesc);
// first JSON-LD "description": "..."  (the Service/area schema)
h = h.replace(/("description":\s*")[^"]*(")/, (m, a, b) => a + schemaDesc + b);

fs.writeFileSync(file, h);
console.log('head fixed: ' + file + ' (' + token + ', ' + kind + ')');

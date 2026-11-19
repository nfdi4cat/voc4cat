# Security policy

## Reporting a vulnerability

Report security vulnerabilities privately through GitHub's private vulnerability reporting:
<https://github.com/nfdi4cat/voc4cat/security/advisories/new>

Do not open a public issue for a vulnerability.
The maintainers acknowledge a report within 5 working days and keep you informed until it is resolved.

## Scope

This repository covers:

- the GitHub Actions workflows that check contributions, convert them to turtle and publish the vocabulary
- the vocabulary pages and documentation published on GitHub Pages, and the w3id.org redirects to them

Report vulnerabilities in the conversion tool to [voc4cat-tool](https://github.com/nfdi4cat/voc4cat-tool/security/advisories/new),
and those in workflows inherited unchanged from the template to [voc4cat-template](https://github.com/nfdi4cat/voc4cat-template/security/advisories/new).

## Supported versions

Fixes are made on the `main` branch and published with the next build.
Released vocabulary versions are fixed snapshots and are not changed.

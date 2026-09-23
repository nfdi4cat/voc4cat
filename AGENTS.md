# AGENTS.md

Instructions for AI agents working on Voc4Cat, and for the people directing them.

## What this repository is

Voc4Cat is a SKOS vocabulary for catalysis and related disciplines, maintained as part of NFDI4Cat.
A contribution is one spreadsheet placed at `inbox-excel-vocabs/voc4cat.xlsx`.
The CI pipeline validates it, converts it to RDF/turtle and commits the result to `vocabularies/`.
Those turtle files are pipeline output; they are never edited by hand.

## Your role

Voc4Cat does not accept submissions that no human has checked.
A named contributor decides every concept and answers for it in review.
Work that helps:

- drafting labels and definitions for a human to check
- searching the vocabulary for duplicates and near-duplicates
- testing a draft against the guidelines and the hierarchy rules below
- explaining where a concept belongs, and why
- reviewing a submitted pull request
- writing the pull request description

When something cannot be verified against the documents listed below or against the vocabulary itself, say so.
Do not invent IRIs, labels, column names or tool options.

## Read first

| Topic | Document |
| --- | --- |
| Contribution workflow, spreadsheet sheets and columns | `docs/docs_usage/how-to-contribute.md` |
| Editorial rules for labels and definitions | `docs/docs_usage/guidelines.md` |
| Hierarchy, collections, top concepts | `docs/docs_usage/organizing-concepts.md` |
| What may be changed on an existing concept | `docs/docs_usage/changing-concepts.md` |
| Quick start for contributors | `CONTRIBUTING.md` |
| IRI design | `iri-design.md` |

Issues are opened from the forms in `.github/ISSUE_TEMPLATE/`:

- `request-ids` allocates the ID range a contributor mints new IDs from. Required before adding concepts.
- `improvement` proposes a vocabulary change. Its "Kind of change" checkboxes drive the labels, applied by `label-vocabulary-changes.yml`.
- `improvement_guidelines` proposes a change to the guidelines themselves.
- `bug` reports something wrong in the published vocabulary or in the pipeline.

## Hard rules

- Edit `inbox-excel-vocabs/voc4cat.xlsx` only. A pull request that edits turtle files is wrong.
- New IDs must lie in the contributor's range in `idranges.toml`. The pipeline checks this against the pull request author.
- Nothing is removed.
  A concept that should no longer be used is deprecated through *Obsoletion reason* and *dct:isReplacedBy*; deletions are rejected automatically.
- Once a concept is merged, the meaning its IRI carries is fixed. Wording, parents, collection membership and mappings stay improvable.
- Do not change the template structure: sheet names, header rows, column order.
- At most 20 new concepts per pull request. Fewer is better.
- Definitions must be original or from a CC0-compatible source; CC-BY-SA sources such as the IUPAC Gold Book cannot be copied.
  Cite the source in *Source Vocab IRI or URL*, with its license and rights holder, or in *Influenced by IRIs*.

## Preparing a submission

The rules below are the ones submissions get wrong most often. The full set is in `docs/docs_usage/guidelines.md`.

Labels:

- *Preferred Label* and *Definition* are required, each with a language code (`en` when none is given).
- Lower case throughout, except proper names: Brønsted acid site, Langmuir-Hinshelwood mechanism.
- A noun or noun phrase, without prepositions: alcohol oxidation, not oxidation of alcohol.
- British English: litre, colour, licence, modelling, immobilize, analyse.
- Singular for mass nouns, abstract concepts and unique entities; plural for count nouns and for classes with several members.
- The full form is preferred over the acronym, which becomes an *Alternate Label*. The same holds for the hyphenated and non-hyphenated spelling.
- No slashes, no trademarks, no names of software or device models, no initial articles.

Definitions:

- One sentence where possible, starting with a capital and ending with a full stop.
- Say what the concept is, not what it does, and do not open with the term being defined.
- Not circular, not negative, and implicitly distinct from neighbouring concepts.

Hierarchy:

- Every new concept needs a `skos:broader` chain that reaches a top concept:
  `voc4cat:0000180` physical entity, `voc4cat:0000181` non-temporal abstract entity,
  `voc4cat:0000182` temporal abstract entity (with events `0000183`, actions `0000184` and processes `0000185` below it),
  `voc4cat:0000186` attributes.
- `skos:broader` expresses IS-A and nothing else.
  Test every parent: is the concept a *kind of* its parent, or a *property of* it? A property means the parent is wrong.
- One parent is the norm.
  Add a second only when each parent passes the IS-A test on its own, neither is an ancestor of the other, and the two come from different classifications.
- Never place an attribute under the entity it describes. One generic attribute (width) beats object-specific ones (substrate width, film width).
- Grouping by context or by HAS-A belongs in a `skos:Collection`. PART-OF is not modelled in Voc4Cat at all.

Before opening the pull request:

- Check for duplicates with `just duplicates-new`, the label screening the pipeline runs, and consider alternate labels, singular and plural forms and hyphenation.
- Put mappings in the Mappings sheet, to established vocabularies only, using the most specific property that fits the evidence.
  Use `skos:relatedMatch` sparingly and say why.
- For a concept that is already merged, confirm that data annotated with its IRI would still be about the same thing afterwards.
  If not, deprecate it and add a new concept instead.
- State motivation and scope in the pull request description.

## Reviewing a submission

Content, in order of importance:

- every new concept classified, with a broader chain that reaches a top concept
- IS-A-only hierarchy: attributes not parked under entities, collections used for contextual grouping
- no duplicate of an existing concept
- label and definition following the guidelines
- edits to existing concepts leaving their meaning unchanged
- mappings no more specific than the evidence supports

Process:

- The submitted spreadsheet is transient.
  Once the conversion succeeds, `ci-pr-commit.yml` strips `inbox-excel-vocabs/*.xlsx` from every commit and rewrites the branch,
  so a contributor with a local clone needs `git fetch origin && git reset --hard origin/<branch>` rather than `git pull`.
  Review the generated turtle and the run artifacts, not a file that is no longer in the branch.
- "No spreadsheets in the branch" stays red when the conversion failed, or when the fork is owned by an organization and the bot cannot push to it.
  The second case is a GitHub limitation rather than the contributor's doing: the pull request has to be resubmitted from a fork in a personal account.
- For a failing check, give one short hint per failing job and name the job. Do not paste logs.

Style:

- Summarize what changed and why in plain language, and leave the summary out when the pull request description already has one.
- Do not restate diffs or link individual hunks; the diff is already on screen.
- Separate blocking issues from follow-ups. Much can be fixed after the merge.
- Do not block a small contribution over minor definition style.
- Be welcoming, explain why something matters, and give concrete next steps.

## Checking a submission locally

`just setup` installs the tool, `just setup-all` adds semantic similarity scoring for `just duplicates`.

- `just all` runs the pipeline's sequence: check the spreadsheet, convert to turtle, screen added concepts for duplicate labels, build the HTML documentation, rebuild the spreadsheet.
- `just check`, `just convert`, `just duplicates-new`, `just docs`, `just xlsx` and `just join` run the steps individually.
- `just duplicates` screens the whole vocabulary for similar concepts, not only the added ones; it is a maintainer's audit and needs `just setup-all`.
- Output goes to `outbox/`; `_main_branch/`, `_published/` and `_xlsx-backup/` are local scaffolding. All four are ignored by git.
- The ID-range check is advisory locally.
  To reproduce the pipeline's strict behaviour, uncomment the `GITHUB_ACTIONS` and `GITHUB_ACTOR` exports in the `justfile`.

The tool version the pipeline installs is pinned in `.github/workflows/ci-pr.yml`. Read it there rather than assuming one.

## For curators

Pushing to a contributor's branch requires "allow edits by maintainers" on the pull request:

```bash
gh pr checkout <PR#>
git push https://github.com/<contributor>/voc4cat.git HEAD:main
```

After a rebase use `git push --force` rather than `--force-with-lease`:
the pipeline rewrites the branch, so the remote hashes are not the ones last seen locally.

## Repository map

| Path | Contents |
| --- | --- |
| `vocabularies/voc4cat/IDs0000xxx/0000180.ttl` | one turtle file per concept or collection, bucketed by ID; pipeline output |
| `inbox-excel-vocabs/` | the submitted spreadsheet, removed again by the pipeline |
| `idranges.toml` | ID length, IRI construction, contributor ID ranges, prefixes, concept scheme metadata |
| `docs/` | Sphinx site: `docs_usage/` for contributors, `docs_maintenance/` for curators |
| `templates/` | optional spreadsheet template sheets |
| `demo/` | notebooks showing how to use the vocabulary |
| `outbox/`, `_main_branch/`, `_xlsx-backup/` | local build scaffolding, not committed |

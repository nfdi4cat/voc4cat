---
myst:
  html_meta:
    "description lang=en": "Voc4Cat conforms to the vp4cat SHACL profile: what conformance guarantees, which profile version each release conforms to, and how profile errors relate to the spreadsheet columns."
---

# Conformance to the vp4cat profile

Voc4Cat conforms to [vp4cat](https://w3id.org/nfdi4cat/vp4cat), a SHACL profile for SKOS vocabularies.
vp4cat is derived from the [vocpub profile](https://github.com/AGLDWG/vocpub-profile) of the Australian Government Linked Data Working Group (AGLDWG).
The concept scheme declares the conformance with `dct:conformsTo <https://w3id.org/nfdi4cat/vp4cat>`.

Every pull request validates the whole vocabulary against the profile after the spreadsheet has been converted to turtle.
If the validation fails, the pipeline commits no turtle: the spreadsheet stays in the branch, and the required check "xlsx file removed by CI" stays red and blocks the merge.

## What conformance guarantees

A vocabulary that passes validation has the following properties:

- The concept scheme has a title, a definition, a created and a modified date, at least one creator, a publisher, a statement of its origin and at least one top concept.
- Every concept has at least one preferred label and at least one definition, and at most one of each per language.
- Every concept belongs to the Voc4Cat concept scheme.
- Every collection has a preferred label and a definition, at most one of each per language, and at least one member.
- Every person or organization named as creator or publisher has a name and a URL or email address.

The profile does not check the meaning of a concept, its position in the hierarchy or the quality of its definition.
A concept without a parent becomes a top concept and passes validation.
Voc4Cat has four intended top concepts, and the [hierarchy rules](organizing-concepts.md) are checked in review.

## Profile version of each release

The profile column names the default profile of the voc4cat-tool release the pipeline used when the Voc4Cat release was made.

:::{table}
:align: left

| Release | Declared `dct:conformsTo` | Profile |
|---------|---------------------------|---------|
| v2026-10-31 | `https://w3id.org/nfdi4cat/vp4cat` | vp4cat 5.3 |
| v2026-02-24 | `https://w3id.org/nfdi4cat/voc4cat/profile/vp4cat/` | vp4cat 5.2 |
| v2024-04-08 to v2025-10-14 | none | vocpub 4.7 |
| v2023-08-17 and v2023-09-03 | none | vocpub before 3.0 |

:::

`https://w3id.org/nfdi4cat/vp4cat` always resolves to the current vp4cat version.
vp4cat 5.3 differs from vp4cat 5.2 in allowing one preferred label per language instead of exactly one per concept.

## What the profile requires from a contribution

Most requirements of the profile are met by the pipeline and by the configuration in `idranges.toml`, which only maintainers change.
A contribution can break the following ones:

:::{table}
:align: left

| Requirement | Sheet: column | Where a violation is reported |
|-------------|---------------|-------------------------------|
| A preferred label and a definition for every concept | Concepts: *Preferred Label*, *Definition* | conversion |
| At most one preferred label and one definition per language | Concepts: *Concept IRI*, *Language Code* | spreadsheet check |
| A preferred label and a definition for every collection | Collections: *Preferred Label*, *Definition* | conversion |
| At least one member in every collection | Concepts: *Member of collection(s)*, *Member of ordered collection # position* | profile validation |

:::

A concept may have one row per language.
The spreadsheet check rejects two rows with the same *Concept IRI* and the same *Language Code*.

The pipeline adds everything else the profile asks for: `skos:inScheme` and `dct:provenance` on every concept and collection, and `rdfs:isDefinedBy` on every collection.
The concept scheme metadata and the creators come from `idranges.toml`.

## Reading the error messages

The checks run in three steps, locally with `just all` and in the pipeline of a pull request:

1. `just check`, pipeline step "Run voc4cat (pre-convert checks)", checks the spreadsheet itself.
   It reports, for example, two rows with the same IRI and language code.
2. `just convert`, pipeline step "Run voc4cat (convert)", converts the spreadsheet to turtle.
   An empty required cell stops the conversion with "Unexpected error." and a traceback.
   Its last line names the empty field, for example `Required field 'definition' is empty` or `Required field 'preferred_label' is empty`.
3. `just convert`, pipeline step "Run voc4cat (post-convert checks)", validates the turtle against the profile.

A profile violation is reported with the number of the requirement and the IRI of the concept or collection, the *focus node*.
An excerpt of such a report:

```text
ERROR   |VIOLATION: Validation Result in MinCountConstraintComponent (http://www.w3.org/ns/shacl#MinCountConstraintComponent):
	Severity: sh:Violation
	Focus Node: <https://w3id.org/nfdi4cat/voc4cat_0009990>
	Message: Requirement 2.2.4 A Collection MUST indicate at least one Concept instance that is within the collection with use of the skos:member predicate. ...
INFO    |Validation summary: 0 info, 0 warnings, 1 violations
ERROR   |Terminating with error: The vocabulary is not valid according to the vp4cat-5.3 profile.
```

The pipeline treats warnings like violations: a result of either severity fails the pull request.
The messages keep the wording of vocpub.
For preferred labels they say "exactly one title", although vp4cat 5.3 accepts one preferred label per language.

## Profile and differences to vocpub

The profile versions, the differences between vp4cat and vocpub, and how a vocabulary selects a profile are documented in the [voc4cat-tool reference](https://nfdi4cat.github.io/voc4cat-tool/reference/schemas.html#vp4cat-profile).

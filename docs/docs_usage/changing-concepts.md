---
myst:
  html_meta:
    "description lang=en": "Which changes to a Voc4Cat concept are allowed and when: the meaning of an identifier is fixed once published, while hierarchy, mappings and labels stay improvable."
---

# What may be changed on an existing concept?

A concept in Voc4Cat can be improved after it has been accepted: definitions get sharper, wrong parents get corrected, mappings get added.
What cannot change is the meaning its identifier carries.
This page states which changes fall on which side, and from when on.

## The rule

:::{important}
Once a concept is in Voc4Cat, the meaning its IRI carries is fixed.
Everything else stays improvable.
:::

Voc4Cat is a **terminology**, not an ontology or a knowledge graph.
What it offers is the concept with an identifier, a label, and an agreed definition.
The hierarchy, the collections and the mappings organize those concepts so they can be found; they are curation rather than axioms that annotated data inherits.

This drives the rules for changing concept labels vs. relations:

- Change what a concept **denotes**, and every dataset annotated with it silently becomes wrong. Nothing warns anyone, because the IRI did not change.
- Move a concept to a **better parent**, and no dataset becomes wrong. Hierarchical queries return something different, which is the point of the correction.

To test your change request, you can ask:

> Would data that someone has already annotated with this IRI still be about the same thing after my change?

If yes, it is an improvement and allowed.
If no, you are giving an existing identifier a new meaning: [deprecate the concept](#deprecating-a-concept) and add a new one instead.

## What may be changed, and when

A concept is **in Voc4Cat** as soon as the pull request that introduced it has been merged.
From that moment it is part of the [development version](https://w3id.org/nfdi4cat/voc4cat/dev) and it may appear in any later release.

| Change class | Where you edit it | New in your pull request | Already in Voc4Cat<br>(development version or release) |
| --- | --- | --- | --- |
| **Identity** (what the IRI denotes) | Concepts: *Preferred Label*, *Definition* | free | **not allowed**; deprecate it and add a new concept |
| **Wording** (same meaning, better phrasing) | Concepts: *Preferred Label*, *Definition* | free | allowed via PR |
| **Parent relations** (placement in the hierarchy) | Concepts: *Parent IRIs* | free | allowed via PR |
| **External mappings** | Mappings: *Related*, *Close*, *Exact*, *Narrower*, *Broader Matches* | free | allowed via PR |
| **Collection membership** | Concepts: *Member of collection(s)*, *Member of ordered collection # position* | free | allowed via PR |
| **Collection nesting** | Collections: *Parent Collection IRIs* | free | allowed via PR |
| **Collection identity** (what a collection IRI denotes) | Collections: *Preferred Label*, *Definition* | free | **not allowed**; same rule as for concepts |
| **Additive** (more labels, translations, notes) | Concepts: *Alternate Labels*, *Change Note*, *Editorial Note*; one row per language | free | allowed via PR |
| **Deprecation** | Concepts: *Obsoletion reason*, *dct:isReplacedBy* | not needed; correct it instead | allowed via PR |
| **Deletion** (removing the row) | — | free | **not allowed**; rejected automatically |

What the three verdicts mean:

- **free**: Change it in the pull request you are working on. The concept has not been published yet, so nobody can be relying on it.
- **allowed via PR**: Submit the change like any other contribution, in its own pull request. A curator reviews it.
- **not allowed**: The change will be rejected. The table names what to do instead.

:::{note}
A release does not lock or unlock anything; the rules above apply from the merge onwards.
With Voc4Cat consumers can pick their own trade-off between stability and being up to date: pin to a [dated release](../index.md#all-releases), to the latest release or to the development version.
:::

## What counts as the same meaning

The *Preferred Label* is not frozen; the concept behind it is.

| Change | Allowed? | Why |
| --- | --- | --- |
| Fixing a [spelling](guidelines.md#spelling-variants), or promoting the [more common term](guidelines.md#preferred-label) for the same thing to *Preferred Label* | yes | Same concept, better wording. |
| Rewriting a vague definition so that it says the same thing more precisely | yes | The set of things covered does not move. |
| Narrowing a definition so that cases it used to cover are now excluded | no | Data annotated under the wider reading becomes wrong unnoticed. |
| Relabelling *external standard concentration* as *internal standard concentration* | no | A different substance, and therefore a different concept. |

The last row is a real request ([issue #280](https://github.com/nfdi4cat/voc4cat/issues/280)): leave the existing concept alone and add a new one if the new meaning is needed.

## Correcting a parent

Correcting a wrong parent is allowed at every stage, and it is expected.
Changing `skos:broader` does not change what the IRI denotes; it changes where the concept sits.

In Voc4Cat `skos:broader` expresses IS-A relations and nothing else.
A quick test whenever you set a parent: **is my concept a kind of its parent, or a property of its parent?**
If it is a property, the parent is wrong.
The full reasoning, including how to express HAS-A and PART-OF instead, is in [Hierarchies, Relations, and Collections](organizing-concepts.md).

## Deprecating a concept

Concepts are never deleted once they are in Voc4Cat, because the IRI has to keep resolving for everyone who has used it.
A concept that should no longer be used is **deprecated**: it stays in the vocabulary, marked as obsolete, and points at a replacement where there is one.

On the concept's row in the **Concepts** sheet, *Obsoletion reason* is a dropdown offering six choices:

- The concept is not clearly defined and usage has been inconsistent.
- This concept was added in error.
- More specific concepts were created.
- This concept was converted to a collection.
- The meaning of the concept is ambiguous.
- Lack of evidence that this function/process/component exists.

:::{admonition} Example: deprecating a duplicate
:class: tip
`voc4cat:0009001` turns out to duplicate the older `voc4cat:0009002` (IRIs invented for the example). On its row:

| Column | Value |
| --- | --- |
| Obsoletion reason | This concept was added in error. |
| dct:isReplacedBy | `voc4cat:0009002` |

The pipeline sets `owl:deprecated` to `true` and records the reason as a `skos:historyNote`.
The concept keeps its IRI and stays resolvable; consumers see that it is obsolete and where to go instead.
:::

:::{caution}
No concept in Voc4Cat carries `owl:deprecated` yet.
If you are the first to use it, check the resulting Turtle in the pull request artifacts and report anything unexpected as an [issue](https://github.com/nfdi4cat/voc4cat/issues).
:::

Collections are deprecated in the same way, using the *Obsoletion reason* and *dct:isReplacedBy* columns of the **Collections** sheet.

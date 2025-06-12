# Guidelines for Voc4Cat

The Voc4Cat guidelines have been developed as a blueprint for
suggesting, adding, and editing content to the vocabularies developed
throughout NFDI4Cat. The aim of this document is to provide guidelines
to guarantee consistency and coherence on selection of concepts and
terms between all catalysis-related vocabularies in NFDI4Cat.

The first version of the Voc4Cat guidelines, were inspired by the AGROVOC
editorial guidelines of FAO.<sup>\[1\]</sup> This second updated version
aligns our guidelines closer to the  American National Standards
Institute (ANSI) / National Information Standards Organization (NISO)
Z39.19-2005 (R2010) Standard.<sup>\[2\]</sup>

The guidelines have been through excessive discussions and were evolved
over the course of *Task Area 1 (TA1): Ontology Development and Metadata
Standards* of NFDI4Cat.

Please note that all language dependent parts refer to only the default language (British English).

## General recommendations

### Preferred label

The *Preferred Label* of a concept refers to the primary term used to
represent a concept. It should be the most commonly used and widely
understood term. Such terms can be drawn from the catalysis-related
scientific literature. Between two or more variants of label for a
concept, the most frequently used term should be selected as the
preferred label. The remaining terms can be used as *Alternate Labels*
(see below). If the choice is not clear, opinions of experts of the
field regarding the preferred form of terms may be sought.

### Alternate label

When a concept can be expressed by two or more terms, the one(s) not
selected as the *Preferred Label* can be used as *Alternate Label(s)*.
The relationship between *Preferred Label* and *Alternate Label(s)* is
an equivalence relationship in which each label is regarded as referring
to the same concept. *Alternate Label(s)* can be e.g., synonyms (terms
whose meanings are regarded as the same or nearly the same in a wide
range of contexts), lexical or spelling variants (see below) etc.

### Spelling variants

British English spelling must be used as the spelling standard for the
development of Voc4Cat. Exceptions may be made for proper names. If
variant spellings exist and are commonly recognized, each should be
entered in Voc4Cat, one being the *Preferred Label* and the rest being
used as *Alternate Labels*. Spelling rules for English:

1. words ending in -re/-er. Prefer -re: litre, metre;

2. words ending in -our/-or. Prefer -our: colour;

3. words ending in -ence/-ense. Prefer -ence (for nouns): licence;

4. words ending in -l and followed by a suffix. Prefer -ll (not -l):
   modelling;

5. words ending in -ize/-ise. Prefer -ize: immobilize, categorize;

6. words ending in -yse/-yze. Prefer -yse: analyse, catalyse

### (Gender-) neutral language

(Gender-) neutral language should be used whenever possible.

### Duplicates

Duplicates of existing concepts must be avoided. *Preferred Labels*,
*Alternate Labels*, *Singular* and *Plural* forms*, hyphenation* should
also be considered when checking for the presence of duplicates.

### Definitions

A formal explanation of the meaning of a concept. The following
considerations should be followed when adding definitions:

1. A good definition explains what a concept is, not what it does.

2. Only one definition per language is mandatory. The default language
    for the definitions is English.

3. A definition is a sentence that requires orthographical rules, such
    as starting a sentence with a capital letter and ending a sentence
    with a full stop (period). The definitions need to be concise
    (ideally one sentence) and clear.

4. A definition should implicitly explain the difference from closely
    related concepts.

5. Circular, imprecise, or negative definitions should be avoided.

6. A definition of a concept should not start with mentioning the
    concept that it defines.

7. If the source of a definition is not the contributor, a
    trusted and stable source should be used. Credit must be given to
    the original creator. When copyright or license is restrictive, it
    must be respected. To identify the source, a URL, or a descriptive
    source (with details of the publication) can be used.

### Things to avoid

1. Trademarked names (e.g., brand names and commercial names). Example:
    Teflon vs. polytetrafluoroethylene.

2. Names of individuals (unless as a part of the name of a method or
    technique)

3. Names of specific software or models of devices.

4. Names of policies, programs, or initiatives.

5. Neologisms, slang, and jargon. When no widely accepted alternative
    exists, the neologism, slang, or jargon term should be accepted as a
    term.

## Single vs. multi-word (compound) terms

1. If terms are seen in both multi-word and one-word forms (e.g.,
    “thermal conductivity” vs. “thermoconductivity”), the preferred term
    should be the one-word form. The two-word form can be included as an
    *Alternate Label*.

2. Multi-word (compound) terms should express a single concept or unit
    of thought. Complex compound concepts are discouraged. It is
    recommended (if possible) to split compound words into simpler
    concepts.

3. Multi-word (compound) terms should be established as terms in the
    following circumstances:

<!-- -->

1. Splitting the parts would lead to ambiguity or a loss of meaning.

2. One component of the term is not relevant to the scope of Voc4Cat or
    is too vague to exist as an independent term.

3. The meaning of the compound term as a whole is not the sum of the
    meaning of its parts.

4. The compound term has become so familiar in common use, or in the
    field covered by Voc4Cat, that it is considered for practical
    purposes to represent a single concept.

## Singular vs. plural

Use **singular** for

- **mass nouns** which are names for non-countable entities subject to the question “How much?”.
 Examples are names of materials or substances.
- names of **abstract concepts** (e.g., activities, properties, disciplines).
- names of **unique entities**, no matter if abstract or concrete.

Use **plural** for

- **count nouns** which are names for entities or concepts that are subject to the question “How many?” (e.g., redox cycles).
- names representing a **class** with more than one member (e.g., plastics).

Where the singular and plural forms of a term represent different
concepts, separate terms for each should be added to Voc4Cat as
appropriate. The distinction may be indicated by a qualifier, e.g.,
Wood (material), woods (forested areas).

## Lower vs. capital letters

Concepts should be written in all lower-case letters.

However, the first letter of proper names must be a capital, when the proper
name occurs within longer terms, such in combination with “method”,
“theory”, or “process” (e.g., Brønsted acid site, Lewis acid site,
Röntgen crystallography, Langmuir-Hinshelwood mechanism).

## Grammatical forms

### Nouns

The grammatical form of a concept must be a noun or noun phrase. Noun
phrases are compound terms that may be established as terms if they
represent a single concept. When possible, noun phrases should exclude
prepositions (e.g., carbohydrate metabolism rather than metabolism of
carbohydrates). Terms in the form of prepositional noun phrases should
be restricted to concepts that cannot be expressed in any other way, or
that have become idiomatic (e.g., burden of proof, state of the art).

### Verbs

Verbs should be nominalized (transformed into nouns). Activities should
be represented by nouns or gerunds (e.g., freezing rather than freeze,
distillation rather than distill).

### Adjectives

Adjectives and adjectival phrases used alone may be established as terms
in Voc4Cat under certain special circumstances. Single adjectives may be
used in a “nominal” way; that is, the noun is obvious from the context,
or the adjective is used to describe and attribute of the concept object
other than topic, such as color or size. Certain noun phrases may be
used to modify other nouns, e.g., *high frequency* can modify the noun
*waves*. The guidelines for adjectives may be applied to such noun
phrases. Adjectives should only be used in compound terms, such as
“continuous flow”, but never alone. The use of adjectives (without a
noun), verbs, and initial articles (e.g., “A”, “An”, “The”) should be
avoided. Example: drying in an oven vs. drying in oven (prefer drying in
oven).

### Adverbs

Single adverbs are rarely used. Adverbs such as “very” or “highly”
should not be used alone as terms. A phrase beginning with such an
adverb may be accepted as a term only when it has acquired a specialized
meaning within a domain (e.g., very high frequency).

## Typographical marks

### Hyphens

The non-hyphenated version of a concept is always preferred, unless the
hyphenated version is always the one used in literature. Both versions
of a concept (hyphenated and non-hyphenated) must be included (one of
them as an alternate label). Examples: photoexcitation vs.
photo-excitation, pretreatment vs. pre-treatment, counter electrode vs.
counter-electrode, transition metal vs. transition-metal. Hyphens should
be retained in topical terms when dropping them would lead to ambiguity.
Hyphens should be retained where they occur as part of proper nouns (see
also 7.5.1), abbreviations (see also 7.11), or chemical names (see also
7.12).

### Parentheses

Parentheses should be avoided in Voc4Cat concepts and definitions
whenever possible. Parentheses should be used only to enclose qualifiers
and trademark indicators, or when they constitute part of a term.

### Apostrophes

Apostrophes: Apostrophes generally should not be used in Voc4Cat
concepts. Two exceptions:

1. Possessive Case: Apostrophes indicating the possessive case, whether
    in a singular or plural, should be retained. The singular form is
    most frequently found in eponyms.

2. Proper names: Apostrophes that are part of proper names must be
    retained.

### Slashes

The slash (/) must be avoided (e.g., oxidation / reduction, forward /
backward reaction, working / counter electrodes) whenever possible. Two
separate concepts must be defined if the terms differ in meaning, or one
of them should be set as an *Alternate Label* if the meaning is the
same. Antonyms (concepts with opposite definitions) should be generated
into a separate concept.

## Prepositional phrases

Prepositional phrases should be avoided (e.g., alcohol oxidation rather
than oxidation of alcohol, catalyst pretreatment rather than
pretreatment of catalyst).

## Punctuation, diacritics, and special characters

Appropriate punctuation, diacritics and other special characters of an
individual language should be used (e.g., ü, ö, ß, ô, ñ). Examples:
Ångström, Brønsted acid sites, Röntgen crystallography. Mössbauer
effect. Symbols and punctuation marks should not be used except in
trademarks and proper names.

## Empty spaces and commas

(Extra) empty spaces must be avoided before, within and after a term.
Commas should be avoided unless in chemical substances. Unnecessary
empty spaces could compromise search results.  Examples (using `·` as space):

1. `·Semiconductor`

2. `Semiconductor·`

3. `Charge··transfer`

## Initial articles

Initial articles in terms should be avoided except when required to
convey essential information. Remove the initial article when the term
is clear without it. If the initial article is an integral part of a
proper name, and should be searchable, it should be included in the term
in direct order.

## Abbreviations and acronyms

1. The full form (written out) of a word / term should be generally
    selected as the preferred term. The abbreviated form or acronym
    should be included as the non-preferred label (e.g., gas
    chromatography vs. GC, density functional theory vs. DFT).

2. Abbreviations and acronyms should be selected as preferred labels of
    terms only when they have become so well established that the full
    form of the term or proper name is rarely used. In this case, the
    full form of the term should be included as an alternate label.

3. Many acronyms and abbreviations stand for more than one word or
    phrase; the full form of the term should therefore be selected as
    the term in preference to the abbreviated form, even when the
    abbreviation has only one value in the domain of Voc4Cat.

## Chemical compounds and elements

In principle, Voc4Cat does not accept terms for chemical compounds
already defined in other controlled vocabularies (e.g., the *Chemical
Entities of Biological Interest - [ChEBI](https://www.ebi.ac.uk/chebi/)).
In cases and if contributing to ChEBI is not an option, a chemical
compound or element is not defined elsewhere, the following guidelines
should be followed for the term to be considered for Voc4Cat:

1. Chemical compounds and elements in their full form, are written in
    lowercase, such as “carbon”, while the chemical symbol(s) is(are)
    always capitalized, such as “C”.

2. The full form is always the preferred term, whereas the symbol is
    the non-preferred term.

3. Chemical compounds and chemical elements written out are
    non-countable nouns and should be explained in the singular.

4. The definition should contain a unique identifier for chemical
    substances, such as the CAS number.

5. British English spelling is recommended, e.g., prefer aluminium (UK)
    over aluminum (USA).

## Loanwords and translations

Loanwords are terms borrowed from the other languages that have become
naturalized in the borrowing language. If such terms are well
established in the catalysis domain, they should be admitted into
Voc4Cat. Diacritics should be included if required. In all cases where a
concept can be expressed by both a loanword and a translated equivalent,
the most widely used of the two should be used as the preferred label
and the other as an alternate label.

## Mappings

Mappings are used to relate concepts in Voc4Cat to concepts in other controlled vocabularies or ontologies.
This enables interoperability, data integration, and reuse across different systems and domains.
We only add mappings to well-established external vocabularies or ontologies that are relevant to catalysis.
The mappings are reviewed and approved by the Voc4Cat team before being added to the vocabulary assuring a high level of mapping confidence.

Voc4Cat uses the [SKOS](https://www.w3.org/TR/skos-reference/) (Simple Knowledge Organization System) standard for representing mappings.
SKOS provides a set of properties for expressing relationships to concepts in other concept schemes (or OWL ontologies):

| Mapping relation | Description |
|------------------|-------------|
| `skos:exactMatch` | Indicates that two concepts are equivalent in meaning and can be used interchangeably in all contexts.|
| `skos:closeMatch`| Indicates a high degree of similarity, but not complete interchangeability for example due to slight differences in meaning or context.|
| `skos:broadMatch`<br>`skos:narrowMatch` | Indicate hierarchical relationships between concepts in different schemes.|
| `skos:relatedMatch`| Indicates an associative relationship, where none of the concepts is more general than the other.|

Mappings in Voc4Cat are intended to be simple connections to external concepts.
They are expressed purely in the SKOS data model which has the consequence that assertions about the mapping itself are not possible (e.g. about the mapping-author).
If you need mappings with rich metadata,
consider using [SSSOM](https://github.com/mapping-commons/sssom) (Simple Standard for Sharing Ontology Mappings) or
[JSKOS](https://gbv.github.io/jskos/) (JSON for Knowledge Organization Systems),
which allow for detailed mapping assertions, provenance, and other metadata.

When creating mappings in Voc4Cat, please follow these guidelines:

- Only create mappings to well-established external vocabularies or ontologies.
- Use the most specific SKOS mapping property that fits the relationship.
- Use hierarchical relationships between concepts only if mappings on the same hierarchical level are not possible.
- Use skos:relatedMatch relationships sparingly. If you suggest them, explain why the proposed loose mapping is worth to add.

:::{admonition} Example
The skos:concept **[voc4cat:0000222 (hydroformylation)](https://w3id.org/nfdi4cat/voc4cat_0007201)
should be mapped to [RXNO:hydroformylation](https://purl.obolibrary.org/obo/RXNO_0000272)**, an owl:class.<br>
**Which mapping-relation would be appropriate?**<br>
Concepts are not only defined by their textual definition, but implicitly also by their position in the class hierarchy and other axioms.
`skos:exactMatch` would imply that the definition of `RXNO:Hydroformylation` is exactly the same as the definition of `voc4cat:0000222` (hydroformylation).
However, `RXNO:Hydroformylation` is defined as a "planned process" in the [RXNO ontology](https://purl.obolibrary.org/obo/RXNO_0000272), 
which is not the case for `voc4cat:0000222` (hydroformylation) in the [voc4cat](https://w3id.org/nfdi4cat/voc4cat) vocabulary.
Therefore, the less specific **`skos:closeMatch` should be used.**<BR> *Source of example: Hendrik Borgelt ([issue #157](https://github.com/nfdi4cat/voc4cat/issues/157)).*
:::

## References

1. FAO. 2022. The AGROVOC Editorial Guidelines 2020 – Second edition.
    Rome. DOI: 10.4060/cb8640en

2. “Guidelines for the Construction, Format, and Management of
    Monolingual Controlled Vocabularies”, ANSI/NISO Z39.19 – 2005
    (R2010). DOI: 10.3789/ansi.niso.z39.19-2005R2010.

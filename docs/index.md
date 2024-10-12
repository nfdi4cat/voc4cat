---
hide-toc: true
---

# Welcome to Voc4Cat

The Voc4Cat vocabulary is a collection of concepts (or "terms") from the field of catalysis and related disciplines such as chemical engineering or materials science.
For each concept, Voc4Cat provides a unique resolvable persistent identifier and a carefully written textual definition,
which reflects the community's shared understanding of the concept's meaning.

By using the identifiers provided by Voc4Cat to annotate data, rather than just words and symbols, ambiguity as to what is meant is avoided.
Producing Voc4Cat-annotated data contributes to realising the vision of machine-actionability described as the ultimate goal of the [FAIR principles](https://doi.org/10.1038/sdata.2016.18).

Voc4Cat conforms to the [SKOS](https://www.w3.org/TR/skos-reference/) standard.
The vocabulary is available in rdf/turtle or rdf/xml format to facilitate integration with other tools and services.
Voc4Cat is also available in xlsx (Excel) format, making it easy for researchers to submit additions and updates.

::::{grid} 3
:::{grid-item-card}
:link: https://w3id.org/nfdi4cat/voc4cat/dev
**Documentation**, preview
^^^

```{image} _static/voc4cat-pylode-docs.webp
:height: 180
:align: center
:alt: screenshot of pylode generated vocabulary documentation
```

+++
Most current, \
matches XLSX file
:::

:::{grid-item-card}
:link: https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx
**Vocabulary**, XLSX file
^^^

```{image} _static/voc4cat-concept-sheet.webp
:height: 180
:align: center
:alt: screenshot concepts in xlsx worksheet
```

+++
Most current, \
download to contribute
:::

:::{grid-item-card}
:link: https://w3id.org/nfdi4cat/voc4cat
**Documentation**, released
^^^

```{image} _static/voc4cat-pylode-docs.webp
:height: 180
:align: center
:alt: screenshot of pylode generated vocabulary documentation
```

+++
Latest release, \
v2024-04-08
:::
::::

By default the HTML documentation is served from the URLs below.
Corresponding RDF-files (turtle or xml) can be requested from the same URLs using content negotiation.

| Version                       | Permanent URL                               |
| ----------------------------- | ------------------------------------------- |
| Most current (in development) | ```https://w3id.org/nfdi4cat/voc4cat/dev``` |
| Latest release                | ```https://w3id.org/nfdi4cat/voc4cat```     |

```{tip}
:class: dropdown
:class: open
**`voc4cat`** is the preferred and [registered](https://bioregistry.io/registry/voc4cat) **prefix** for the Voc4Cat vocabulary.

With the prefix, long URIs can be shortened to **compact URI**s (also called *CURIES*). These short notations are typically  preferred in linked-data applications.

For example, the compact URI of `https://w3id.org/nfdi4cat/voc4cat_0005001` is `voc4cat:0005001`.
```

## Older releases

- **v2024-04-08**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/v2024-04-08), permanent url `https://w3id.org/nfdi4cat/voc4cat/v2024-04-08`
- **v2023-09-03**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/v2023-09-03"), permanent url `https://w3id.org/nfdi4cat/voc4cat/v2023-09-03`
- **v2023-08-17**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/v2023-08-17), permanent url `https://w3id.org/nfdi4cat/voc4cat/v2023-08-17`

```{toctree}
:hidden:
Overview <self>
GitHub page <https://github.com/nfdi4cat/voc4cat>
About <docs_usage/about>
```

```{toctree}
:caption: For Users
:hidden:
:maxdepth: 2

docs_usage/how-to-use
docs_usage/how-to-contribute
docs_usage/guidelines
```

```{toctree}
:caption: For Maintainers
:glob:
:hidden:

docs_maintenance/*
```

```{toctree}
:caption: Guidelines (V2.0)
:hidden:
:maxdepth: 3

All-in-one-page (as published) <docs_usage/published-guidelines-v2>
```

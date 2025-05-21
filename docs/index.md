---
hide-toc: true
---

# Welcome to Voc4Cat

The Voc4Cat vocabulary is a collection of concepts (or "terms") from the field of catalysis and related disciplines such as chemical engineering or materials science.
For each concept, Voc4Cat provides a unique resolvable persistent identifier and a carefully written textual definition,
which reflects the community's shared understanding of the concept's meaning.

By using the identifiers provided by Voc4Cat to annotate data, rather than just words and symbols, ambiguity as to what is meant is avoided.
Producing Voc4Cat-annotated data contributes to realising the vision of machine-actionability described as the ultimate goal of the [FAIR principles](https://doi.org/10.1038/sdata.2016.18).

::::{grid} 3
:::{grid-item-card}
:link: https://w3id.org/nfdi4cat/voc4cat/dev
**Documentation**, preview
^^^

```{image} _static/voc4cat-pylode-docs.png
:align: center
:alt: screenshot of pylode generated vocabulary documentation
```

+++
<small>Most current, matches XLSX file</small>
:::

:::{grid-item-card}
:link: https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx
**Vocabulary**, XLSX file
^^^

```{image} _static/voc4cat-concept-sheet.png
:align: center
:alt: screenshot concepts in xlsx worksheet
```

+++
<small>Download to contribute</small>
:::

:::{grid-item-card}
:link: https://w3id.org/nfdi4cat/voc4cat
**Documentation**, released
^^^

```{image} _static/voc4cat-pylode-docs.png
:align: center
:alt: screenshot of pylode generated vocabulary documentation
```

+++
<small>Latest release **v2025-05-22**</small>
:::
::::

Voc4Cat conforms to the [SKOS](https://www.w3.org/TR/skos-reference/) standard.
The vocabulary is available in rdf/turtle or rdf/xml format to facilitate integration with other tools and services.
Voc4Cat is also available in xlsx (Excel) format, making it easy for researchers to submit additions and updates.

By default the HTML documentation is served from the permanent URLs below.
Corresponding RDF-files (turtle or xml) can be requested from the same URLs using content negotiation.
The direct links in the table are just given for convenience; they are not permanent.

:::{role} raw-html(raw)
:format: html
:::

| Version        | Permanent URL                               | Direct RDF download links                 |
| -------------- | ------------------------------------------- | ----------------------------------------- |
| Most current   | ```https://w3id.org/nfdi4cat/voc4cat/dev``` | {raw-html}`<img src="_static/W3C-SKOS-blue.svg" alt="W3C SKOS logo" style="vertical-align: middle" width=90px>` [Turtle](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.ttl) - [RDF/XML](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xml) |
| Latest release | ```https://w3id.org/nfdi4cat/voc4cat```     | {raw-html}`<img src="_static/W3C-SKOS-blue.svg" alt="W3C SKOS logo" style="vertical-align: middle" width=90px>` [Turtle](https://nfdi4cat.github.io/voc4cat/latest/voc4cat.ttl) - [RDF/XML](https://nfdi4cat.github.io/voc4cat/latest/voc4cat.xml) |

```{tip}

**`voc4cat`** is the preferred and [registered](https://bioregistry.io/registry/voc4cat) **prefix** for the Voc4Cat vocabulary.

With the prefix, long URIs can be shortened to **compact URI**s (also called *CURIES*). These short notations are typically  preferred in linked-data applications.

For example, the compact URI of `https://w3id.org/nfdi4cat/voc4cat_0005001` is `voc4cat:0005001`.
```

## All releases

- **v2025-05-22**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/v2025-05-22), permanent url `https://w3id.org/nfdi4cat/voc4cat/v2024-05-22`
- **v2024-12-17**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/v2024-12-17), permanent url `https://w3id.org/nfdi4cat/voc4cat/v2024-12-17`
- **v2024-04-08**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/v2024-04-08), permanent url `https://w3id.org/nfdi4cat/voc4cat/v2024-04-08`
- **v2023-09-03**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/v2023-09-03"), permanent url `https://w3id.org/nfdi4cat/voc4cat/v2023-09-03`
- **v2023-08-17**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/v2023-08-17), permanent url `https://w3id.org/nfdi4cat/voc4cat/v2023-08-17`

### Yanked releases

- **v2025-05-21**: Incomplete release due to failed publishing job.

```{toctree}
:hidden:
Overview <self>
GitHub page <https://github.com/nfdi4cat/voc4cat>
Kanban board <https://github.com/orgs/nfdi4cat/projects/11>
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

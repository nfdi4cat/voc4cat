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

## Vocabulary Files & Documentation

```{todo} Add links to rdf and xlsx vocabulary files and to the pylode html-documentation generated from SKOS.
```

::::{grid} 2
:::{grid-item-card}  Title Card 1
Header 1
^^^
Card 1 content
+++
Footer 1
:::

:::{grid-item-card}  Title Card 2
Header 2
^^^
Card 2 content
+++
Footer 2
:::
::::

:::{card} Clickable Card (external)
:link: https://example.com

The entire card can be clicked to navigate to <https://example.com>.
:::

```{toctree}
:hidden:
SKOS files & docs <self>
About <usage/about>
```

```{toctree}
:caption: For Users
:hidden:
:maxdepth: 2

usage/how-to-use
usage/how-to-contribute
usage/guidelines
```

```{toctree}
:caption: For Maintainers
:glob:
:hidden:

maintenance/*
```

```{toctree}
:caption: Guidelines (V2.0)
:hidden:
:maxdepth: 3

All-in-one-page (as published) <usage/published-guidelines-v2>
```

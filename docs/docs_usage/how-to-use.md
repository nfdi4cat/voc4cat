---
myst:
  html_meta:
    "description lang=en": "How to use the Voc4Cat vocabulary: browse online, download RDF, content negotiation, terminology service APIs, Python/rdflib, and integration tips."
---

# How to use Voc4Cat?

Voc4Cat provides persistent identifiers and definitions for catalysis concepts in the machine-readable [SKOS](https://www.w3.org/TR/skos-reference/) format.
This page gives an overview of the various ways to access and work with Voc4Cat in your tools, code, and data workflows.

## Browsing Voc4Cat online

There are several web-based entry points for exploring the vocabulary:

- **pyLODE HTML documentation** -- The auto-generated documentation shows the full concept hierarchy, definitions, and relationships. The [latest release](https://w3id.org/nfdi4cat/voc4cat) is the recommended stable reference. A [development version](https://w3id.org/nfdi4cat/voc4cat/dev) is also available and reflects the most current state of the vocabulary.

- **Skosmos at ZB MED** -- The [Skosmos instance at ZB MED](https://semanticlookup.zbmed.de/skosmos/voc4cat/) provides search, hierarchical browsing, and a REST API tailored for SKOS vocabularies. It shows the latest published release.

- **TIB Terminology Service** -- The [TIB service](https://terminology.tib.eu/ts/ontologies/voc4cat) offers an alternative OLS-based interface and API. It also shows the latest published release.

```{tip}
For SKOS vocabularies, the Skosmos service is recommended because it understands SKOS-specific features such as concept hierarchies, collections, and semantic relations.
```

## Downloading Voc4Cat

The vocabulary is available for download in multiple formats.
The direct links below are convenient but not permanent -- for stable references, use the permanent URLs listed on the [main page](../index).

| Format | Development version | Latest release |
|--------|-------------------|----------------|
| Turtle (.ttl) | [dev/voc4cat.ttl](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.ttl) | [latest/voc4cat.ttl](https://nfdi4cat.github.io/voc4cat/latest/voc4cat.ttl) |
| RDF/XML (.xml) | [dev/voc4cat.xml](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xml) | [latest/voc4cat.xml](https://nfdi4cat.github.io/voc4cat/latest/voc4cat.xml) |
| Excel (.xlsx) | [dev/voc4cat.xlsx](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx) | -- |

### Content negotiation

Content negotiation allows you to request a specific format from the same permanent URL.
By setting the `Accept` header, you can download Turtle, RDF/XML, or get the HTML documentation -- all from `https://w3id.org/nfdi4cat/voc4cat`.

::::{tab-set}
:::{tab-item} curl
```bash
# Download Turtle format
curl -L -H "Accept: text/turtle" -o voc4cat.ttl https://w3id.org/nfdi4cat/voc4cat

# Download RDF/XML format
curl -L -H "Accept: application/rdf+xml" -o voc4cat.xml https://w3id.org/nfdi4cat/voc4cat

# Download a specific release
curl -L -H "Accept: text/turtle" -o voc4cat.ttl https://w3id.org/nfdi4cat/voc4cat/v2025-10-14
```
:::
:::{tab-item} Python
```python
import requests

url = "https://w3id.org/nfdi4cat/voc4cat"
r = requests.get(url, headers={"Accept": "text/turtle"})
with open("voc4cat.ttl", "w", encoding="utf-8") as f:
    f.write(r.text)
```
:::
::::

```{note}
The **development version** is rebuilt on every merge to the main branch and reflects the latest accepted changes.
**Releases** are tagged snapshots deposited on [Zenodo](https://doi.org/10.5281/zenodo.8313340) and published to terminology services.
For reproducible references in publications, always use a specific release version.
```

## Using Voc4Cat via terminology service APIs

Both Skosmos and TIB provide REST APIs for programmatic access to the vocabulary.
The Skosmos REST API is recommended for SKOS vocabularies.

### Skosmos REST API examples

```bash
# Search for concepts by text
curl "https://semanticlookup.zbmed.de/skosmos/rest/v1/voc4cat/search?query=catalysis"

# Get data for a specific concept by IRI
curl "https://semanticlookup.zbmed.de/skosmos/rest/v1/voc4cat/data?uri=https://w3id.org/nfdi4cat/voc4cat_0000001"

# Get narrower concepts of a given concept
curl "https://semanticlookup.zbmed.de/skosmos/rest/v1/voc4cat/narrower?uri=https://w3id.org/nfdi4cat/voc4cat_0000196"
```

The full Skosmos REST API documentation is available at <https://semanticlookup.zbmed.de/skosmos/rest/v1/>.

The TIB Terminology Service also offers a REST API; see <https://terminology.tib.eu/ts/ontologies/voc4cat> for details.

```{tip}
The NFDI4Cat data repository [repo4cat](https://repository.nfdi4cat.org/) uses the Skosmos REST API to integrate Voc4Cat concepts into its metadata forms.
```

## Working with Voc4Cat in Python

The vocabulary can be loaded and queried directly in Python using [rdflib](https://rdflib.readthedocs.io/):

```python
from rdflib import Graph, Namespace
from rdflib.namespace import SKOS, RDF

g = Graph()
g.parse("https://nfdi4cat.github.io/voc4cat/dev/voc4cat.ttl", format="turtle")

VOC4CAT = Namespace("https://w3id.org/nfdi4cat/voc4cat_")

# List all concepts with their labels
for concept in g.subjects(predicate=RDF.type, object=SKOS.Concept):
    label = g.value(concept, SKOS.prefLabel)
    print(f"{concept} -- {label}")
```

```{tip}
For a complete walkthrough -- including searching, navigating the hierarchy, SPARQL queries, and visualizing the concept graph -- see our [Jupyter notebook demo](https://github.com/nfdi4cat/voc4cat/blob/main/demo/explore-voc4cat.ipynb).

To run the notebook locally, install the dependencies from [`demo/requirements.txt`](https://github.com/nfdi4cat/voc4cat/blob/main/demo/requirements.txt).
```

## Using Voc4Cat in data management tools

Voc4Cat concepts can be used to annotate research data in various data management platforms.

**repo4cat (Dataverse)** -- The [repo4cat](https://repository.nfdi4cat.org/) data repository, operated by NFDI4Cat, integrates Voc4Cat via the Skosmos REST API. Researchers can select Voc4Cat concepts when annotating datasets, ensuring consistent and machine-readable metadata.

**NOMAD (FAIRMAT)** -- The [nomad-catalysis-plugin](https://github.com/FAIRmat-NFDI/nomad-catalysis-plugin) integrates Voc4Cat concepts into [NOMAD](https://nomad-lab.eu/), providing a data schema for heterogeneous catalysis that uses Voc4Cat identifiers for standardized annotation. See the accompanying [preprint](https://doi.org/10.26434/chemrxiv-2025-kx99k) for details.

**LabImotion / Chemotion (NFDI4Chem)** -- [Chemotion](https://www.chemotion.net/) is an electronic lab notebook developed within [NFDI4Chem](https://nfdi4chem.de/) that supports vocabulary-based annotation. Using Voc4Cat concepts in Chemotion is a potential future integration.

```{note}
The list of tools with Voc4Cat integration is growing.
If you are using Voc4Cat in a tool not listed here, please let us know by [creating an issue](https://github.com/nfdi4cat/voc4cat/issues/new?assignees=&labels=voc4cat+guidelines&projects=&template=improvement_guidelines.yaml&title=%F0%9F%93%9D+%3Ctitle%3E).
```

## Using Voc4Cat concepts in data models and ontologies

### LinkML data models

SKOS concepts from Voc4Cat can be referenced as permissible values in [LinkML](https://linkml.io/) data model schemas.
For example, a dataset schema could restrict a field to only accept Voc4Cat concept IRIs:

```yaml
enums:
  CatalysisResearchField:
    permissible_values:
      photocatalysis:
        meaning: voc4cat:0000001
      electrocatalysis:
        meaning: voc4cat:0000204
      biocatalysis:
        meaning: voc4cat:0000207
```

See the [LinkML documentation](https://linkml.io/linkml/schemas/enums.html) for details on using enumerations with external concept identifiers.

A real-world example is the [pid4cat-model](https://nfdi4cat.github.io/pid4cat-model/), which uses Voc4Cat concepts to provide URIs and definitions for its [`RelationType`](https://nfdi4cat.github.io/pid4cat-model/latest/elements/enums/RelationType/) enumeration.

### SKOS concepts in OWL ontologies

SKOS concepts are not OWL classes -- they represent terms in a vocabulary rather than formal categories in a logical framework.
However, SKOS and OWL can be used together.
To connect Voc4Cat concepts with classes in an OWL ontology, use SKOS mapping properties such as `skos:exactMatch` or `skos:closeMatch`:

```turtle
ex:PhotocatalysisProcess a owl:Class ;
    skos:exactMatch voc4cat:0000001 .
```

This approach preserves the distinct roles of the vocabulary (informal, consensus-based definitions) and the ontology (formal logic and reasoning) while making the relationship explicit.
See the [SKOS Reference](https://www.w3.org/TR/skos-reference/#mapping) for more on mapping properties.

---

What other topics would you like to read about here? Let us know by [creating an issue](https://github.com/nfdi4cat/voc4cat/issues/new?assignees=&labels=voc4cat+guidelines&projects=&template=improvement_guidelines.yaml&title=%F0%9F%93%9D+%3Ctitle%3E)!

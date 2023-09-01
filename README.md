[![](https://github.com/nfdi4cat/voc4cat-template/workflows/Publish/badge.svg)](https://github.com/nfdi4cat/voc4cat-template/actions)
[![](https://github.com/nfdi4cat/voc4cat-template/workflows/Build/badge.svg)](https://github.com/nfdi4cat/voc4cat-template/actions)`

# A SKOS vocabulary for the catalysis disciplines

> **The first collection of terms was just published (June-2023)**.
> **We will add more content in the coming weeks and month.**

The vocabulary has been created and maintained as part of the [NFDI4Cat](http://www.nfdi4cat.org) initiative and follows our [Voc4Cat Guidelines](https://doi.org/10.5281/zenodo.7669183).

This repository was created from the template [voc4cat-template](https://github.com/nfdi4cat/voc4cat-template).
It uses the [voc4cat-tool](https://github.com/nfdi4cat/voc4cat-tool) and GitHub features like pull requests, gh-actions, gh-pages etc. to reduce the maintenance workload for contributors and editors.

## Basic principles

The process to contribute to the **voc4cat vocabulary** is as follows:

- get and update the vocabulary file (xlsx),
- submit a pull request with the updated file,
- collaborate on the pull request with editors or other github users,

After approval your pull request is ready to be merged by the editors. The merge will include your contribution into the SKOS-vocabulary file in the `vocabularies`-folder. Upon merge the corresponding documentation and a joined turtle file will be automatically built and published to gh-pages.

Besides this "in-developement" version of the vocabulary, the latest released version and older releases are also available.

Links to specific versions:

- latest released version
  - https://w3id.org/nfdi4cat/voc4cat
- "in-development" vesion (built from most recent commit to main)
  - `voc4cat` vocabulary documentation https://w3id.org/nfdi4cat/voc4cat/dev
- current and earlier releases identified by release date (the "v" before the data is optional)
  - General scheme `https://w3id.org/nfdi4cat/voc4cat/{release-tag}`<BR>for example https://w3id.org/nfdi4cat/voc4cat/v2023-08-17

We have configured [content negotiation](https://en.wikipedia.org/wiki/Content_negotiation) for these urls.
So you can get the human readable HTML documentation but also the machine-readable turtle file of the vocabulary from the same url.
The IRI-design is described in detail in [iri-design.md](https://github.com/nfdi4cat/voc4cat/main/iri-design.md).

To get the turtle file you may use tools like [curl](https://curl.se/) or [httpie](https://httpie.io/docs/cli) that allow to specify the content type. For example, to download the turtle file of the latest released version:

```bash
# with httpie
http -o voc4cat.ttl --download https://w3id.org/nfdi4cat/voc4cat Accept:"application/x-turtle"
# with curl
curl -o voc4cat.ttl -L -H "accept:application/x-turtle" https://w3id.org/nfdi4cat/voc4cat
```

We also provide links to turtle files of individual concepts and collections:

- for the latest release `https://w3id.org/nfdi4cat/voc4cat_{NUMERIC-ID}.ttl`<BR>for example https://w3id.org/nfdi4cat/voc4cat_0000123
- for releases by date-tag `https://w3id.org/nfdi4cat/voc4cat/{release-tag}/voc4cat_{NUMERIC-ID}.ttl`<BR>for example https://w3id.org/nfdi4cat/voc4cat/v2023-08-17/voc4cat_0000123

In addition to the specific versions, an [index page](https://nfdi4cat.github.io/voc4cat/) is generated that links to all tagged releases.
It is placed at the root of gh-pages.

## Contributing to vocabularies

To discuss about the **voc4cat**-vocabulary maintained here, create an [issue](https://github.com/nfdi4cat/voc4cat/issues).

To contribute new concepts or collections or change existing ones, you may either submit your contributions as Excel/xlsx-file or (as an expert) as new/changed turtle file.

> *To try out the workflow with some example data, you may use [voc4cat-playground](https://github.com/nfdi4cat/voc4cat-playground) which is almost identical to this repository but is not meant to last.*

Here are the steps for submitting updates in Excel.

- Get the Excel/xlsx-vocabulary file
  - The most recent version of the vocabulary is always available via github-pages https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx
- Make changes to the Excel file. If you want to add something new you need to [request a range of IDs](https://github.com/nfdi4cat/voc4cat/issues/new/choose) for you.
- Add the xlsx file to your clone of the repository into the folder `inbox-excel-vocabs`
  - The name of the file must match the vocabulary that you want to update. So do not change the filename, but keep `voc4cat.xlsx`.
- Create a pull request with the updated Excel-file in this repository.
  - Please describe your changes and the motivation for the changes in the pull request note or link to an issue with this information. This will help reviewers to understand the proposed change and decide about it.
- Your pull request will be processed automatically by a CI/CD pipeline that typically runs less than a minute.
- Review the artifacts/logs generated by the CI pipeline.
  - The [workflow artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts) will contain an updated xlsx file that is recreated from the updated turtle-file.
- If all is good your contribution will be either
  - directly merged by the maintainers
  - or a discussion will be started about what else is needed
  - or why the proposed change may not fit.
- If you need to fix something update the pull request branch. This will trigger the pipeline to run again.

Finally, when the proposed merge request is accepted, your changes will be integrated in the vocabularies in the folder `vocabularies`. The vocabularies are stored in split form using one folder per vocabulary. Each concept, collection and concept scheme is stored in a separate file using the ID-part of the IRI as file name.

See [inbox-excel-vocabs/README.md](inbox-excel-vocabs/README.md) for a minimal example how to test the submission process.

## How to suggest improvements to the tooling & template?

To discuss about the workflow for maintaining SKOS vocabularies based on this template, create an [voc4cat-template issue](https://github.com/nfdi4cat/voc4cat-template/issues).

To discuss about the tool that converts Excel to SKOS in gh-actions of this template, create an [voc4cat-tool issue](https://github.com/nfdi4cat/voc4cat-tool/issues).

## Authors and acknowledgment

### Vocabularies

- *List all contributors.*

### Voc4cat template

- David Linke (ORCID: 0000-0002-5898-1820) - Initial setup of repository and CI/CD pipelines

## License

### Vocabularies

All vocabularies in this repository are CC0 licensed, see [LICENSE](LICENSE) for details.

### Voc4cat template

The template itself is CC0 licensed, see [LICENSE](LICENSE). Although there is no obligation, we nevertheless appreciate if our work is acknowledged in any derivative work.

## Acknowledgement

This work was funded by the German Research Foundation (DFG) through the project "[NFDI4Cat](https://www.nfdi4cat.org) - NFDI for Catalysis-Related Sciences" (DFG project no. [441926934](https://gepris.dfg.de/gepris/projekt/441926934)), within the National Research Data Infrastructure ([NFDI](https://www.nfdi.de)) programme of the Joint Science Conference (GWK).

We thank the [W3ID Consortium](https://w3id.org) for making its permanent url service available to the community.

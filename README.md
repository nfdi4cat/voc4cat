[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8313340.svg)](https://doi.org/10.5281/zenodo.8313340)
[![](https://github.com/nfdi4cat/voc4cat/workflows/Publish/badge.svg)](https://github.com/nfdi4cat/voc4cat/actions)
[![](https://github.com/nfdi4cat/voc4cat/workflows/Build/badge.svg)](https://github.com/nfdi4cat/voc4cat/actions)
[<img src="https://www.w3.org/Icons/SW/Buttons/sw-skos-blue-v.svg" height="20" alt="SKOS logo" />](https://www.w3.org/TR/skos-primer/)

# A SKOS vocabulary for the catalysis disciplines

> **The first collection of terms was published in June 2023.**
> **Our goal is to continuously extend the vocabulary to cover all subdisciplines of catalysis.**
> **Please join if you like to help.**

The Voc4Cat vocabulary and its [guidelines](https://doi.org/10.5281/zenodo.13773255) have been created and are maintained as part of the [NFDI4Cat](http://nfdi4cat.org) initiative.

This repository was created from the template [voc4cat-template](https://github.com/nfdi4cat/voc4cat-template).
It uses the [voc4cat-tool](https://github.com/nfdi4cat/voc4cat-tool) and GitHub features like pull requests, actions, pages etc. to reduce the maintenance workload for contributors and editors.

## Basic principles

Voc4cat makes contributing easy for everyone with a GitHub account. The process is essentially *(see further below for details or browse through our [step-by-step guide](https://doi.org/10.5281/zenodo.13757351)*:

- Download the [most current vocabulary file (xlsx)](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx),
- Edit the vocabulary file in Excel,
- Submit a pull request with the updated file placed in the folder `inbox-excel-vocabs`.<BR>It is important to keep the original file name `voc4cat.xlsx`.

After approval your pull request is ready to be merged by the editors. 
The merge will integrate your contribution into the SKOS-vocabulary files in the `vocabularies`-folder. 
Upon merge the corresponding documentation and a joined turtle file will be automatically built and published to GitHub pages.

Besides this "in-development" version of the vocabulary, the latest released version and older releases are also available.

Links to specific versions:

- latest released version
  - https://w3id.org/nfdi4cat/voc4cat
- "in-development" version (built from most recent commit to main)
  - `voc4cat` vocabulary documentation https://w3id.org/nfdi4cat/voc4cat/dev
- current and earlier releases identified by release date (the "v" before the data is optional)
  - General scheme `https://w3id.org/nfdi4cat/voc4cat/{release-tag}`<BR>for example https://w3id.org/nfdi4cat/voc4cat/v2023-08-17

We have configured [content negotiation](https://en.wikipedia.org/wiki/Content_negotiation) for these URLs.
So you can get the human readable HTML documentation but also the machine-readable turtle file of the vocabulary from the same URL.
The IRI-design is described in detail in [iri-design.md](https://github.com/nfdi4cat/voc4cat/blob/main/iri-design.md).

To get the turtle file you may use tools like [curl](https://curl.se/) or [httpie](https://httpie.io/docs/cli) that allow to specify the content type.
For example, to download the turtle file of the latest released version:

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
It is placed at the root of the gh-pages branch.

To see how voc4cat rates in the [qSKOS](https://github.com/cmader/qSKOS) quality checks,
you can use this link to the [SKOS testing tool](http://skos-play.sparna.fr/skos-testing-tool/test?url=https://nfdi4cat.github.io/voc4cat/dev/voc4cat.ttl&rules=anr,chr,dcc,dlv,el,hr,husv,ilc,ipl,ml,mri,ncl,oc,oilt,ol,otc,rc,rrc,strc,tchbc,uc,ucil,urc&format=html).

## API access

voc4cat is also available via the [TIB Terminology Service](https://terminology.tib.eu/ts/ontologies/voc4cat).
This service offers API access to voc4cat. Currently a modified version of [OLS](https://terminology.tib.eu/ts/about) is used.
There are plans to host voc4cat and other vocabularies on a [SKOSMOS](https://skosmos.org/) server in the future which will provide more SKOS-specific features than OLS.

## Contributing to vocabularies

To discuss about the **voc4cat**-vocabulary maintained here, create an [issue](https://github.com/nfdi4cat/voc4cat/issues).

To contribute new concepts or collections or change existing ones, you may either submit your contributions as Excel/xlsx-file or (as an expert) as new/changed turtle file.

> Small contributions like adding a single concept are as valuable as bigger ones.
> In fact if you plan a bigger change (50+ concepts), consider splitting up the additions/changes into smaller chunks
> with max. ~20 changes to make the review process not too hard for the reviewers and you as author.

Here are the steps for submitting updates via Excel/xlsx.

- Get the Excel/xlsx-vocabulary file
  - The most recent version of the vocabulary is always available via GitHub-pages https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx
- Make changes to the Excel file. If you want to add something new you need to [request a range of IDs](https://github.com/nfdi4cat/voc4cat/issues/new/choose) for you.
- Create a fork of the voc4cat repository (if you don't yet have one) or pull the latest changes to your fork (via "Sync fork" button in GUI).
- Create a feature branch for your contribution (via GitHub GUI or `git switch -c name-of-branch`)
  - Add the xlsx file to the feature branch into the folder `inbox-excel-vocabs`
  - The name of the file must match the vocabulary that you want to update. So do not change the filename, but keep `voc4cat.xlsx`.
- Create a pull request with the updated Excel-file in this repository.
  - Please describe your changes and the motivation for the changes in the pull request note or link to an issue with this information.
    This will help reviewers to understand the proposed change and decide about it.
- Your pull request will be processed automatically by a CI/CD pipeline that typically finishes in less than a minute.
- Review the artifacts/logs generated by the CI pipeline.
  - The [workflow artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts) will contain an updated xlsx file that is recreated from the updated turtle-file.
- If all is good your contribution will be either
  - directly merged by the maintainers
  - or a discussion will be started about what else is needed
  - or why the proposed change may not fit.
- If you need to fix something, commit further changes to the pull request branch in your clone.
  - If any commits have been made by the CI pipeline, pull the changes to your repo (via "Sync fork" button in GUI) before committing any additional changes.

Finally, when the proposed pull request is accepted, your changes will be integrated in the vocabularies in the folder `vocabularies`.
The vocabularies are stored in split form using one folder per vocabulary.
Each concept, collection and concept scheme is stored in a separate file using the ID-part of the IRI as file name.

See [inbox-excel-vocabs/README.md](https://github.com/nfdi4cat/voc4cat/tree/main/inbox-excel-vocabs/README.md) for a minimal example how to test the submission process.

## How to suggest improvements to the tooling & template?

To discuss about the workflow for maintaining SKOS vocabularies based on this template, create an [voc4cat-template issue](https://github.com/nfdi4cat/voc4cat-template/issues).

To discuss about the tool that converts Excel to SKOS in GitHub-actions of this template, create an [voc4cat-tool issue](https://github.com/nfdi4cat/voc4cat-tool/issues).

## Documentation for voc4cat maintainers

See section for maintainers in the [documentation](https://nfdi4cat.github.io/voc4cat).

## Contributors

For details see the Zenodo record.

**A big thanks to our GitHub contributors:**
<a href="https://github.com/nfdi4cat/voc4cat/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=nfdi4cat/voc4cat" alt="Voc4Cat contributors"/>
</a>

*Figure made with [contrib.rocks](https://contrib.rocks).*

## License

### Vocabularies

All vocabularies in this repository are CC0-1.0 licensed, see [LICENSE](LICENSE) for details.

### Voc4cat template

The template itself is CC0-1.0 licensed, see [LICENSE](https://github.com/nfdi4cat/voc4cat-template/blob/main/LICENSE).
Although there is no obligation, we nevertheless appreciate if our work is acknowledged in any derivative work.

## Acknowledgement

This work was funded by the German Research Foundation (DFG) through the project "[NFDI4Cat](https://nfdi4cat.org) - NFDI for Catalysis-Related Sciences" (DFG project no. [441926934](https://gepris.dfg.de/gepris/projekt/441926934)), within the National Research Data Infrastructure ([NFDI](https://www.nfdi.de)) programme of the Joint Science Conference (GWK).

Special thanks to:

- [TIB - Leibniz Information Centre for Science and Technology](https://www.tib.eu/en/) for providing API access to voc4cat.
- [W3ID Consortium](https://w3id.org) for making its permanent URL service available to the community.

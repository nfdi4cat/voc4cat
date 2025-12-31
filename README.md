[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8313340.svg)](https://doi.org/10.5281/zenodo.8313340)
[![](https://github.com/nfdi4cat/voc4cat/workflows/Publish/badge.svg)](https://github.com/nfdi4cat/voc4cat/actions)
[![](https://github.com/nfdi4cat/voc4cat/workflows/Build/badge.svg)](https://github.com/nfdi4cat/voc4cat/actions)
[<img src="https://www.w3.org/Icons/SW/Buttons/sw-skos-blue-v.svg" height="20" alt="SKOS logo" />](https://www.w3.org/TR/skos-primer/)

# A SKOS vocabulary for the catalysis disciplines

This repository helps to create and maintain your own SKOS-vocabularies on GitHub.
It builds upon [voc4cat-tool](https://github.com/nfdi4cat/voc4cat-tool) and GitHub features like pull requests, gh-actions, gh-pages etc. to reduce the workload for contributors and editors.
The template is maintained as part of the [NFDI4Cat](http://www.nfdi4cat.org) initiative.

The Voc4Cat [vocabulary](https://w3id.org/nfdi4cat/voc4cat/dev) and its [current guidelines](https://nfdi4cat.github.io/voc4cat/docs_usage/guidelines.html) have been created and are maintained as part of the [NFDI4Cat](http://nfdi4cat.org) initiative. The guidelines have also been published at [Zenodo](https://doi.org/10.5281/zenodo.13773255).

Please follow the [Setting up a Vocabulary Project](https://nfdi4cat.github.io/voc4cat-tool/user-guide/project-setup.html) guide in the voc4cat-tool documentation. 
See also [README_TEMPLATE.md](/README_TEMPLATE.md#how-to-start) included in this repositroy for help and guidance on using the template.

## Basic principles

Voc4cat makes contributing easy for everyone with a GitHub account.
The process is essentially *(browse through our [step-by-step guide](https://nfdi4cat.github.io/voc4cat/docs_usage/how-to-contribute.html),
or read the guide in pdf form with screenshots of each step (https://zenodo.org/records/13757351)*:

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

The latest release of voc4cat is available via

* [Skosmos](https://semanticlookup.zbmed.de/skosmos/voc4cat/en/) operated by [ZB MED](https://www.zbmed.de/en/). The Skosmos API is used for the integration of Voc4Cat into the NFDI4Cat data repository **[repo4cat](https://repository.nfdi4cat.org/)**.
* [TIB Terminology Service](https://terminology.tib.eu/ts/ontologies/voc4cat) which is based on a customized OLS version.

Both services offer API access to voc4cat. Skosmos has more SKOS-specific features than OLS and is therefore recommended.

## Contributing to vocabularies

To discuss about the **voc4cat**-vocabulary maintained here, create an [issue](https://github.com/nfdi4cat/voc4cat/issues).

To add new concepts or collections or change existing ones, please follow our [*"How to contribute?"*](https://nfdi4cat.github.io/voc4cat/docs_usage/how-to-contribute.html#) guide.

> Small contributions like adding a single concept are as valuable as bigger ones.
> In fact if you plan a bigger change (50+ concepts), consider splitting up the additions/changes into smaller chunks
> with max. ~20 changes to make the review process not too hard for the reviewers and you as author.

## How to suggest improvements to the tooling & template?

To discuss about the workflow for maintaining SKOS vocabularies based on this template, create an [voc4cat-template issue](https://github.com/nfdi4cat/voc4cat-template/issues).

To discuss about the tool that converts Excel to SKOS in GitHub-actions of this template, create an [voc4cat-tool issue](https://github.com/nfdi4cat/voc4cat-tool/issues).

## Documentation for voc4cat maintainers

See section for maintainers in the [documentation](https://nfdi4cat.github.io/voc4cat).

## Contributors

For details see the [Zenodo record](https://doi.org/10.5281/zenodo.8313340).

**A big thanks to our GitHub contributors:**

<a href="https://github.com/nfdi4cat/voc4cat/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=nfdi4cat/voc4cat" alt="Voc4Cat contributors"/>
</a>

*Figure made with [contrib.rocks](https://contrib.rocks).*

## License

### Vocabularies

All vocabularies in this repository are CC0-1.0 licensed, see [LICENSE](LICENSE) for details.

### Voc4Cat template

The template itself is CC0-1.0 licensed, see [LICENSE](https://github.com/nfdi4cat/voc4cat-template/blob/main/LICENSE). 
Although there is no obligation, we will nevertheless highly appreciate if you acknowledge our work in any derivative work.

## Acknowledgement

This work was funded by the German Research Foundation (DFG) through the project "[NFDI4Cat](https://nfdi4cat.org) - NFDI for Catalysis-Related Sciences" (DFG project no. [441926934](https://gepris.dfg.de/gepris/projekt/441926934)), within the National Research Data Infrastructure ([NFDI](https://www.nfdi.de)) programme of the Joint Science Conference (GWK).

Special thanks to:

- [Roman Baum](https://github.com/rombaum) and his team who helped us to make voc4cat accessible via Skosmos in a [TS4NFDI incubator project](https://terminology.services.base4nfdi.de/incubators), see also [doi:10.5281/zenodo.16736361](https://doi.org/10.5281/zenodo.16736361).
- [ZB MED](https://www.zbmed.de/en/) for operating the Skosmos instance that provides a modern [user interface](https://semanticlookup.zbmed.de/skosmos/voc4cat/en/) for browsing Voc4Cat plus REST API access.
- [TIB - Leibniz Information Centre for Science and Technology](https://www.tib.eu/en/) for providing API access to Voc4Cat.
- [W3ID Consortium](https://w3id.org) for making its permanent URL service available to the community.

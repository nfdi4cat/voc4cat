# Contributing to Voc4Cat

Thank you for your interest in contributing to the Voc4Cat vocabulary! This SKOS vocabulary covers catalysis disciplines and welcomes contributions from the community.

## Quick Start

1. **Download** the current vocabulary Excel file: [voc4cat.xlsx](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx)
2. **Edit** the Excel file to add/modify concepts
3. **Request ID range** (for new concepts): [Create an issue](https://github.com/nfdi4cat/voc4cat/issues/new/choose)
4. **Submit** your Excel file in a pull request:
   - Place file in `inbox-excel-vocabs/` folder
   - Keep the filename as `voc4cat.xlsx`
   - Describe your changes in the PR description

## Important Guidelines

- **Small contributions welcome**: Even single concept additions are valuable
- **Break up large changes**: Split contributions of 50+ concepts into smaller chunks (~20 changes each)
- **Use Excel workflow only**: Never edit Turtle (.ttl) files directly
- **ID ranges required**: Request your ID range before adding new concepts

## Documentation

For detailed guidelines and step-by-step instructions, see:

- **[Current Vocabulary Guidelines](https://nfdi4cat.github.io/voc4cat/docs_usage/guidelines.html)**
- **[Step-by-step Guide (PDF)](https://zenodo.org/records/13757351)** - Visual walkthrough of the process
- **[Vocabulary Guidelines V2.0](https://doi.org/10.5281/zenodo.13773255)** - Academic publication on Zenodo

## What Happens Next?

(next after quick start)

1. CI/CD pipeline automatically processes your Excel file
2. Turtle files are generated and validated
3. Updated Excel file is created from the processed data
4. Reviewers will check your contribution
5. Upon approval, your changes are merged and published

## Questions or Issues?

- **Vocabulary discussions**: [Create an issue](https://github.com/nfdi4cat/voc4cat/issues)
- **Tooling improvements**: [voc4cat-tool issues](https://github.com/nfdi4cat/voc4cat-tool/issues)
- **Template feedback**: [voc4cat-template issues](https://github.com/nfdi4cat/voc4cat-template/issues)

## License

All vocabulary contributions are released under CC0-1.0 license (public domain).

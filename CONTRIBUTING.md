# Contributing to Voc4Cat

Thank you for your interest in contributing to the Voc4Cat vocabulary! This SKOS vocabulary covers catalysis disciplines and welcomes contributions from the community.

## Quick Start

1. **Request a range of IDs** (for new concepts): [Create an issue](https://github.com/nfdi4cat/voc4cat/issues/new/choose)
2. **Download** the current vocabulary Excel file: [voc4cat.xlsx](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx)
3. **Edit** the Excel file to add/modify concepts
4. **Submit** your Excel file in a pull request:
   - Create a new branch for the changes in your fork and switch to it
   - Place file in `inbox-excel-vocabs/` folder
   - Keep the filename as `voc4cat.xlsx`
   - Create a PR and describe your changes in the PR description

For more details, see [How to contribute?](https://nfdi4cat.github.io/voc4cat/docs_usage/how-to-contribute.html)

## Important Guidelines

- **Small contributions welcome**: Even single concept additions are valuable
- **Break up large changes**: Split contributions of 50+ concepts into smaller chunks (~20 changes each)
- **Use Excel workflow only**: Never edit Turtle (.ttl) files directly
- **ID ranges required**: Request your ID range before adding new concepts
- **Use feature branches**: Create a new branch for your changes instead of committing to your fork's main branch
- **Classify concepts properly**: Ensure new concepts are linked to the hierarchy via broader concepts

## Documentation

For detailed guidelines and step-by-step instructions, see:

- **[Current Vocabulary Guidelines](https://nfdi4cat.github.io/voc4cat/docs_usage/guidelines.html)**
- **[Step-by-step Guide (PDF)](https://doi.org/10.5281/zenodo.13757350)** - Visual walkthrough of the process
- **[Vocabulary Guidelines V2.1](https://doi.org/10.5281/zenodo.15006962)** - Publication on Zenodo (as printed)

## What Happens Next?

(next after quick start)

1. CI/CD pipeline automatically processes your Excel file
2. Turtle files are generated and validated
3. Automated checks provide helpful feedback:
   - Detects PRs from main branch (suggests using feature branches)
   - Identifies organization account issues that will block CI
   - GitHub Copilot may provide additional review guidance
4. Updated Excel file is created from the processed data
5. Reviewers will check your contribution
6. Upon approval, your changes are merged and published

**Note**: Automated checks are informational and won't block your PR (except organization accounts due to GitHub limitations).

## Questions or Issues?

- **Vocabulary discussions**: [Create an issue](https://github.com/nfdi4cat/voc4cat/issues)
- **Tooling improvements**: [voc4cat-tool issues](https://github.com/nfdi4cat/voc4cat-tool/issues)
- **Template feedback**: [voc4cat-template issues](https://github.com/nfdi4cat/voc4cat-template/issues)

## License

All vocabulary contributions are released under CC0-1.0 license (public domain).

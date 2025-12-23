# Voc4Cat Template Help

> The presence of this file indicates that this vocabulary is based on [voc4cat-template](https://github.com/nfdi4cat/voc4cat-template).<BR>
> To **avoid merge conflicts on updates**, this file should mainly change via merging an updated version from the template repository. Therefore, please consider submitting your requests for changes/improvements as [issue in the voc4cat-template](https://github.com/nfdi4cat/voc4cat-template/issues/new?template=Blank+issue) repository.

## How to start?

### Trying out the workflow

To test the workflow, you may try contributing to [voc4cat](https://github.com/nfdi4cat/voc4cat) or explore past PRs in that repository. Voc4Cat is a "deployment" of this repository.
If you are interested in understanding the technical details or in developing your own vocabulary,
follow the instructions [below](#how-to-use-this-template-for-your-own-vocabularies).

All vocabularies based on this template have the same standard contribution process of

- get and update the vocabulary file (xlsx),
- submit a pull request with the updated xlsx file,
- collaborate on the pull request with editors or other github users,

After approval, your pull request is ready to be merged by the editors.
The merge will include your contribution into the SKOS-vocabulary file in the `vocabularies`-folder, rebuild the vocabulary documentation and create a joined turtle file that will be published to gh-pages alongside an updated xlsx file.

Excel/xlsx files submitted in pull requests are automatically checked and (if all is good) converted to turtle.
A vocabulary-specific configuration enables extended validation,
e.g. if terms get removed in a PR or if correct IRIs are used.
To validate IRIs the configuration supports ID-ranges (similar to [OBO idrange](https://oboacademy.github.io/obook/howto/idrange/) but in [toml](https://toml.io/)-format).
The idea is that every author gets their own range of IDs to consume.
This allows independent work and avoids using the same ID repeatedly.

The voc4cat-template implements automatic storage of different versions of the vocabularies in gh-pages:

- `dev` - Directory with artifacts built from the most recent commit to the main branch.
- `latest` - Directory with all files built for the latest release.
- `vYYYY-MM-DD` (for example `v2023-08-16`) - Directory with all files built for the release with this tag.

For all versions, multiple files are stored (see https://github.com/nfdi4cat/voc4cat-template/issues/11#issuecomment-1680592185 for details). The correct version string is automatically inserted to all build artifacts. For `dev`, the first eight characters of the commit hash are used as version (for example `v_fadfa5f9`).

- Taking into account the above scheme, the url for the artifacts for the `dev` version in gh-pages is `https://{gh-org-name}.github.io/{repository-name}/dev/{vocabulary-name}/`
- For example, in repository `nfdi4cat/voc4cat-template` the vocabulary `vocab_example` is documented at [https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example/](https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example/)

In addition to the specific versions, an index page is generated that links to all vocabularies and the tagged releases.
It is placed at the root of gh-pages (`https://{gh-org-name}.github.io/{repository-name}/`).

### Creating vocabularies for catalysis, materials science or reaction engineering

Please strongly consider contributing to the [voc4cat](https://github.com/nfdi4cat/voc4cat) vocabulary instead of creating another one.

## Contributing to vocabularies

To discuss about the SKOS vocabularies maintained with this template, create an issue in the vocabulary repository itself (but not in this template-repository).

To contribute new concepts or collections or change existing ones, you may either submit your contributions as Excel/xlsx-file or (as an expert) as new/changed turtle file.

Here are the steps for submitting updates in Excel.

- Get the Excel/xlsx-vocabulary file
  - The most recent version of the vocabulary is always available via github-pages.
    - The general url is `https://{gh-org-name}.github.io/{repository-name}/dev/{vocabulary-name}.xlsx`
    - For example in nfdi4cat/voc4cat-template the most recent vocabulary `vocab_example` can be downloaded from [https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example.xlsx](https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example.xlsx)
- Before you can add something new you need to [request a range of IDs](https://github.com/{gh-org-name}/{repository-name}/issues/new/choose) to assign new IRIs to your additions.
- Create a fork of the vocabulary repository (if you don't yet have one) or pull the latest changes to your fork (via "Sync fork" button in GUI).
- Create a feature branch for your contribution (via GitHub GUI or `git switch -c name-of-branch`)
- Add the xlsx file to your clone of the repository into the folder `inbox-excel-vocabs`
  - The name of the file must match the vocabulary that you want to update (e.g. myvoc.xlsx to update a vocabulary named "myvoc").
- Create a pull request with the updated Excel-file on GitHub.
  - Describe your changes and the motivation for the changes in the pull request note or link to an issue with this information.
    This will help reviewers to understand the proposed change better.
- Your pull request will be processed automatically by a CI/CD pipeline that typically runs less than a minute.
- Review the artifacts/logs generated by the CI pipeline.
  - The [workflow artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts) will contain an updated xlsx file.
- If all is good your contribution will be either
  - directly merged by the maintainers
  - or a discussion will be started about what else is needed
  - or why the proposed change may not fit.
- If you need to fix something, first pull the changes made by the action with `git pull` (or "sync" in GUI).
  Next, commit further changes to the pull request branch in your clone. This will trigger the pipeline to run again.
  - If any commits have been made by the CI pipeline, pull the changes to your repo (via "Sync fork" button in GUI) before committing any additional changes.

Finally, when the proposed pull request is accepted, your changes will be integrated in the vocabularies in the folder `vocabularies`.
The vocabularies are stored in split form using one folder per vocabulary.
Each concept, collection and concept scheme is stored in a separate file using the ID-part of the IRI as file name.

See [inbox-excel-vocabs/README.md](inbox-excel-vocabs/README.md) for a minimal example how to test the submission process.

## How to suggest improvements to the tooling & template?

To discuss about the workflow for maintaining SKOS vocabularies based on this template, create an [voc4cat-template issue](https://github.com/nfdi4cat/voc4cat-template/issues).

To discuss about the tool that converts Excel to SKOS in gh-actions of this template, create an [voc4cat-tool issue](https://github.com/nfdi4cat/voc4cat-tool/issues).

## How to use this template for your own vocabularies?

The template can be used to create your own independent repository for SKOS vocabularies maintenance.

### Setting up your own github repository

First create a new repository on github without any contents, named e.g. "my-new-vocabulary". Then set up your own independent vocabulary repository on the command line:

```gitattributes
git init my-new-vocabulary
cd my-new-vocabulary
git pull https://github.com/nfdi4cat/voc4cat-template
git remote add origin https://github.com/my-gh-name/my-new-vocabulary.git
git push -u origin main
```

This adds all commits made in the template´s main branch to your new repository. In addition to this basic setup you may want to

- Adjust the README.md file for your vocabulary.
- Adjust the configuration of your vocabularies in `idranges.toml`
- Adjust settings of your new GitHub repository. Typically you will want to
  - Forbid pushing to main via [branch protection rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule) (Settings > Branches, edit rules for "main")
  - Set up rules for required approvals (Settings > Branches, edit rules for "main")
  - Configure GitHub pages to use as source "deploy from a branch" and select the branch `gh-pages` (Settings > Pages > Build and deployment)
- Optionally
  - Add a different license for your vocabulary.
- Optionally provide a custom Excel template with extra sheets, see [documentation](https://nfdi4cat.github.io/voc4cat-tool/migration-to-v1.0.html#step-3-generate-v1-0-excel-template).

After these steps your repository should work just like [voc4cat](https://github.com/nfdi4cat/voc4cat).

### Keeping your vocabulary repository in sync with voc4cat-template

To review the changes made in the template after you last pulled it use:

```gitattributes
git fetch https://github.com/nfdi4cat/voc4cat-template
git diff ...FETCH_HEAD
```

If you want to take over the changes, pull them into your repository

```gitattributes
git pull https://github.com/nfdi4cat/voc4cat-template
```

and push the change to the remote repository.

```gitattributes
git push
```

It is suggested to merge the changes from the template repository before every new release of your vocabulary. This ensures that the centrally maintained features and best practices trickle into your project.

## Working with voc4cat-tools on your own computer

This repository template contains a `justfile` which pre-defines series of commands as tasks. Theses tasks are run with the [just command runner](https://github.com/casey/just).

In the justfile, [uv](https://docs.astral.sh/[uv](https://docs.astral.sh/uv/)/) is used to install and update the Python package [voc4cat](https://pypi.org/project/voc4cat/).

The justfile helps to tun (almost) the same commands as are used in the GitHub workflows locally on your computer.
This makes local testing of a modified vocabulary xlsx-file easier.
Read the header of the justfile for more info on setting up your environment.

Once you have `just` installed type the command `just` at the root of the git-project to list the available commands. For version 0.10.0 of the template, it gives:

```bash
$ just
Available recipes:
    all     # Run all steps as in gh-actions: check xlsx, convert to SKOS, build docs, re-build xlsx

    [environment]
    clean   # Remove all generated files/directories
    setup   # Run initial setup (run this first)
    upgrade # Upgrades voc4cat-tool installation

    [individual steps]
    check   # Check the voc4cat.xlsx file in inbox/ for errors
    convert # Convert the voc4cat.xlsx file in inbox/ to turtle
    docs    # Run voc4cat (build HTML documentation from ttl files)
    join    # Join individual ttl files in vocabularies/ to one turtle file in outbox/
    xlsx    # Rebuild the xlsx file from the joined ttl file.
```

If you have some Python knowledge, you can of course also install and use the [voc4cat](https://pypi.org/project/voc4cat/) Python package just like any other Python package, starting with `pip install voc4cat` and continuing from there.

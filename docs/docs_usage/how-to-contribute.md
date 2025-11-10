# How to contribute to Voc4Cat?

## Step-by-step contribution guide

The main steps that a community member needs to follow to contribute to
Voc4Cat are illustrated in the diagrams below.

Steps 1-4 are performed only once and are intended to set up the GitHub environment for the contributor.

```{mermaid}
flowchart LR
  A1[Step 1<br>Create GitHub<br>account] --> A2[Step 2<br>Access<br>repository] --> A3[Step 3<br>Request<br>ID range] --> A4[Step 4<br>Fork repository<br>set up remotes]
```

The actual vocabulary contribution process involves steps 5-7 which are repeated
with each new submission.

```{mermaid}
flowchart LR
  B5[Step 5<br>Get latest Excel template] --> B6[Step 6<br>Edit concepts in Excel] --> B7[Step 7<br>Open PR and iterate]
```

```{admonition} Contribution overview
:class: tip

Below is a compact overview of the contribution flow. Select the tabs that match your preferred way of working, either Git commands or GitHub Web UI.
```

### Initial steps (one-time)

#### Step 1 – Create a GitHub account

This step happens in the browser only. No commands. Visit [github.com](https://github.com/) and create a personal account.

```{caution}
It is essential to use a *personal GitHub account*. Contributing from organization accounts does not work due to GitHub limitations (status Nov-2025, see [discussion](https://github.com/orgs/community/discussions/5634)).
```

#### Step 2 – Access the Voc4Cat repository

While signed in, open the repository of Voc4Cat <https://github.com/nfdi4cat/voc4cat>. Familiarize yourself with the README and existing issues.

Contributing or participating in discussions requires you to be signed in with your personal GitHub account.

#### Step 3 – Request an ID range

You will need unique IDs for each new concept that you want to add to Voc4Cat.

Voc4cat gives each user their personal ID range(s) to pick IDs from.
This way contributions can happen asynchronously without needing additional coordination between users.

While on the Voc4Cat repository page <https://github.com/nfdi4cat/voc4cat>,

- click on *Issues* (top left corner), then
- click on *New issue* (green button on the top right corner)
- finally click on the “*Request a range of IDs*” option.

This opens a dialog window:

- Enter the number of IDs that you need for new concepts. 
  The number does not have to be exact.
  Request enough if you plan several contributions in the future (typical numbers are 10...100).
- Add your *Open Researcher and Contributor ID* ([ORCID identifier](https://orcid.org/)).
  This is optional but recommended.
- Add the *Research Organization Registry* ([ROR](https://www.ror.org)) identifier of the organization you work for.
- Add any additional information that you deem necessary such as what you plan to work on.

#### Step 4 – Fork the repository

Copying ("*forking*") Voc4Cat’s repository to your workspace allows modifications independent of the original repository.
Forking is an essential step in GitHub´s collaborative development model.

To fork Voc4Cat, while being logged in,

- Navigate to the [nfdi4cat/voc4cat](https://github.com/nfdi4cat/voc4cat) repository.
- Click on the *Fork* button (top right corner).

After creation, your fork will be available as new repository in your workspace at `https://github.com/<your_username>/voc4cat`.

::::{tab-set}
:::{tab-item} Git commands
:sync: Git commands
To prepare for contributing from your local computer

1. Clone your fork:

  ```bash
  git clone https://github.com/<your_username>/voc4cat.git
  ```

2. Add "upstream" remote:

  ```bash
  cd voc4cat
  git remote add upstream https://github.com/nfdi4cat/voc4cat.git
  ```

:::

:::{tab-item} GitHub Web UI
:sync: GitHub Web UI
*No action required.*
:::
::::

### Steps for every contribution

#### Step 5 – Get the latest versions

First, **download the current version of Voc4Cat as xlsx (Excel) file**.
Go to the [voc4cat-homepage](https://nfdi4cat.github.io/voc4cat/), and download the file by clicking on the middle *Vocabulary card*
(or use this direct [download link](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx)).

Second you have to **update your voc4cat-fork**.
While not essential it is strongly recommended that the vocabulary stored in the repository as RDF/turtle files matches the concepts stored in the downloaded xlsx file.

::::{tab-set}
:::{tab-item} Git commands
:sync: Git commands
From the root directory of your cloned repo:

1. Update local main:
  ```bash
  git fetch upstream --tags
  git switch main
  git pull upstream main`
  ```

2. Create a feature branch for the contribution (reference the issue solved by the PR):
```bash
  git switch -c issue###_<short_topic>`
```

3. Place the freshly download voc4cat xlsx-file in `inbox-excel-vocabs/voc4cat.xlsx`. Do not change the filename.
:::

:::{tab-item} GitHub Web UI
:sync: GitHub Web UI
Open your fork of voc4cat <https://github.com/your_username/voc4cat> in the browser.

Press the green "Sync fork" button. If this fails, see [](#troubleshooting).
:::
::::

#### Step 6 – Add / edit concepts in Excel

Follow classification & Excel rules above. Ensure each new concept has a broader chain to a top concept.

::::{tab-set}
:::{tab-item} Git commands
:sync: Git commands
Edit the Excel file locally in your spreadsheet program. (Optional future tooling: local validator.) After edits:

1. Stage file:
   - `git add inbox-excel-vocabs/voc4cat.xlsx`
2. Commit with informative message (include ID span):
   - `git commit -m "voc4cat: add <topic> (IDs ####–####)"`
:::
:::{tab-item} GitHub Web UI
:sync: GitHub Web UI
Download the template from your branch, edit locally, then drag & drop updated
`voc4cat.xlsx` into `inbox-excel-vocabs/` on your feature branch page. Add
commit message: `voc4cat: add <topic> (IDs ####–####)`.
For subsequent revisions repeat download → edit → upload.
:::
::::

**Excel file rules**

- Location: `inbox-excel-vocabs/voc4cat.xlsx` (or additional files if split; keep naming consistent).
- Do not rename arbitrarily.
- One conceptual change set per PR (keep focused).
- Provide clear definition text (concise, domain-relevant).
- Download the current Excel template: https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx
- Do not change the Excel template structure (sheet names, header row, column order).

```{seealso}
For deeper methodological guidance see the published guidelines section on
contribution steps.
```

#### Step 7 – Open & iterate on the Pull Request

```{warning}
Do not create PRs from your fork's main branch. Always work on a feature branch (created in Step 5).
```

```{tip}
Before starting work, sync your fork/clone with upstream `main` to avoid conflicts.
```

::::{tab-set}
:::{tab-item} Git commands
:sync: Git commands
Push branch (first time):

- `git push -u origin feat/<short-topic>`

Open PR in browser (compare: your branch; base: nfdi4cat/voc4cat `main`). Use
template & checklist.
For updates: edit Excel, commit, push again:

- `git add inbox-excel-vocabs/voc4cat.xlsx`
- `git commit -m "update: refine definitions (IDs ####–####)"`
- `git push`
:::
:::{tab-item} GitHub Web UI
:sync: GitHub Web UI
Click “Compare & pull request” after pushing branch or use “New pull request”.
Fill description: summary, ID range, confirmation of broader chains, no TTL
edits. Mark checklist. Use Draft PR for early feedback. To update: re-upload
improved Excel to same path; commit automatically appears in PR.
After approval a maintainer merges; CI generates TTL & HTML preview.
:::
::::

**PR checklist**

- [ ] File is `inbox-excel-vocabs/voc4cat.xlsx` (name and path unchanged)
- [ ] IDs are within my allocated range
- [ ] Each concept has prefLabel, definition, and a broader chain to a top concept
- [ ] Contribution is focused/small enough for review (split if needed)
- [ ] No `.ttl` files edited
- [ ] PR title and description summarize the motivation and scope

```{tip}
Open your PR as "Draft" if you want early feedback. Mention any specific questions. Curators are informed automatically about every new PR.
```

The xlsx file is ephemeral and never stored in the repository. It is generated from the RDF/turtle files.

**Review priorities**

1. Classification completeness
2. ID correctness
3. Scope / definition clarity
4. Optional enhancements (examples, altLabels)

#### After merge

CI builds and publishes updated development version. Verify your concepts
using:

- HTML preview: https://nfdi4cat.github.io/voc4cat/dev/voc4cat/index.html
- Download new Excel if planning further contributions.

```{tip}
Open follow-up issue for any post-merge adjustments; do not edit generated Turtle directly.
```

## Contributing to the homepage

We use [Sphinx](https://www.sphinx-doc.org/) as documentation builder with the [furo](https://github.com/pradyunsg/furo) theme
and [MySt](https://mystmd.org/) to support extended markdown.

To get an overview about the styling features supported visit the [furo theme documentation](https://pradyunsg.me/furo/kitchen-sink/)
or the [MyST authoring documentation](https://mystmd.org/guide/typography).

To help you checking your changes before making a pull request, we provide instructions how to [build the documentation locally](../docs_maintenance/creating-docs-locally.md).

## Troubleshooting

- Step 5: failing sync.

## Qquestions or issues?

- Vocabulary discussions: <https://github.com/nfdi4cat/voc4cat/issues>
- Tooling improvements (voc4cat-tool): <https://github.com/nfdi4cat/voc4cat-tool/issues>
- Template feedback (voc4cat-template): <https://github.com/nfdi4cat/voc4cat-template/issues>

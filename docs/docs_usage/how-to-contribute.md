# How to contribute to Voc4Cat?

The contribution process is almost the same as in source code repositories.
Below we describe the steps in detail so that beginners without git or GitHub experience can follow. 
The essentials of the contribution process are:

1. **Request a range of IDs** (for new concepts): [Create an issue](https://github.com/nfdi4cat/voc4cat/issues/new/choose)
2. **Download** the current vocabulary Excel file: [voc4cat.xlsx](https://nfdi4cat.github.io/voc4cat/dev/voc4cat.xlsx)
3. **Edit** the Excel file to add/modify concepts
4. **Submit** your Excel file in a pull request placing your changed `voc4cat.xlsx` in the `inbox-excel-vocabs/` folder (keep the filename)

```{figure} media/workflow.png
:alt: GitHub contribution workflow and continuous integration pipeline

**Vocabulary contribution workflow & Continuous Integration (CI) Pipeline.**
```

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

What happens during the contribution steps is visualized in the next figure.

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

:::::{tab-set}
::::{tab-item} Git commands
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
::::

::::{tab-item} GitHub Web UI
:sync: GitHub Web UI
1. Open your fork of voc4cat <https://github.com/your_username/voc4cat> in the browser.

2. Sync your fork with upstream nfdi4cat/voc4cat. Press the green "Sync fork" button which makes your fork/clone an exact copy of upstream `main` again (nfdi4cat/voc4cat). If this fails, see [](#troubleshooting).

:::{dropdown} Be careful when you "*Sync fork*" in GitHub UI.
:icon: copilot-warning
**It should look like this screenshot.** Your main branch should only be behind the forked repository (not ahead of it).

![](media/fork_behind_forked_repo.png)

**If your main-branch is ahead of main in the forked repo, do not press "*Sync fork*"** but go to [](#troubleshooting).

![](media/fork_ahead_forked_repo_conflict_case.png)
:::

::::
:::::

#### Step 6 – Add / edit concepts in Excel

:::{dropdown} Introduction to the xlsx vocabulary file (click to unfold).

The downloaded Excel file consists of seven sheets:

1.  **Introduction**: General information regarding Voc4Cat.

2.  **Help**: A guide on how to properly fill the necessary information
    in Voc4Cat Excel sheets.

3.  **Concept Scheme**: Collects the top-level information about the
    vocabulary.

4.  **Concepts**: A concept according to SKOS is a unit of thought,
    idea, meaning, or category of an object or event which underlines a
    knowledge organization system. This sheet collects concept
    descriptions, (optionally) their translations to other languages,
    simple broader / narrower relations between the concepts and
    provenance information. This is the sheet where most edits are made.

5.  **Additional Concept Features**: This sheet allows to add more
    relations between concepts. These extra relations are adapted from
    the SKOS specification, and they include:

    1.  *Related Matches*: Mapping with this cell asserts a related or
        associated relationship to the concepts listed. It is important
        to note that this relation is not transitive (if concept A has a
        close match with concept B, and concept B has a close match with
        concept C, it doesn't necessarily follow that concept A has a
        close match with concept C).

    2.  *Close Matches*: Mapping with this cell means the concepts are
        sufficiently similar that they can be used interchangeably.
        Close matches are also not transitive.

    3.  *Exact Matches*: This is a subset of a close match. Concepts are
        to be added if they are similar enough to be used
        interchangeably but have an even higher degree of closeness that
        includes transitivity, e.g., if concept A is an exact match for
        concept B, and B is an exact match for C, then A is also an
        exact match for C.

    4.  *Broader Matches*: Broader match allows the user to assert that
        a concept is broader in meaning to another concept. This is the
        inverse of a narrower relation.

    5.  *Narrower Matches*: Narrower match allows the user to assert
        that a concept is narrower in meaning to another concept. This
        is the inverse of a broader relation.

6.  **Collections**: Collections are an easy way to group together
    concepts for various purposes. If collection rows are added to the
    sheet, all cells must be filled out.

    1.  *Preferred Label*: A simple one-line title for the *Collection*.

    2.  *Definition*: The defining description of this *Collection* that
        may be longer and include line-breaks.

    3.  *Member IRIs*: A comma-separated list of the *Concept IRIs* of
        all *Concepts* belonging to this collection.

    4.  *Provenance*: A note on the source of this *Collection*.

7.  **Prefix Sheet**: This sheet is for defining a mapping between short
    prefixes and namespaces which are the basis for using “compact URI”
    also called “CURIE”. For Voc4Cat we have registered “voc4cat” as
    prefix in the Bio Registry (bioregistry.io) and the compact URI form
    would be “voc4cat:xxxxxxx” (e.g., *voc4cat:0007001* for the concept
    “heterogeneous catalysis” with a full URI:
    *https://w3id.org/nfdi4cat/voc4cat_0007001*). For more on compact
    URIs, see
    [<u>https://www.w3.org/TR/2010/NOTE-curie-20101216/</u>](https://www.w3.org/TR/2010/NOTE-curie-20101216/).

The *Concepts* sheet is where most contributions by users will be made.
Detailed descriptions on how to properly fill these columns can be found
in the [guidelines](guidelines.md). There are nine columns used in the “*Concepts*” sheet:

1. **Concept IRI**: Must be a valid URI. This is based on the
    Vocabulary URI (Uniform Resource Identifier) and for new
    contributions must align with the requested ID range.

2. **Preferred Label**: A simple one-line label for the concept.

3. **Pref. Label Language Code**: Two or three letter language code
    according to ISO 639-2 or 639-3 for the *Preferred Label*. If no
    language code is given, “en” is assumed as default (for English).

4. **Definition**: The defining description of the *Concept*.

5. **Def. Label Language Code**: Two or three letter language code
    according to ISO 639-2 or 639-3 for the *Definition*. If no language
    code is given, “en” is assumed as default (for English).
    Translations of a concept into different languages use the same IRI
    but they occupy different rows in the template. As an example, as
    shown in the following table for the “heterogenous catalysis” two
    translations of the concept name and the definition are available
    (in English -*en*- and in German -*de*-) but they both use the same
    concept URI (voc4cat:0007001).

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 18%" />
<col style="width: 12%" />
<col style="width: 33%" />
<col style="width: 13%" />
</colgroup>
<tbody>
<tr>
<td style="text-align: center;"><strong>Concept Compact
IRI</strong></td>
<td style="text-align: center;"><strong>Preferred Label</strong></td>
<td style="text-align: center;"><strong>Pref. Label Language
Code</strong></td>
<td style="text-align: center;"><strong>Definition</strong></td>
<td style="text-align: center;"><strong>Def. Language Code</strong></td>
</tr>
<tr>
<td style="text-align: center;">voc4cat:0007001</td>
<td style="text-align: center;">heterogeneous catalysis</td>
<td style="text-align: center;">en</td>
<td style="text-align: left;">A process during which a chemical reaction
is accelerated by the presence of a catalyst in a different phase than
the reactant. The reaction generally proceeds at the interface.</td>
<td style="text-align: center;">en</td>
</tr>
<tr>
<td style="text-align: center;">voc4cat:0007001</td>
<td style="text-align: center;">heterogene Katalyse</td>
<td style="text-align: center;">de</td>
<td style="text-align: left;">Ein Prozess, bei dem eine chemische
Reaktion durch das Vorhandensein eines Katalysators in einer anderen
Phase als der Reaktant beschleunigt wird. Die Reaktion findet im
Allgemeinen an der Grenzfläche statt.</td>
<td style="text-align: center;">de</td>
</tr>
</tbody>
</table>

6. **Alternate Labels**: Any other names (labels) for this *Concept*.
    Separated by commas. If the user wants to use a comma as part of the
    Alternate label, escape it with “\\ like in: “one\\two”.

7. **Parent IRIs**: A list of IRIs of parents of this *Concept*,
    separated by commas. This creates a hierarchical relationship
    between the terms. In SKOS terminology, the *Concept* is narrower
    than its *Concept-Parent* and in turn the *Concept-Parent* is broader
    than the *Concept*. Note, broader/narrower are not transitive.

8. **Provenance**: A note on the source of this concept. This should be
    an identifier for the person and a provenance note. As an
    identifier, an ORCID ID (with or without the *https://orcid.org/*
    part) or a GitHub name should be used. Multiple entries must be
    separated by comma.

9. **Source Vocab URI**: If this *Concept* is imported from another
    vocabulary, this should be the URI of the concept in the other
    vocabulary. Before including content from other sources, make sure
    that such re-use is permitted by their license.
:::

Edit the xlsx vocabulary file locally in your spreadsheet program of choice.
Follow the [Guidelines](guidelines.md) page.
These guidelines for suggesting, adding, and editing content to Voc4Cat guarantee consistency and coherence in the selection and structuring of concepts.

**Vocabulary xlsx file rules**

- Provide clear definition text (concise, domain-relevant).
- Keep changes focussed. Solve one issue or add/edit a set of strongly related concepts.
- Not more than 20 new concepts per PR. This keeps the review process manageable for you and the curators. Less is better!
- Do not change the Excel template structure (sheet names, header rows, column order).

#### Step 7 – Create & iterate on the Pull Request

After you finished the additions and edits in the Voc4Cat xlsx file,
the update file can be submitted. This happens in a “*Pull request*”.

Make sure that you are in your fork .

::::{tab-set}
:::{tab-item} Git commands
:sync: Git commands
Add and commit the xlsx file to your local feature branch.
If you changed other files as part of your contribution, `git add` them as well (before commit).

```bash
git add inbox-excel-vocabs/voc4cat.xlsx
git commit -m "A meaningful commit message"
```

Push the branch to GitHub (first time):

```bash
git push -set-upstream origin <your-feature-branch-name>
```

and for later updates:

```bash
git push
```

:::

:::{tab-item} GitHub Web UI
:sync: GitHub Web UI

- Open the GitHub page of your fork `https://github.com/<your_username>/voc4cat` and - if you already created a branch for your contribution - switch to the branch.
- Open the “inbox-excel-vocabs” folder
- Click click on the "*Add file*" then "*Upload files*" to open a file submission page.
- Upload the voc4cat.xlsx file (the file name must be exactly this).
- Commit the uploaded file making sure that you **commit to your feature-branch** (not `main`). 
  If you have to create a new branch, you may change the default name to a more reasonable name describing your contribution in the form `issue###_<short_title>`. 

:::
::::

**Create the pull request**

The easiest way is go to the original [nfdi4cat/voc4cat](https://github.com/nfdi4cat/voc4cat) repository.
A notification will show up (1st screenshot).
After clicking on "Compare & pull request" you will be asked about the source and target of your PR.
Verify that the defaults are correct (2nd screenshot).
If the selection box on the left does not show the upstream voc4cat repository, click on the "compare across forks" link to switch the view.

```{figure} media/create-pr-msg.png
:alt: Screenshot of GitHub UI suggesting to create a PR from your fork

Vocabulary contribution workflow & Continuous Integration (CI) Pipeline
```

```{figure} media/selecting-source-and-target-branch-for-pr.png
:alt: Screenshot of GitHub UI with the correct selection of source and target branch for your PR

Check that the source is your feature branch and the target is `nfdi4cat/voc4cat`
```

Here are some points to check before you finally submit the PR:

- PR title and description summarize motivation and scope.
- Vocabulary file is `inbox-excel-vocabs/voc4cat.xlsx` (name and path unchanged).
- IDs of added concepts are within my allocated range.
- Each concept has prefLabel, definition, and a broader chain to a top concept.
- Contribution is focused/small enough for review (split if needed).
- No `.ttl` files edited.

```{tip}
Open your PR as "Draft" if you want early feedback. Mention any specific questions. Curators are informed automatically about every new PR, also drafts.
```

**What happens next?**

When the PR is submitted, an automated Continuous Integration (CI) pipeline is triggered.
The pipeline first checks the submitted Excel file for various errors.

If errors are detected, github reports the failed job with a red cross, see example

![GitHub Screenshot of action failure](media/PR-action-failure.png)

To find out more about the reasons for the failure, click on the red cross ❌.
This brings you to a page with a run log that typically gives enough information to understand the reason for the failure.
In addition to the run log, we also create a so called job artifact which can be accessed by going to the job "*Summary*" from the run log page.
The artifact is a zip-file with several files that help to diagnose the source of the failure. It contains:

- log-file of the run
- xlsx vocabulary file enriched with error information in the failing row (for some errors).
- HTML vocabulary documentation (useful to check the broader/narrower hierarchy)

If the run succeeded you see a similar job message but with a green checkmark:
![GitHub Screenshot of action success](media/succesful-job-with-ttl-commit.png)

The second line with the GitHub icon is a commit created by the pipeline in which

- the xlsx vocabulary file gets removed and 
- the RDF/turtle (ttl-files) with the SKOS representation are added.

If you work on a local checkout on you computer, you need to pull this commit made on GitHub to your local clone with `git pull`.

**Later updates on your PR**

For updates: Switch to the previously created feature branch, fix the xlsx file (or other files) Excel, commit and push it again.

#### After merge

CI builds and publishes the updated development version.

- Go to the [homepage](https://nfdi4cat.github.io/voc4cat/) which is now updated with your contribution.
- Download new Excel if planning further contributions.

Note that this development version is not published to Skosmos at ZB Med or the TIB Technology service. Only releases are published to these services.

## Contributing to the homepage

We use [Sphinx](https://www.sphinx-doc.org/) as documentation builder with the [furo](https://github.com/pradyunsg/furo) theme
and [MySt](https://mystmd.org/) to support extended markdown.

To get an overview about the styling features supported visit the [furo theme documentation](https://pradyunsg.me/furo/kitchen-sink/)
or the [MyST authoring documentation](https://mystmd.org/guide/typography).

To help you checking your changes before making a pull request, we provide instructions how to [build the documentation locally](../docs_maintenance/creating-docs-locally.md).

## Troubleshooting

- **Fork out-of-sync** If you ever committed to the main branch in your repository directly, your history is no longer the same as in the upstream voc4cat.
  This is a problem because it creates a merge conflict. 
  The fix is to reset your main match the upstream one exctly.
  You can do this via the following git command:

  ```bash
  git fetch upstream
  git reset --hard upstream/main
  git push --force
  ```

## Questions or issues?

- Vocabulary discussions: <https://github.com/nfdi4cat/voc4cat/issues>
- Tooling improvements (voc4cat-tool): <https://github.com/nfdi4cat/voc4cat-tool/issues>
- Template feedback (voc4cat-template): <https://github.com/nfdi4cat/voc4cat-template/issues>

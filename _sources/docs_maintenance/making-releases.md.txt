# Making Releases

```{note} This guide is only relevant for maintainers with commit rights.
```

## Overview

Releases in the voc4cat repository publish versioned snapshots of the vocabulary and documentation to permanent URLs following the pattern `https://w3id.org/nfdi4cat/voc4cat/vYYYY-MM-DD`.
The release process is automated via GitHub Actions, triggered by pushing a tag with the version pattern.

The voc4cat version tags reflect the date when a release is created.
Tags must follow the pattern `vYYYY-MM-DD`:

- `v2025-05-22` ✓ Correct
- `2025-05-22` ✗ Wrong (missing 'v' prefix)
- `v20250522` ✗ Wrong (missing hyphens)

## Prerequisites

Before creating a release, ensure:

1. All vocabulary changes have been merged to the `main` branch
2. The development version (`/dev/`) has been rebuilt and is accessible at <https://w3id.org/nfdi4cat/voc4cat/dev>
3. You have tested the development documentation to verify correctness
4. You have commit/push rights to the repository

## Release Process

### Step 1: Create Feature Branch

Navigate to your local clone of the voc4cat repository. Make sure you are on the main branch and have the latest changes:

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat
λ git switch main
λ git pull
```

Create a feature branch for the release preparation:

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git switch -c release-prep-vYYYY-MM-DD
Switched to a new branch 'release-prep-vYYYY-MM-DD'
```

### Step 2: Update Contributor Information (if needed)

If there are new contributors since the last release, update the `.zenodo.json` file to include them. This ensures proper attribution when the release is archived on Zenodo.

1. Check for new contributors by reviewing recent commit history and pull requests
2. For each new contributor, add an entry to the `creators` array in `.zenodo.json`:
   ```json
   {
     "name": "LastName, FirstName",
     "orcid": "0000-0000-0000-0000",
     "affiliation": "Institution Name"
   }
   ```
3. Ensure contributors are listed in the order they should appear on Zenodo
4. Use the affiliation format as shown on the contributor's ORCID profile or their institution's ROR records

### Step 3: Update Release Information in Documentation

Update the following files in the `docs/` folder:

1. The announcement banner (in `docs/conf.py`):
   ```python
   "announcement": 'New: <strong> Release YYYY-MM-DD </strong> includes ...',
   ```

2. The latest release reference (in `docs/index.md`):
   ```markdown
   +++
   <small>Latest release **vYYYY-MM-DD**</small>
   ```

3. Add the new release to the "All releases" section (in `docs/index.md`):
   ```markdown
   - **vYYYY-MM-DD**: [Documentation (HTML)](https://w3id.org/nfdi4cat/voc4cat/vYYYY-MM-DD), permanent url `https://w3id.org/nfdi4cat/voc4cat/vYYYY-MM-DD`
   ```

### Step 4: Create and Merge Pull Request

Commit and push your documentation changes:

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(release-prep-vYYYY-MM-DD)
λ git add docs/index.md docs/conf.py .zenodo.json

C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(release-prep-vYYYY-MM-DD)
λ git commit -m "Prepare documentation for vYYYY-MM-DD release"

C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(release-prep-vYYYY-MM-DD)
λ git push --set-upstream origin release-prep-vYYYY-MM-DD
```

Create a pull request on GitHub and get the PR reviewed and approved by another maintainer.

Then merge it to `main`. After merging, delete the feature branch on GitHub.

### Step 5: Pull Updated Main Branch

Switch back to main and pull the merged changes:

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(release-prep-vYYYY-MM-DD)
λ git switch main
Switched to branch 'main'

C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git pull
```

Clean up the local feature branch:

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git branch -d release-prep-vYYYY-MM-DD
```

### Step 6: Create and Push Release Tag

Create an annotated tag following the pattern `vYYYY-MM-DD` (e.g., `v2025-05-22`):

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git tag -a v2025-05-22 -m "Release v2025-05-22"
```

Push the tag to GitHub:

```bat
C:\Users\dlinke\MyProg_local\gh-nfdi4cat\voc4cat(main -> origin)
λ git push --tags
Enumerating objects: 1, done.
Counting objects: 100% (1/1), done.
Writing objects: 100% (1/1), 170 bytes | 164.00 KiB/s, done.
Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/nfdi4cat/voc4cat.git
 * [new tag]         v2025-05-22 -> v2025-05-22
```

### Step 7: Monitor Automated Publish Workflow

The push of a tag matching `v[0-9]+-[0-9]+-[0-9]+` triggers the `.github/workflows/publish.yml` workflow automatically. This workflow:

1. Checks out the tagged commit and the `gh-pages` branch
2. Builds the joined vocabulary file from individual Turtle files
3. Generates pyLODE documentation (HTML)
4. Creates Excel and XML/RDF files from the vocabulary
5. Builds the Sphinx documentation site
6. Copies all outputs to both `publish/latest/` and `publish/vYYYY-MM-DD/` directories
7. Publishes everything to the `gh-pages` branch

Monitor the workflow:

1. Navigate to <https://github.com/nfdi4cat/voc4cat/actions>
2. Look for the "Publish" workflow run triggered by your tag
3. Wait for completion (typically 5-10 minutes)
4. Check for any errors in the workflow logs

```{warning}
If the publish workflow fails, the release is incomplete. Check the workflow logs and fix any issues. You may need to delete the tag, fix the problem, and retry.
```

To delete a tag and retry:
```bash
git tag -d vYYYY-MM-DD  # delete local tag
git push --delete origin vYYYY-MM-DD  # delete remote tag
```

### Step 8: Create GitHub Release

Once the publish workflow completes successfully, create a GitHub Release from the tag:

1. Navigate to <https://github.com/nfdi4cat/voc4cat/releases>
2. Click "Draft a new release"
3. Click "Choose a tag" and select your version tag (e.g., `v2025-05-22`)
4. Set a release title that matches the tag (e.g., `Release 2025-05-22`)
5. In the release notes, summarize the changes included in the new release. Follow the style of the previous release notes.
6. Check "Set as the latest release"
7. Click "Publish release"

### Step 9: Verify Release

After publishing, verify the release is accessible:

1. Check the permanent URL: `https://w3id.org/nfdi4cat/voc4cat/vYYYY-MM-DD`
2. Verify the latest release redirects: `https://w3id.org/nfdi4cat/voc4cat`
3. Check the Sphinx documentation site includes the new release
4. Download and verify the Excel file from `https://nfdi4cat.github.io/voc4cat/vYYYY-MM-DD/voc4cat.xlsx`

## Release Artifacts

Each release publishes the following artifacts to the `gh-pages` branch under both `latest/` and `vYYYY-MM-DD/` directories:

| Artifact | Description |
|----------|-------------|
| `index.html` | pyLODE-generated HTML documentation of the vocabulary |
| `voc4cat.ttl` | Joined Turtle/SKOS file containing the complete vocabulary |
| `voc4cat.xml` | RDF/XML format of the vocabulary |
| `voc4cat.xlsx` | Excel file generated from the vocabulary (for contributors) |
| `voc4cat/` | Directory with individual Turtle files (one per concept/collection) |
| `voc4cat.log` | Log file from voc4cat-tool operations |

The Sphinx documentation site is published to the root of `gh-pages`.

## Troubleshooting

### Yanking a Release

If a release is published with critical errors:

1. Mark it as "Pre-release" or delete it in the GitHub Releases UI
2. Add an entry to the "Yanked releases" section in `docs/index.md`
3. Create a new corrected release with an incremented date

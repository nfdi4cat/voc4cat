# Automated PR Submission Checks

This directory contains the `pr-checks.yml` workflow that provides automated feedback to help contributors follow best practices when submitting pull requests.

## What It Checks

### 1. Main Branch Submissions
**Problem**: Contributors sometimes submit PRs from the `main` branch of their fork, which makes it difficult to:
- Keep their fork synchronized with upstream
- Work on multiple PRs simultaneously
- Manage future contributions

**Solution**: The workflow detects this pattern and posts a friendly comment with:
- Explanation of why this is problematic
- Step-by-step instructions to use feature branches in the future
- Reassurance that the current PR can still be merged

### 2. Missing Top-Concept Classification
**Problem**: New concepts must be part of the SKOS hierarchy and eventually link to one of the top-level concepts.

**Solution**: The workflow:
- Parses all vocabulary Turtle files using RDFLib
- Identifies new concepts added in the PR
- Validates that each new concept has a path to a top concept via `skos:broader` relationships
- Comments with a list of unclassified concepts if any are found

### 3. Organization Account Submissions
**Problem**: PRs from organization accounts (vs. personal accounts) may have implications for:
- Contributor credit in releases (Zenodo, etc.)
- Permission settings

**Solution**: The workflow posts an informational comment when it detects an organization account, explaining:
- This is generally fine
- Potential implications for contributor credit
- How to switch to a personal account if desired

## Design Principles

1. **Helpful, Not Blocking**: Comments are informational only and don't prevent PR merging
2. **Friendly Tone**: Messages are welcoming and provide actionable guidance
3. **No Spam**: Comments are only posted once per PR (or updated if already exists)
4. **Security**: Uses `pull_request_target` to safely work with forks while protecting secrets
5. **Lightweight**: Checks run quickly and don't burden CI resources

## Limitations

### Organization Account Detection
The check for organization accounts works but has some limitations:
- GitHub's API correctly identifies the owner type
- However, there may be edge cases where permissions make it difficult to automatically detect all scenarios
- The original issue mentioned this "fails due to GitHub issue" - we've implemented it anyway as it works in most cases

### Top-Concept Classification
The SKOS hierarchy validation:
- Relies on properly formatted Turtle files
- May miss concepts if the RDF parsing fails
- Assumes the vocabulary follows SKOS conventions
- Only checks new concepts (not modifications to existing ones)

## Testing

To test these workflows:

1. **Main Branch Test**: Create a PR from the main branch of a fork
2. **Org Account Test**: Create a PR from an organization-owned fork
3. **Unclassified Concept Test**: Add a concept without a proper `skos:broader` link to the hierarchy

## Maintenance

### Updating Comment Text
To modify the messages shown to contributors, edit the `commentBody` strings in `.github/workflows/pr-checks.yml`.

### Adjusting Validation Logic
The top-concept classification logic is in the Python script within the workflow. Key functions:
- `is_classified_under_top_concept()`: Recursively checks if a concept reaches a top concept
- `get_top_concepts()`: Identifies concepts marked with `skos:topConceptOf`
- `get_broader_concepts()`: Finds parent concepts via `skos:broader` and `skos:narrower` relationships

### Future Enhancements
Potential improvements:
- Check for duplicate concept IDs
- Validate definition quality (e.g., minimum length, no "TBD")
- Detect concepts with multiple parents (which may need special attention)
- Check for proper use of collections
- Validate cross-references and mappings

## Related Documentation

- [CONTRIBUTING.md](../../CONTRIBUTING.md) - General contribution guidelines
- [Vocabulary Guidelines](https://nfdi4cat.github.io/voc4cat/docs_usage/guidelines.html) - Detailed guidelines for vocabulary development
- [ci-pr.yml](./ci-pr.yml) - Main CI workflow that processes vocabulary submissions

## Feedback

If you have suggestions for improving these automated checks or encounter issues, please:
1. Create an issue in this repository
2. Tag it with the `automation` or `ci/cd` label
3. Describe the problem or enhancement you'd like to see

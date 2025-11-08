# Automated PR Submission Checks

This directory contains workflows and instructions that help contributors follow best practices when submitting pull requests.

## Files

### `copilot-instructions.md`
Instructions for GitHub Copilot to provide helpful review feedback on PRs. These guide Copilot to:
- Detect PRs from main branch and suggest using feature branches
- Identify organization account submissions that will block CI
- Check for proper concept classification in the hierarchy

### `pr-checks.yml`
Automated GitHub Actions workflow that provides immediate feedback for:
- PRs from fork's main branch (helpful workflow suggestion)
- Organization account submissions (critical - blocks CI due to GitHub limitation)

**Security**: This workflow uses `pull_request_target` and implements script injection prevention. See `SECURITY.md` for details.

### `SECURITY.md`
Documents security considerations and mitigations implemented in the workflow, including:
- Script injection prevention
- Sanitization of user-controlled data
- Testing procedures with security tools

## What Gets Checked

### 1. Main Branch Submissions
**Problem**: Contributors sometimes submit PRs from the `main` branch of their fork, which makes it difficult to:
- Keep their fork synchronized with upstream
- Work on multiple PRs simultaneously
- Manage future contributions

**Solution**: The workflow posts a friendly comment explaining why feature branches are better, with step-by-step instructions.

### 2. Organization Account Submissions ⚠️ CRITICAL
**Problem**: GitHub does not allow the "Allow edits from maintainers" option for forks stored in organizations. This blocks our CI because it needs to:
- Commit generated turtle files from submitted Excel files
- Remove Excel files from inbox after processing

**Solution**: The workflow posts a comment explaining this is a GitHub limitation and the PR must come from a personal account.

**Reference**: https://github.com/orgs/community/discussions/5634

### 3. Missing Top-Concept Classification
**Problem**: New concepts must be linked to the vocabulary hierarchy via `skos:broader` relationships.

**Solution**: GitHub Copilot (via `copilot-instructions.md`) watches for this and provides guidance. This check is **not** automated in the workflow because Python code in Actions is difficult to test.

## Design Principles

1. **Helpful, Not Blocking**: Comments are informational only and don't prevent PR merging (except org accounts which can't work)
2. **Friendly Tone**: Messages are welcoming and educational, not punitive
3. **No Spam**: Comments are only posted once per PR
4. **Secure**: Uses `pull_request_target` safely with script injection prevention (user-controlled data is sanitized)
5. **Lightweight**: Checks run quickly and don't burden CI resources

## Limitations

### Organization Account Detection
Works correctly via GitHub API. The issue is a GitHub platform limitation documented at https://github.com/orgs/community/discussions/5634 - organization forks simply cannot grant the "Allow edits from maintainers" permission.

### Top-Concept Classification
This is handled by GitHub Copilot review suggestions rather than automated checking because:
- Python code in GitHub Actions is difficult to test automatically
- Manual review provides better context-specific feedback
- Allows for nuanced judgment about proper classification

## Using GitHub Copilot for Reviews

The `.github/copilot-instructions.md` file provides guidance to GitHub Copilot when reviewing PRs. To use:

1. Enable GitHub Copilot in your repository settings
2. Copilot will automatically read the instructions file
3. When reviewing PRs, Copilot will follow these guidelines
4. You can also explicitly ask Copilot questions like:
   - "@copilot is this PR from the main branch?"
   - "@copilot are the new concepts properly classified?"

See: https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions

## Maintenance

### Updating Comment Text
To modify the messages shown to contributors, edit the `commentBody` strings in `pr-checks.yml`.

### Updating Copilot Guidance
Edit `copilot-instructions.md` to change how Copilot reviews PRs and what it looks for.

### Future Enhancements
Potential improvements:
- Check for duplicate concept IDs
- Validate definition quality (e.g., minimum length, no "TBD")
- Check for proper use of collections
- Validate cross-references and mappings

## Related Documentation

- [CONTRIBUTING.md](../../CONTRIBUTING.md) - General contribution guidelines
- [Vocabulary Guidelines](https://nfdi4cat.github.io/voc4cat/docs_usage/guidelines.html) - Detailed guidelines for vocabulary development
- [ci-pr.yml](./ci-pr.yml) - Main CI workflow that processes vocabulary submissions

## Feedback

If you have suggestions for improving these checks or encounter issues, please:
1. Create an issue in this repository
2. Tag it with the `automation` or `ci/cd` label
3. Describe the problem or enhancement you'd like to see


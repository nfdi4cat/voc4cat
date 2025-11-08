# GitHub Copilot Instructions for voc4cat

This repository contains a SKOS vocabulary for catalysis maintained by NFDI4Cat. When reviewing pull requests, please help contributors follow these best practices:

## Common PR Submission Issues

### 1. PRs Submitted from Main Branch of Fork

**Problem:** Contributors sometimes submit PRs from the `main` branch of their fork, which makes it difficult to:
- Keep their fork synchronized with upstream changes
- Work on multiple PRs simultaneously
- Manage future contributions cleanly

**What to look for:**
- Check if the PR is from a fork's `main` branch to `nfdi4cat/voc4cat:main`
- Look at the source branch name in the PR header

**Suggested response:**
```
Thank you for your contribution! I noticed this PR is submitted from the main branch of your fork. While this works, it can cause issues:

- It makes it harder to keep your fork updated with upstream changes
- You won't be able to work on multiple PRs at once
- Future contributions may be complicated by merge conflicts

For future PRs, please use a feature branch:
1. Create a new branch: `git checkout -b descriptive-branch-name`
2. Make your changes and commit to this branch
3. Push the branch: `git push origin descriptive-branch-name`
4. Create PR from the feature branch

This PR can still be merged, but please use feature branches going forward!
```

### 2. PRs from Organization Accounts

**Problem:** GitHub does not allow the "Allow edits from maintainers" option for forks stored in organizations. This is **critical** because our CI workflow needs this permission to:
- Commit generated turtle files from submitted Excel files
- Remove Excel files from the inbox after processing

**What to look for:**
- Check if the PR originates from an organization account (org icon next to username)
- Look at the fork owner in the PR source information

**Suggested response:**
```
⚠️ This PR comes from an organization account, which will prevent our CI workflow from working correctly.

GitHub does not allow the "Allow edits from maintainers" option for forks in organizations (see https://github.com/orgs/community/discussions/5634). Our CI needs this permission to commit turtle files and clean up Excel files.

**This PR cannot be merged as-is.** Please:
1. Fork voc4cat to your personal GitHub account
2. Create a feature branch with your changes
3. Submit a new PR from your personal fork
4. Close this PR

Sorry for the inconvenience - this is a GitHub limitation, not our choice!
```

### 3. Missing Classification Under Top Concepts

**Problem:** New concepts in the SKOS vocabulary must be properly classified by linking them to the hierarchy through `skos:broader` relationships, eventually reaching one of the top concepts.

**What to look for:**
- Excel files in `inbox-excel-vocabs/` with new concepts
- Check if new concepts have `skos:broader` relationships defined
- Verify the broader concepts eventually chain to a top concept like:
  - Process
  - Method  
  - Material entity
  - Quality
  - Role
  - etc.

**Suggested response:**
```
I noticed some new concepts in your submission. Please ensure each new concept has:

1. A `skos:broader` relationship to a parent concept
2. A chain of broader relationships that eventually reaches one of the top-level concepts

This ensures proper integration into the vocabulary hierarchy. You can check the existing vocabulary structure at https://nfdi4cat.github.io/voc4cat/ for examples.

Let me know if you need help identifying the appropriate parent concepts!
```

## General Guidance

### What Makes a Good Contribution

- **Small, focused changes**: Single concept additions or small groups (~20 concepts)
- **Clear descriptions**: Explain what the concepts represent and why they're needed
- **Proper classification**: All concepts linked into the hierarchy
- **Use Excel workflow**: Never edit .ttl files directly, only the Excel template
- **Request ID ranges**: Get an ID range before adding new concepts

### What to Check in PRs

1. **File locations**: Excel files should be in `inbox-excel-vocabs/`
2. **File naming**: Keep as `voc4cat.xlsx`
3. **No direct .ttl edits**: Turtle files should only be modified by CI
4. **Documentation**: Changes should be described in PR description
5. **Size**: Large contributions should be split into smaller PRs

### Helpful Resources

- Contributing Guide: https://github.com/nfdi4cat/voc4cat/blob/main/CONTRIBUTING.md
- Vocabulary Guidelines: https://nfdi4cat.github.io/voc4cat/docs_usage/guidelines.html
- Current Vocabulary: https://nfdi4cat.github.io/voc4cat/

## Tone and Approach

- Be welcoming and encouraging, especially to first-time contributors
- Explain **why** something is important, not just that it's required
- Provide concrete, actionable steps to fix issues
- Acknowledge that GitHub's limitations (like org forks) aren't the contributor's fault
- Offer to help if contributors have questions

## What NOT to Do

- Don't block PRs unnecessarily - some issues can be fixed post-merge
- Don't be overly verbose - keep feedback concise and actionable
- Don't criticize the contributor - focus on the code/process
- Don't request changes for minor style issues in definitions
- Don't duplicate feedback if it's already been mentioned

## Priority Order

1. **Critical**: Organization account issues (blocks CI)
2. **Important**: Missing classification (affects vocabulary quality)
3. **Helpful**: Main branch usage (improves contributor workflow)
4. **Nice-to-have**: Documentation improvements, minor formatting

Focus feedback on critical and important issues first. Mention helpful suggestions but don't insist on them for small contributions.

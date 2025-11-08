# Testing Plan for PR Checks Workflow

This document outlines how to test the automated PR checks workflow to ensure it works correctly.

## Prerequisites

The workflow `.github/workflows/pr-checks.yml` will run automatically when:
- A pull request is opened to the `main` branch
- A pull request is synchronized (new commits pushed)
- A pull request is reopened

## Test Scenarios

### Test 1: PR from Main Branch of Fork

**Setup:**
1. Fork the repository to a personal account
2. Make changes directly on the `main` branch of the fork
3. Create a PR from `fork:main` to `upstream:main`

**Expected Behavior:**
- Workflow runs successfully
- A comment is posted explaining why submitting from main branch is problematic
- Comment includes instructions on how to use feature branches
- Comment is friendly and doesn't block the PR

**How to Verify:**
- Check that `check-pr-submission` job completes
- Look for comment from github-actions bot
- Confirm comment text matches template in workflow
- Verify comment is only posted once (not duplicated on subsequent pushes)

### Test 2: PR from Feature Branch

**Setup:**
1. Fork the repository
2. Create a feature branch: `git checkout -b test-feature`
3. Make changes and push to the feature branch
4. Create a PR from `fork:test-feature` to `upstream:main`

**Expected Behavior:**
- Workflow runs successfully
- NO comment about main branch is posted
- No errors or warnings

**How to Verify:**
- Check that `check-pr-submission` job completes
- Confirm no comment about main branch appears
- Check job logs show correct detection

### Test 3: PR from Organization Account

**Setup:**
1. Fork the repository to an organization account (if available)
2. Create a PR from the organization's fork
3. Submit the PR

**Expected Behavior:**
- Workflow runs successfully
- An informational comment is posted about organization accounts
- Comment explains potential implications
- Comment includes option to switch to personal account

**How to Verify:**
- Check that `check-pr-submission` job completes
- Look for comment about organization account
- Verify comment is informational and non-blocking

### Test 4: New Concepts with Proper Classification

**Setup:**
1. Add new concepts to the vocabulary Excel file
2. Ensure each new concept has a proper `skos:broader` relationship
3. Verify the chain eventually reaches a top concept
4. Submit the PR

**Expected Behavior:**
- Workflow runs successfully
- `check-top-concepts` job completes without errors
- NO comment about missing classification is posted
- Workflow passes

**How to Verify:**
- Check that both jobs complete successfully
- Review job logs to see concepts were analyzed
- Confirm "All new concepts are properly classified" message in logs

### Test 5: New Concepts WITHOUT Proper Classification

**Setup:**
1. Add new concepts to the vocabulary Excel file
2. Intentionally omit `skos:broader` relationships OR
3. Add broader relationship that doesn't chain to a top concept
4. Submit the PR

**Expected Behavior:**
- Workflow runs
- `check-top-concepts` job detects unclassified concepts
- A comment is posted listing the unclassified concepts
- Comment explains why classification is important
- Comment provides guidance on how to fix

**How to Verify:**
- Check that `check-top-concepts` job runs
- Verify comment lists the unclassified concept URIs
- Confirm comment includes helpful guidance
- Check that comment is updated (not duplicated) if more commits are pushed

### Test 6: PR with No New Concepts (Modification Only)

**Setup:**
1. Modify existing concepts (change definitions, add synonyms, etc.)
2. Do NOT add new concepts
3. Submit the PR

**Expected Behavior:**
- Workflow runs successfully
- `check-top-concepts` job completes
- Logs show "No new concepts added in this PR"
- No classification comments posted

**How to Verify:**
- Check job logs for the expected message
- Confirm no classification-related comments appear
- Workflow completes successfully

### Test 7: Documentation-Only Changes

**Setup:**
1. Make changes only to .md files or documentation
2. Don't modify vocabulary files at all
3. Submit the PR

**Expected Behavior:**
- `check-pr-submission` job runs (checks branch regardless of changes)
- `check-top-concepts` job runs but finds no vocabulary changes
- No issues or comments about concepts
- Workflow completes successfully

**How to Verify:**
- Both jobs complete
- Logs show no vocabulary files changed
- No errors or unexpected behavior

## Monitoring and Debugging

### Where to Check Workflow Runs

1. Go to the repository's Actions tab
2. Click on "PR Submission Checks" workflow
3. Select a specific run to see job details
4. Review logs for each job and step

### Common Issues and Solutions

**Issue:** Workflow doesn't trigger
- **Solution:** Check that the PR targets the `main` branch
- **Solution:** Verify workflow file is on the base branch (main)

**Issue:** Python script fails to parse Turtle files
- **Solution:** Check that vocabulary files are valid Turtle format
- **Solution:** Review error logs for parsing issues
- **Solution:** Ensure rdflib is installed correctly

**Issue:** Comments are duplicated
- **Solution:** Check the logic that searches for existing comments
- **Solution:** Verify comment detection regex is correct

**Issue:** Workflow fails with permissions error
- **Solution:** Verify `pull-requests: write` permission is set
- **Solution:** Check that `pull_request_target` is used (not `pull_request`)

## Success Criteria

The workflow is considered successful when:

1. ✅ All test scenarios pass as expected
2. ✅ Comments are friendly, helpful, and not spammy
3. ✅ No false positives or false negatives in detection
4. ✅ Workflow completes in reasonable time (< 5 minutes)
5. ✅ No security issues with fork handling
6. ✅ Contributors find the feedback helpful (gather feedback over time)

## Future Enhancements

Based on testing and user feedback, consider:

- Adding more vocabulary-specific checks
- Improving detection accuracy
- Adding links to specific sections of guidelines
- Providing automated fixes where possible
- Collecting metrics on common issues

## Rollback Plan

If the workflow causes issues:

1. Disable by adding `if: false` to the top of each job
2. Push the change to main branch
3. Investigate and fix the issue
4. Re-enable and test on a fork first
5. Merge fix when confirmed working

## Feedback Collection

To gather feedback on the automated checks:

1. Monitor PR comments and discussions
2. Create a feedback issue for contributors to share experiences
3. Review which comments are most helpful
4. Adjust messaging based on contributor responses
5. Track if issues decline over time (indicating effectiveness)

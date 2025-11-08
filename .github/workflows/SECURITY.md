# Security Considerations for PR Checks Workflow

## Overview

The `.github/workflows/pr-checks.yml` workflow uses `pull_request_target` which runs in the context of the base repository with write permissions. This is necessary to post comments on PRs from forks, but requires careful handling of user-controlled data to prevent security vulnerabilities.

## Security Mitigations Implemented

### 1. Script Injection Prevention

**Vulnerability**: User-controlled data (usernames, branch names, PR titles) could contain malicious content that gets executed if interpolated directly into template literals or strings.

**Mitigation**: 
- **Username sanitization**: GitHub usernames can only contain alphanumeric characters and hyphens. We sanitize by removing any other characters: `pr.user.login.replace(/[^a-zA-Z0-9-]/g, '')`
- **Console logging**: Changed from template literals to comma-separated arguments: `console.log('Key:', value)` instead of `console.log(\`Key: \${value}\`)`
- **No code execution**: User data is only used in comment bodies (Markdown), not in executable contexts

### 2. Minimal Permissions

The workflow uses the principle of least privilege:
```yaml
permissions:
  pull-requests: write  # Only for posting comments
  contents: read        # Only for reading PR metadata
```

### 3. No Code Checkout from Forks

This workflow does NOT checkout code from the PR branch, avoiding the risk of executing malicious code from forks. It only:
- Reads PR metadata via GitHub API
- Posts comments to the PR

### 4. Limited Scope

The workflow only performs these actions:
1. Detect if PR is from main branch (informational)
2. Detect if PR is from organization account (critical)
3. Post comments with guidance

No sensitive operations like deploying, publishing, or modifying code are performed.

## What Data is Safe to Use?

### Safe (GitHub-controlled):
- `context.repo.owner` - Base repository owner
- `context.repo.repo` - Base repository name
- `pr.number` - PR number (numeric)
- `pr.head.repo.owner.type` - Owner type (enum: "User" or "Organization")

### Requires Sanitization (User-controlled):
- `pr.user.login` - Username (sanitize to alphanumeric + hyphens)
- `pr.head.ref` - Branch name (can contain special characters)
- `pr.head.repo.full_name` - Repository name (can be renamed)
- `pr.title` - PR title (arbitrary text)
- `pr.body` - PR description (arbitrary Markdown)

## Testing for Security Issues

### Recommended Tools:
1. **zizmor**: Security linting for GitHub Actions
   ```bash
   pip install zizmor
   zizmor .github/workflows/pr-checks.yml
   ```

2. **actionlint**: General linting for GitHub Actions
   ```bash
   actionlint .github/workflows/pr-checks.yml
   ```

3. **Manual review**: Check for any use of `${}` with user-controlled data

### Test Cases:
1. PR from user with unusual username (test sanitization)
2. PR from branch with special characters in name
3. PR with malicious content in title/description

## References

- [GitHub Actions Security Hardening](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions)
- [Preventing Script Injection](https://securitylab.github.com/research/github-actions-preventing-pwn-requests/)
- [actions/github-script Security](https://github.com/actions/github-script#passing-inputs-to-the-script)

## Monitoring

Watch for:
- Unexpected workflow failures
- Comments with unusual formatting
- GitHub security advisories related to Actions

## Updates

When modifying this workflow:
1. ✅ Never use `${}` with user-controlled data in template literals
2. ✅ Always sanitize usernames, branch names, and other user inputs
3. ✅ Use console.log with comma-separated values, not template literals
4. ✅ Test with edge cases (special characters, long inputs)
5. ✅ Run security scanning tools before merging

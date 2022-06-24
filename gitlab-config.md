# Changes made versus the default gitlab repository settings:

1. Change to requiring successful completion of CI for merge requests

	Settings > General > Merge requests > Merge Checks
	
	- activate "Pipeline must succeed"
	
2. Forbid pushing to main for everyone (all contributions should proceed via branches / merge requests):

	Settings > Repository > Protected branches
	
	- For branch "main", set "Allowed to push" to "No one".

3. Create an access token for committing/pushing from CI/CD pipeline

	Settings > Access Tokens

	- Token name: gitlab-voc4cat-CI
	- Scopes: read_repository, write_repository
	- Role  : Maintainer

4. Create a variable to use this access token in CI

	Settings > CI/CD > Variables

	- Key: PROJECT_ACCESS_TOKEN
	- Protected: No
	- Masked: Yes
	- Environments: All

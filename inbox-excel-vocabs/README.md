**Please drop your filled out Excel-templates into this folder and create a merge request.**

See also [../README.md](../README.md) for the steps in the contribution process.

- Copy the file with your updates to this folder
- Rename it to `voc4cat.xlsx`.
- Add the file to git and submit a pull request.
- If there is no validation error the vocabulary `vocabularies/voc4cat.ttl` is updated via gh-actions and committed to your pull request. The Excel file is removed from the pull request.
- If there are errors, you can examine them in the run log.
- In any case (error or not) you can download the xlsx file along with a log-file and the generated documentation as [workflow artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts).
The xlsx-file in the artifact will be the updated one that is recreated from the updated turtle-file.

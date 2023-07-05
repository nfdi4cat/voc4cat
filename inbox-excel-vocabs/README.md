**Please drop your filled out Excel-templates into this folder and create a merge request.**

To test the pipeline you may use the template `templates/voc4cat_template_043.xlsx` file.

- Copy the file to this folder
- Rename it to `vocab_example.xlsx`.
- Add the file to git and submit a pull request
- The vocabulary `vocabularies/vocab_example.ttl` is generated (or updated) via gh-action and committed to your pull request. The Excel file is removed from the pull request. However, the Excel file along with a log-file and the generated documentation can be [downloaded as workflow artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts).

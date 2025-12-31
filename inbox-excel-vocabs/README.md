**Please drop/add your edited Excel-vocabulary file into this folder and create a pull request.**

The most recent version of the vocabulary is always available via github-pages.
- The general url is `https://{gh-org-name}.github.io/{repository-name}/dev/{vocabulary-name}.xlsx`
  - For example in nfdi4cat/voc4cat-template the most recent vocabulary `vocab_example` can be downloaded from <https://nfdi4cat.github.io/voc4cat-template/dev/vocab_example.xlsx>
- Check the filename of your excel file. The stem of filename must match the vocabulary to create or update. So, in case of the example in this repo the filename must be `vocab_example.xlsx`
- Copy the file to this folder.
- Add the file to git and submit a pull request. On GitHub the file can be added by dropping it to this folder.
- If there are no validation errors the turtle files of the vocabulary in `vocabularies/vocab_example/` are generated (or updated) via gh-actions and committed to your pull request. The Excel file is removed from the pull request.
- If there are errors, you can examine them in the run log.
- In any case (error or not) you can download the xlsx file along with a log-file and the generated documentation as [workflow artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts).
The xlsx-file in the artifact will be an updated one that is either recreated from the updated turtle-files or (in case of errors) annotated.

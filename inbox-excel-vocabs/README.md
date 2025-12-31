**Please drop/add your edited Excel-vocabulary file into this folder and create a pull request.**

If you need more guidance, see the [How-to-Cuontribute](https://nfdi4cat.github.io/voc4cat/docs_usage/how-to-contribute.html) guide.

- Make sure that the file with your contributions is named exactly `voc4cat.xlsx`. Using the correct file name is essential to start the processing.
- Add the file to git and submit a pull request. On GitHub the file can be added by dropping it to this folder.
- If there are no validation errors the turtle files of the vocabulary in `vocabularies/voc4cat/` are updated via gh-actions and committed to your pull request. The Excel file is removed from the pull request.
- If there are errors, you can examine them in the run log.
- In any case (error or not) you can download the xlsx file along with a log-file and the generated documentation as [workflow artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts).
The xlsx-file in the artifact will be an updated one that is either recreated from the updated turtle-files or (in case of errors) annotated.

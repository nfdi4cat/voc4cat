# Building the documentation locally

You need a recent Python version on your computer and a local clone of the repository.

The following commands should be run from the root directory of the clone.

First, install the required packages into a virtual environment. The documentation is build with Sphinx and MyST for markdown support.

```bat
py -m venv .venv
.venv\Scripts\activate
pip install -r docs\requirements.txt
```

Navigate to the docs-directory and build the documentation:

```bat
cd docs
make html
```

The documentation is created in `docs/_build` and can be previewed by opening the file `docs\_build\html\index.html` in a web browser.

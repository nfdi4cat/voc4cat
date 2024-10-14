# Building the documentation locally

You need a recent Python version on your computer and a local clone of the repository.

The following commands should be run from the root directory of the clone.

First, install the required packages into a virtual environment. The documentation is built with Sphinx and MyST for markdown support.

```bat
py -m venv .venv
.venv\Scripts\activate
pip install -r docs\requirements.txt
```

Build the documentation (option `-a` tells sphinx to rebuild all files, `--nitpicky` warns on missing references):

```bat
sphinx-build -a --nitpicky docs docs/_build
```

The documentation is created in `docs/_build` and can be previewed by opening the file `docs\_build\html\index.html` in a web browser.

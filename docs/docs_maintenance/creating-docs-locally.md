# Building the docs locally

You need on your computer:
- A recent Python version,
- The [uv package manager](https://docs.astral.sh/uv/getting-started/installation/) and
- A local clone of the repository.

The following commands should be run from the root directory of the clone.

First, install the required packages into a virtual environment.

```bat
uv venv
.venv/Scripts/activate
uv pip install -r docs\requirements.txt
```

Then build the documentation with Sphinx and MyST for markdown support
(`-a` tells sphinx to rebuild all files, `--nitpicky` warns on missing references). 

```bash
sphinx-build -a --nitpicky docs docs/_build
```

The documentation is created in `docs/_build` and can be previewed by opening the file `docs/_build/html/index.html` in your web browser.

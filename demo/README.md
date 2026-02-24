# Voc4Cat Demo Notebook

Interactive Jupyter notebook showing how to download, query, and visualize the
[Voc4Cat](https://w3id.org/nfdi4cat/voc4cat) SKOS vocabulary with Python.

## Local Setup with uv

Create a virtual environment and install dependencies

```bash
uv venv
source .venv/bin/activate   # Linux/macOS
.venv\Scripts\activate       # Windows

uv pip install -r requirements.txt
```

Start Jupyter server:

```bash
jupyter notebook explore-voc4cat.ipynb
```

## Updating dependencies

`requirements.in` lists the direct dependencies.
To regenerate the pinned `requirements.txt`:

```bash
uv pip compile --upgrade requirements.in -o requirements.txt
```

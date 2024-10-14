# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Voc4Cat'
copyright = '2024, Voc4Cat contributors'
author = 'David Linke, Nikolaos Moustakas, and Voc4Cat contributors'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    # Sphinx extensions
    "sphinx.ext.autosectionlabel",
    "sphinx.ext.todo",
    # External extensions
    "myst_parser",
    "sphinx_copybutton",
    "sphinx_inline_tabs",
    "sphinx_design",
]
templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'README.md']

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'furo'
html_static_path = ['_static']
html_favicon = '_static/favicon_32.png'
html_last_updated_fmt = '%Y-%m-%d'

# -- Options for todo extension -----------------------------------
# https://www.sphinx-doc.org/en/master/usage/extensions/todo.html#module-sphinx.ext.todo

todo_include_todos = True  # default is False
# todo_emit_warnings = True  # default is False.

# -- Options for autosectionlabel extension -----------------------------------
# https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html#module-sphinx.ext.autosectionlabel

autosectionlabel_prefix_document = True

# -- Options for MyST parser --------------------------------------------------
# https://myst-parser.readthedocs.io/en/latest/configuration.html

myst_enable_extensions = [
    "attrs_inline", # enable {}-attribute syntax like ![](img/fish.png){w=100px align=center}
    "colon_fence",  # enable the colon_fence ::: syntax for admonitions
    "html_image",   # convert HTML <img> elements to sphinx image nodes
]

# -- Options for Furo theme ---------------------------------------------------
# https://pradyunsg.me/furo/customisation/

html_theme_options = {
    "sidebar_hide_name": True,
    "top_of_page_buttons": ["edit"],
    "light_logo": "voc4cat-logo-light-mode.svg",
    "dark_logo": "voc4cat-logo-dark-mode.svg",
    # Custom theme colors may be set via css variables
    "light_css_variables": {
        "color-brand-primary": "#016992",  # dark blue of "Cat" in light Voc4Cat logo
        "color-brand-content": "#016992",
        "color-announcement-background": "#91c63f",  # green of "4" in light Voc4Cat logo
        "color-announcement-text": "#000000",
    },
    "dark_css_variables": {
        "color-announcement-background": "#91c63f",
        "color-announcement-text": "#000000",
    },
    "source_repository": "https://github.com/nfdi4cat/voc4cat",
    "source_branch": "main",
    "source_directory": "docs/",
    "footer_icons": [
        {
            "name": "GitHub",
            "url": "https://github.com/nfdi4cat/voc4cat",
            "html": """
                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path>
                </svg>
            """,
            "class": "",
        },
    ],
    # HTML to be show in a announcement banner at the top of the page
    "announcement": "<strong>News 2024-10-12</strong>: Voc4Cat finally got a nice home page! - <small>Some sections are still work in progress. 🛠️ </small>",
}

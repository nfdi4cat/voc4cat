## Excel templates

The templates here match structure-wise with the templates in [Voc4Cat-tool](https://github.com/nfdi4cat/voc4cat-tool) of the same version number.

### Version 0.4.3

#### Revision 2023-08a

- Changed included example data to be consistent with improved validation.
- Updated help on filling out provenance fields.

#### Revision 2023-07a

- Fixed typos.

#### Revision 2023-06a

- Corrected the pre-defined prefix for voc4cat.

#### Revision 2023-03a

The following is different in the voc4cat-template (`voc4cat_template_043.xlsx`):

- Recreated "Introduction" sheet for voc4cat and added NFDI4Cat logo
- Replaced "README" sheet by "Help" sheet that is adapted for voc4cat
- Sheets "Concept Scheme", "Concepts", "Additional Concept Features", "Collections"
  - Renamed columns to be more consistent (e.g. URI vs. IRI, plural column names for columns that accept lists)
  - Changed all data entry ranges to tables. The tables are named as the sheet they are in. The table names are not used in code so far but may be in the future.
- Sheet "Additional Concept Features": Removed Excel formula in Concept-IRI-column since the formula could easily lead to mixing-up previously added relations.
- Sheet "Prefix Sheet": Added a xlsx-validation rule to check that prefixes do not end with a colon.

The identical template `voc4cat_template_043.xlsx` is included in [voc4cat-tool/templates](https://github.com/nfdi4cat/voc4cat-tool/tree/main/templates).

### Earlier template versions

Earlier template versions which are not listed here should not be used.

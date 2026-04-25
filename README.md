# ML-Assisted Screening for Systematic Review

This repository contains code and documentation for a machine-learning–assisted
screening workflow used to support a systematic or systematized literature review.
The project focuses on performing transparent data quality assessment (QA),
preprocessing bibliographic records, training screening models, and applying those
models to prioritize new records for review.

The workflow is designed to be:
- Reproducible
- Auditable
- Aligned with systematic review reporting expectations (e.g., PRISMA)

---

## Repository Structure

The repository is organized to reflect the logical stages of the workflow.
Folders are numbered to encourage a consistent execution order.

```
.
├── 00_data_input
├── 01_data_import
├── 02_data_prep
├── 03_modeling
├── 04_output
├── 05_docs
├── 06_exports
├── 07_sandbox
├── README.md
├── LICENSE
└── .gitignore
```

---

## Folder Descriptions

### `00_data_input/`
Raw, immutable input files.

This folder should contain:
- Original bibliographic exports (e.g., CSV, RIS, or XML files)
- Screening label files (e.g., records selected for full-text review)
- Any external reference files used as inputs

Files in this folder **should not be edited**.  
If cleaning or transformation is needed, it should happen downstream.

---

### `01_data_import/`
Scripts that read raw inputs and convert them into analysis-ready data frames.

This folder typically contains:
- R scripts or R Markdown files that:
  - Read raw input files from `00_input/`
  - Standardize column names and formats
  - Perform initial validation (e.g., row counts, key fields present)
- Saved intermediate datasets (if needed)

---

### `02_data_prep/`
Data quality assessment and preprocessing.

This folder should contain:
- QA reports (e.g., R Markdown) documenting:
  - Missingness
  - Duplicates
  - Label integrity
  - Text completeness
  - Training vs. prediction dataset comparability
- Text preprocessing steps (e.g., title/abstract concatenation)
- Any feature engineering required prior to modeling

This stage is intentionally separated from modeling to make assumptions explicit.

---

### `03_modeling/`
Model development and evaluation.I

This folder may include:
- Scripts or notebooks for:
  - Model training
  - Cross-validation
  - Threshold selection
  - Performance evaluation
- Saved model objects
- Notes on modeling decisions and trade-offs

No raw data should be introduced here.

---

### `04_output/`
Intermediate analytical outputs.

This folder is used for:
- data generated during QA or modeling
- model results (e.g., predictions, performance metrics)
- Temporary outputs used during development

Files here are typically reproducible and can be regenerated.

---

### `05_docs/`
Project documentation.

This folder should include:
- Methodological notes
- Meeting notes
- References
- Draft methods language for reports or manuscripts
- Any documentation not intended for direct analysis

---

### `06_exports/`
Final, shareable deliverables.

This folder contains:
- Final reports
- Tables or figures shared with collaborators
- Files used for submission or presentation

Outputs here are typically stable and versioned.

---

### `07_sandbox/`
Test files, intermediate working files, and sample data used in testing.

This folder contains:
- Files used for testing scripts or modeling approaches
- Data subsets used for debugging
- Files that are not intended for sharing but were used during the development process

Outputs are not intended for sharing and may be deleted after use.

---

## Notes

- Scripts should be written to run from the project root.
- Folder numbering reflects the intended execution order.
- Modeling decisions should be traceable back to documented QA findings.

---

## License

See the `LICENSE` file for details.

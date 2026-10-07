# Deliverable 7 – Automation

## What this does

This automation extends the existing Airbnb workflow from October 2025–June 2026 to August 2026.

It:
1. Reads the nine existing monthly Airbnb files from `Deliverable 4/Data/Raw/`.
2. Reads the new July and August 2026 files from `Deliverable 7/Data/Raw/`.
3. Filters every file to Christchurch City.
4. Adds the month/year.
5. Applies the Deliverable 4 cleaning rules.
6. Combines all 11 months.
7. Recreates the main previous analyses.
8. Saves updated plots, summaries and the cleaned dataset.
9. Performs sanity checks.

## One-command execution

From the **project root** in the RStudio Terminal:

```text
Rscript "Deliverable 7/run_deliverable7.R"
```

Or inside R/RStudio:

```r
source("Deliverable 7/run_deliverable7.R")
```

The runner itself calls `run_pipeline()` exactly once.

## New data

The July and August files supplied for Deliverable 7 are placed in:

`Deliverable 7/Data/Raw/`

These raw files should remain local and should not be committed to GitHub.

## Main outputs

The script creates:

- `Christchurch_listings_Oct2025_Aug2026_clean.csv`
- `monthly_price_summary.csv`
- `numeric_summary.csv`
- `missing_summary.csv`
- `average_price_by_month.png`
- `christchurch_price_distribution.png`
- `days_since_latest_review.png`

## Important

Do not manually edit the generated output files. If a new month is added later, place its CSV in `Deliverable 7/Data/Raw/` and run the same command again.

# ============================================================
# Block 12: Compute Age-Decade Expression Slopes
# ============================================================
# For each Theory A hub gene in each focus tissue, extracts
# per-sample TPM values, groups by donor age bracket (six
# brackets: 20-29 through 70-79), computes median expression
# per bracket, and fits a linear regression of median
# expression on age bracket midpoint. Records the slope
# (positive = increases with age, negative = decreases).
# This is a cross-sectional approximation. Survivor bias
# affects older brackets.
#
# Packages: data.table, stats (lm)
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(data.table)

gtex_cfg <- cfg$phase_b$gtex
age_brackets <- gtex_cfg$age_brackets
slope_p <- gtex_cfg$slope_pvalue_threshold

# Age bracket midpoints
midpoints <- c(24.5, 34.5, 44.5, 54.5, 64.5, 74.5)

# For each hub gene x focus tissue:
#   1. Extract per-sample TPM
#   2. Group by age bracket
#   3. Compute median TPM per bracket
#   4. lm(median_tpm ~ age_midpoint)
#   5. Record slope, p-value, R-squared

# Save: file.path(run_dir, "gtex_age_slopes.csv")
cat("Age slope analysis configured. P-value threshold:", slope_p, "\n")

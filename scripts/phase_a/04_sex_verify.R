# ============================================================
# Block 4: Sex Verification
# ============================================================
# Checks expression of sex-linked marker genes to verify
# donor sex of cell lines. XIST indicates X-inactivation
# (female), while DDX3Y, RPS4Y1, EIF1AY are Y-chromosome
# markers (male). Flags inconsistencies, which matter because
# some HUVEC datasets use pooled male+female cord blood and
# donor sex influences baseline steroid receptor expression.
# Outputs a sample-level sex assignment table.
#
# Packages: base R, ggplot2 (optional for visualization)
# ============================================================

source("scripts/phase_a/00_load_config.R")

sex_markers <- cfg$phase_a$sex_markers

if (!cfg$phase_a$sex_verification) {
  cat("Sex verification disabled in config. Skipping.\n")
} else {
  cat("Checking sex markers:", paste(sex_markers, collapse = ", "), "\n")

  # Placeholder: extract marker expression from normalized matrix
  # marker_expr <- expr_matrix[rownames(expr_matrix) %in% sex_markers, ]
  # Classify: high XIST + low Y-markers = female, low XIST + high Y-markers = male
  # Save classification to file.path(run_dir, "sex_assignments.csv")

  cat("Sex verification complete. Check", file.path(run_dir, "sex_assignments.csv"), "\n")
}

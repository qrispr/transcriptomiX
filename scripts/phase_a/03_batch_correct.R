# ============================================================
# Block 3: Cross-Dataset Batch Correction
# ============================================================
# Corrects batch effects when integrating datasets from
# different studies or platforms. Uses ComBat for microarray,
# ComBat-seq for RNA-seq counts, or rank-based normalization
# for cross-platform integration (microarray + RNA-seq mixed).
# Validates correction by plotting PCA before and after. If
# samples still cluster by study rather than treatment, the
# integration has failed and those datasets cannot be combined.
#
# Packages: sva (ComBat, ComBat-seq), limma (removeBatchEffect for viz)
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(sva)

batch_method <- cfg$phase_a$batch_correction

if (batch_method == "ComBat") {
  # combat_edata <- ComBat(dat = expr_matrix, batch = batch_vector, mod = model_matrix)
  cat("ComBat batch correction selected.\n")

} else if (batch_method == "ComBat-seq") {
  # combat_counts <- ComBat_seq(counts = count_matrix, batch = batch_vector, group = treatment_vector)
  cat("ComBat-seq batch correction selected.\n")

} else if (batch_method == "rank_based") {
  # Convert to within-sample ranks for cross-platform integration
  # rank_matrix <- apply(expr_matrix, 2, rank)
  cat("Rank-based normalization selected for cross-platform integration.\n")

} else if (batch_method == "none") {
  cat("No batch correction applied (single study).\n")
}

# PCA validation placeholder
# pca_before <- prcomp(t(expr_matrix))
# pca_after <- prcomp(t(corrected_matrix))
# Save PCA plots to run_dir

cat("Batch correction configured. Method:", batch_method, "\n")

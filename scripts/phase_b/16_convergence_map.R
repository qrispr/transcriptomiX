# ============================================================
# Block 16: Convergence Map and Tiering
# ============================================================
# Merges Theory A hub gene list, Theory B concordance, SMR,
# and COLOC results into a final convergence classification.
# Each gene is assigned a tier: TIER 1 (triple-validated:
# Theory A + Theory B + SMR/COLOC), TIER 2 (any two of three
# validation layers), or TIER 3 (Theory A only). Produces
# the final ranked gene table and overlays TIER 1/2 genes
# back onto the steroidogenesis pathway diagram.
#
# Packages: dplyr, ggplot2 (visualization)
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(dplyr)

# Load all validation results
# hub_genes <- read.csv(file.path(run_dir, "theory_a_hub_gene_list_FINAL.csv"))
# theory_b <- read.csv(file.path(run_dir, "theory_b_concordance.csv"))
# smr <- read.csv(file.path(run_dir, "smr_results.csv"))
# coloc <- read.csv(file.path(run_dir, "coloc_results.csv"))

# Merge and classify
# theory_a_pass = TRUE (all hub genes)
# theory_b_pass = concordance == "CONCORDANT"
# genetic_pass = smr_significant & coloc_h4 > threshold

# Tier assignment
# n_pass = theory_a_pass + theory_b_pass + genetic_pass
# TIER 1 = n_pass == 3
# TIER 2 = n_pass == 2
# TIER 3 = n_pass == 1

# Save: file.path(run_dir, "convergence_map_FINAL.csv")

# Append to manifest
# manifest_row <- data.frame(...)
# write.table(manifest_row, "manifest.csv", append = TRUE, sep = ",",
#             col.names = FALSE, row.names = FALSE)

cat("Convergence map configured.\n")

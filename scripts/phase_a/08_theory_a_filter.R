# ============================================================
# Block 8: Theory A Filtering (Opposite-Direction Modules)
# ============================================================
# Extracts modules where the module eigengene is significantly
# positively correlated with E2 treatment AND negatively
# correlated with T/DHT treatment (or vice versa). Filters
# for hub genes with module membership (kME) above the config
# threshold. Optionally requires that the T-treatment effect
# survives aromatase control (letrozole data) to confirm
# AR-mediation rather than aromatase-mediated E2 production.
#
# Packages: WGCNA, dplyr
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(WGCNA)
library(dplyr)

ta_cfg <- cfg$phase_a$theory_a
kme_thresh <- ta_cfg$kme_threshold

# Load module-trait correlation matrix from step 7
# Identify opposite-direction modules:
#   ME positively correlated with E2_treated AND negatively with T_treated
#   (or the reverse)

# Compute kME for all genes
# kME <- signedKME(datExpr, MEs)

# Filter hub genes: kME > threshold in opposite-direction modules
# If ta_cfg$require_ar_confirmation: keep only if flutamide data confirms AR
# If ta_cfg$require_er_confirmation: keep only if fulvestrant data confirms ER
# If ta_cfg$require_aromatase_control: keep only if letrozole control validates

# Save: file.path(run_dir, "theory_a_hub_genes.csv")
cat("Theory A filter configured. kME threshold:", kme_thresh, "\n")

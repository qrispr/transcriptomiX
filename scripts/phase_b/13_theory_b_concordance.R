# ============================================================
# Block 13: Theory B Concordance Test
# ============================================================
# Compares E2-treatment direction (from Phase A) with the
# age-slope direction (from step 12). Theory B predicts that
# aging direction should match the E2-treatment direction
# (aging phenocopies E2 exposure) and oppose the T-treatment
# direction. Classifies each gene as concordant, discordant,
# or ambiguous. Genes that are both Theory A hub genes and
# Theory B concordant are the strongest candidates.
#
# Packages: dplyr
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(dplyr)

# Load: hub gene list (step 10) + age slopes (step 12)

# For each gene:
#   e2_direction from Phase A (UP or DOWN)
#   age_slope from step 12 (positive or negative)
#   t_direction from Phase A (UP or DOWN)

# Classification:
#   CONCORDANT: age matches E2 direction AND opposes T direction
#   DISCORDANT: age does not match prediction
#   AMBIGUOUS: flat slope (p > threshold) or incomplete direction data

# Save: file.path(run_dir, "theory_b_concordance.csv")
cat("Theory B concordance test configured.\n")

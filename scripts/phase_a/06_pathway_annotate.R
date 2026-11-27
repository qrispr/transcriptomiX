# ============================================================
# Block 6: Pathway Node Annotation
# ============================================================
# For each gene, compiles a direction profile across all
# available perturbation comparisons. Each gene gets tagged
# with its response direction (UP/DOWN/NS) under each
# treatment condition. This profile is used to assign genes
# to specific steroidogenesis pathway nodes. Genes with the
# most complete profiles across perturbation classes are the
# highest-confidence candidates.
#
# Packages: dplyr, tidyr
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(dplyr)
library(tidyr)

# Placeholder: load DE results from step 5
# de_files <- list.files(run_dir, pattern = "de_results.*\\.csv", full.names = TRUE)

# Build direction profile matrix:
# gene | E2_effect | T_effect | T_letrozole_effect | T_flutamide_effect | ...
# Each cell = "UP", "DOWN", or "NS" (not significant)

# Classification logic:
# If T_effect = DOWN and T_flutamide = NS (blocked) => AR-dependent
# If T_effect = DOWN and T_letrozole = NS (lost) => aromatase-mediated
# If E2_effect = UP and E2_fulvestrant = NS => ER-dependent

# Save: file.path(run_dir, "pathway_node_annotations.csv")
cat("Pathway node annotation configured.\n")

# ============================================================
# Block 10: Compile Theory A Hub Gene List
# ============================================================
# Merges outputs from steps 5-9 into a single ranked table.
# Each hub gene is annotated with: gene symbol, Ensembl ID,
# WGCNA module, kME, direction under E2 and T/DHT, AR and ER
# confirmation status, aromatase control survival, ER subtype,
# whether it is a steroidogenesis pathway gene, and whether
# it is a known transcription factor. This table is the input
# to Phase B validation.
#
# Packages: dplyr
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(dplyr)

# Load all intermediate outputs:
# hub_genes <- read.csv(file.path(run_dir, "theory_a_hub_genes.csv"))
# pathway_annot <- read.csv(file.path(run_dir, "pathway_node_annotations.csv"))
# pathway_overlay <- read.csv(file.path(run_dir, "pathway_overlay.csv"))

# Merge into final annotated table with columns:
# gene_symbol, ensembl_id, wgcna_module, kME,
# e2_direction, t_direction,
# ar_confirmed, er_confirmed, aromatase_control_survives,
# er_subtype, is_steroidogenesis_gene, is_transcription_factor

# Rank by kME descending

# Save: file.path(run_dir, "theory_a_hub_gene_list_FINAL.csv")
cat("Phase A hub gene list compilation configured.\n")

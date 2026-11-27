# ============================================================
# Generate Per-Run README
# ============================================================
# Reads a run config YAML and produces a human-readable
# README.md in the run's results directory. Documents what
# parameters were used, which datasets were included, and
# what thresholds were applied. Auto-generated so you never
# have to write it manually.
#
# Usage: Rscript scripts/generate_run_readme.R configs/run_001.yaml
# Packages: yaml
# ============================================================

library(yaml)

args <- commandArgs(trailingOnly = TRUE)
cfg <- yaml::read_yaml(args[1])

run_dir <- file.path("results", cfg$run_id)
dir.create(run_dir, recursive = TRUE, showWarnings = FALSE)

readme <- paste0(
  "# Run: ", cfg$run_id, "\n\n",
  "Date: ", cfg$date, "\n",
  "Analyst: ", cfg$analyst, "\n\n",
  "## Exposure\n\n",
  "Compound: ", cfg$exposure$compound, "\n",
  "Concentration: ", cfg$exposure$concentration, "\n",
  "Duration: ", cfg$exposure$duration, "\n",
  "Perturbation class: ", cfg$exposure$perturbation_class, "\n",
  "Pathway node: ", cfg$exposure$pathway_node, "\n\n",
  "## Datasets\n\n",
  "GEO accessions: ", paste(cfg$datasets$geo_accessions, collapse = ", "), "\n",
  "Cell types: ", paste(cfg$datasets$cell_types, collapse = ", "), "\n",
  "Platform: ", cfg$datasets$platform, "\n\n",
  "## Phase A Parameters\n\n",
  "Normalization: ", cfg$phase_a$normalization_method, "\n",
  "Batch correction: ", cfg$phase_a$batch_correction, "\n",
  "DE method: ", cfg$phase_a$de_method, "\n",
  "FDR: ", cfg$phase_a$fdr_threshold, "\n",
  "log2FC: ", cfg$phase_a$log2fc_threshold, "\n",
  "WGCNA network: ", cfg$phase_a$wgcna$network_type, "\n",
  "Min module size: ", cfg$phase_a$wgcna$min_module_size, "\n",
  "kME threshold: ", cfg$phase_a$theory_a$kme_threshold, "\n\n",
  "## Phase B Parameters\n\n",
  "GTEx tissues: ", paste(cfg$phase_b$gtex$focus_tissues, collapse = ", "), "\n",
  "GWAS source: ", cfg$phase_b$smr$gwas_source, "\n",
  "HEIDI p threshold: ", cfg$phase_b$smr$heidi_p_threshold, "\n",
  "COLOC H4 threshold: ", cfg$phase_b$coloc$h4_threshold, "\n\n",
  "## Notes\n\n",
  cfg$notes, "\n"
)

writeLines(readme, file.path(run_dir, "README.md"))
cat("README generated:", file.path(run_dir, "README.md"), "\n")

# ============================================================
# Block 0: Load Run Configuration
# ============================================================
# This block reads the YAML config file that defines every
# parameter for the current run. All downstream scripts source
# this block first, so no parameter is ever hardcoded. The
# config path is passed as a command-line argument. The yaml
# package parses it into a nested list called `cfg`.
#
# Packages: yaml
# Usage: Rscript scripts/phase_a/01_download_qc.R configs/run_001_E2_HUVEC.yaml
# ============================================================

library(yaml)

args <- commandArgs(trailingOnly = TRUE)
if (length(args) == 0) {
  stop("Usage: Rscript <script.R> <path/to/config.yaml>")
}

config_path <- args[1]
if (!file.exists(config_path)) {
  stop(paste("Config file not found:", config_path))
}

cfg <- yaml::read_yaml(config_path)

# Create results directory for this run
run_dir <- file.path("results", cfg$run_id)
dir.create(run_dir, recursive = TRUE, showWarnings = FALSE)

cat("Loaded config:", cfg$run_id, "\n")
cat("Exposure:", cfg$exposure$compound, cfg$exposure$concentration, cfg$exposure$duration, "\n")
cat("Results directory:", run_dir, "\n")

# ============================================================
# Block 15: Bayesian Colocalization (COLOC)
# ============================================================
# Tests whether hormone GWAS and tissue eQTL signals share
# the same causal variant at each hub gene locus. Computes
# posterior probabilities for five hypotheses (H0-H4). H4
# (shared causal variant) above the config threshold is
# strong evidence for genetic co-regulation. Uses a 500 kb
# window around each gene TSS. Combined with SMR, this
# provides genetic anchoring for the transcriptomic findings.
#
# Packages: coloc
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(coloc)

coloc_cfg <- cfg$phase_b$coloc

# For each hub gene locus:
# result <- coloc.abf(
#   dataset1 = list(
#     beta = gwas_beta, varbeta = gwas_se^2,
#     type = "quant", N = gwas_n, snp = snp_ids
#   ),
#   dataset2 = list(
#     beta = eqtl_beta, varbeta = eqtl_se^2,
#     type = "quant", N = eqtl_n, snp = snp_ids
#   ),
#   p1 = coloc_cfg$prior_p1,
#   p2 = coloc_cfg$prior_p2,
#   p12 = coloc_cfg$prior_p12
# )

# Retain: H4 > coloc_cfg$h4_threshold

# Save: file.path(run_dir, "coloc_results.csv")
cat("COLOC configured. H4 threshold:", coloc_cfg$h4_threshold,
    "| Window:", coloc_cfg$window_kb, "kb\n")

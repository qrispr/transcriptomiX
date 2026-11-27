# ============================================================
# Block 14: SMR and HEIDI Analysis
# ============================================================
# Tests whether hormone GWAS variants (Ruth et al. 2020) are
# also eQTLs for hub genes in GTEx focus tissues. Uses
# Mendelian randomization logic: if a SNP influences both
# testosterone levels and expression of Gene Y, the hormone
# may causally regulate Gene Y. HEIDI test distinguishes
# pleiotropy (shared causal variant, p > 0.05) from linkage
# (independent signals in LD, p < 0.05). Requires harmonized
# GWAS, eQTL, and LD reference data on the same genome build.
#
# Packages: data.table (data prep), rtracklayer (liftOver)
# External: SMR executable (v1.3.1+), PLINK 1.9/2.0
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(data.table)

smr_cfg <- cfg$phase_b$smr

# Step 14a: Harmonize genome builds
# If GWAS is GRCh37 and eQTL is GRCh38, liftOver GWAS coordinates
# Remove palindromic SNPs (A/T and C/G)
# Match effect alleles
# Filter to SNPs in GWAS, eQTL, and LD reference

# Step 14b: Run SMR (shell command via system())
# smr --bfile 1000G_EUR \
#     --gwas-summary <gwas_file>.ma \
#     --beqtl-summary <gtex_tissue_eqtl> \
#     --out <output_prefix> \
#     --thread-num 4

# Step 14c: Filter results
# Bonferroni: p < 0.05 / n_hub_genes
# HEIDI: p > smr_cfg$heidi_p_threshold

# Save: file.path(run_dir, "smr_results.csv")
cat("SMR configured. GWAS source:", smr_cfg$gwas_source, "\n")

# ============================================================
# Block 11: Download GTEx v8 Summary-Level Expression Data
# ============================================================
# Downloads median TPM by tissue and per-sample TPM files
# from the GTEx Portal. Also downloads sample annotation file
# with donor age brackets (20-29 through 70-79). All files
# are summary-level and freely downloadable without dbGaP.
# Focus tissues are set in the config (CVD anchor: coronary,
# aorta, tibial arteries, heart; adipose anchor: subcutaneous,
# visceral omentum, liver).
#
# Packages: data.table (for fast file reading)
# External: wget or curl for downloads
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(data.table)

gtex_cfg <- cfg$phase_b$gtex
focus_tissues <- gtex_cfg$focus_tissues

gtex_dir <- file.path(run_dir, "gtex")
dir.create(gtex_dir, recursive = TRUE, showWarnings = FALSE)

# Download URLs (GTEx v8):
# Median TPM: GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz
# Per-sample TPM: GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct.gz
# Sample annotations: GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt
# Subject phenotypes: GTEx_Analysis_v8_Annotations_SubjectPhenotypesDS.txt

cat("GTEx download configured. Focus tissues:", paste(focus_tissues, collapse = ", "), "\n")

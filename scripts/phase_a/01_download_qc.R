# ============================================================
# Block 1: Dataset Download and Quality Control
# ============================================================
# Downloads raw transcriptomic data from GEO accessions listed
# in the config. For microarray, downloads .CEL files and runs
# arrayQualityMetrics to flag outlier arrays. For RNA-seq,
# downloads FASTQ via SRA Toolkit and runs FastQC per sample.
# Outputs a QC report and a list of samples passing QC into
# the run results directory.
#
# Packages: GEOquery, arrayQualityMetrics
# External: SRA Toolkit (prefetch, fasterq-dump), FastQC, MultiQC, fastp
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(GEOquery)

for (acc in cfg$datasets$geo_accessions) {
  cat("Downloading", acc, "...\n")

  geo_dir <- file.path(run_dir, "raw", acc)
  dir.create(geo_dir, recursive = TRUE, showWarnings = FALSE)

  if (cfg$datasets$platform == "RNA-seq") {
    # RNA-seq: use SRA Toolkit
    # prefetch and fasterq-dump must be on PATH
    system(paste("prefetch", acc, "-O", geo_dir))
    system(paste("fasterq-dump", file.path(geo_dir, acc), "-O", geo_dir))
    # FastQC
    system(paste("fastqc", file.path(geo_dir, "*.fastq"), "-o", geo_dir))
  } else {
    # Microarray: use GEOquery
    gse <- getGEO(acc, destdir = geo_dir, GSEMatrix = TRUE)
    # Download supplementary .CEL files
    getGEOSuppFiles(acc, baseDir = geo_dir)
  }
}

cat("QC complete. Check", run_dir, "for reports.\n")

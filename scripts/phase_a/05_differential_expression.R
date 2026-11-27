# ============================================================
# Block 5: Differential Expression by Perturbation Class
# ============================================================
# Runs standard DE analysis for each perturbation versus its
# matched control. Uses limma for microarray or DESeq2 for
# RNA-seq, as set in the config. Each comparison produces
# log2 fold change and adjusted p-value per gene. These
# become the "direction tags" that annotate each gene with
# its pathway node assignment in later steps.
#
# Comparisons depend on available data:
#   E2 vs vehicle, T/DHT vs vehicle,
#   T+letrozole vs T, T+flutamide vs T,
#   E2+fulvestrant vs E2, PPT vs vehicle, DPN vs vehicle
#
# Packages: limma, DESeq2
# ============================================================

source("scripts/phase_a/00_load_config.R")

de_method <- cfg$phase_a$de_method
fdr <- cfg$phase_a$fdr_threshold
lfc <- cfg$phase_a$log2fc_threshold

if (de_method == "DESeq2") {
  library(DESeq2)
  cat("DE method: DESeq2 | FDR:", fdr, "| log2FC:", lfc, "\n")

  # dds <- DESeqDataSetFromMatrix(countData, colData, design = ~ condition)
  # dds <- DESeq(dds)
  # res <- results(dds, contrast = c("condition", "treated", "vehicle"),
  #                alpha = fdr, lfcThreshold = lfc)

} else if (de_method == "limma") {
  library(limma)
  cat("DE method: limma | FDR:", fdr, "| log2FC:", lfc, "\n")

  # design <- model.matrix(~ 0 + condition, data = coldata)
  # fit <- lmFit(expr_matrix, design)
  # contrast <- makeContrasts(treated - vehicle, levels = design)
  # fit2 <- contrasts.fit(fit, contrast)
  # fit2 <- eBayes(fit2)
  # res <- topTable(fit2, coef = 1, number = Inf, adjust.method = "BH")
}

# Save results: file.path(run_dir, "de_results.csv")
cat("DE analysis configured.\n")

# ============================================================
# Block 7: WGCNA Co-Expression Network Construction
# ============================================================
# Runs WGCNA on the integrated, batch-corrected expression
# matrix. Clusters genes into co-expression modules using
# signed networks. Soft-thresholding power is chosen
# automatically (scale-free topology R-squared target from
# config) or set manually. After module identification,
# computes module eigengenes and correlates them with the
# sample trait matrix (treatment, tissue, perturbation class).
#
# Packages: WGCNA
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(WGCNA)
allowWGCNAThreads()

wgcna_cfg <- cfg$phase_a$wgcna

# Step 7a: Choose soft-thresholding power
# powers <- c(1:20)
# sft <- pickSoftThreshold(datExpr, powerVector = powers, networkType = wgcna_cfg$network_type)
# If wgcna_cfg$soft_power == "auto", pick first power with R^2 > wgcna_cfg$min_rsq

# Step 7b: Build adjacency and TOM
# adjacency <- adjacency(datExpr, power = soft_power, type = wgcna_cfg$network_type)
# TOM <- TOMsimilarity(adjacency)
# dissTOM <- 1 - TOM

# Step 7c: Module detection
# geneTree <- hclust(as.dist(dissTOM), method = "average")
# dynamicMods <- cutreeDynamic(dendro = geneTree, distM = dissTOM,
#                               minClusterSize = wgcna_cfg$min_module_size)

# Step 7d: Merge similar modules
# MEList <- moduleEigengenes(datExpr, colors = dynamicMods)
# merge <- mergeCloseModules(datExpr, dynamicMods, cutHeight = wgcna_cfg$merge_cut_height)
# moduleColors <- merge$colors

# Step 7e: Module-trait correlations
# MEs <- merge$newMEs
# moduleTraitCor <- cor(MEs, traitData, use = "p")
# moduleTraitPvalue <- corPvalueStudent(moduleTraitCor, nSamples)

# Save: module assignments, eigengenes, trait correlations
cat("WGCNA configured. Network type:", wgcna_cfg$network_type, "\n")

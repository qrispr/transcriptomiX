# ============================================================
# Block 9: Steroidogenesis Pathway Gene Overlay
# ============================================================
# Overlays known steroidogenesis pathway genes (enzymes,
# receptors, transporters, transcription factors) onto WGCNA
# modules. Answers three questions: (1) which module do
# steroidogenic enzymes cluster in, (2) do steroidogenesis
# TFs sit with their target enzymes or in regulatory modules,
# (3) are any steroidogenic genes themselves hub genes in
# opposite-direction modules. This step maps the biology onto
# the statistical network structure.
#
# Packages: dplyr
# ============================================================

source("scripts/phase_a/00_load_config.R")

library(dplyr)

# Steroidogenesis gene lists (curated)
steroid_enzymes <- c("CYP11A1", "CYP17A1", "CYP19A1", "HSD3B1", "HSD3B2",
                     paste0("HSD17B", 1:14), "SRD5A1", "SRD5A2", "SRD5A3",
                     "STS", "SULT1E1", "SULT2A1",
                     "AKR1C1", "AKR1C2", "AKR1C3", "AKR1C4",
                     "CYP1A1", "CYP1B1", "CYP3A4")

receptors <- c("AR", "ESR1", "ESR2", "GPER1", "PGR")

transport <- c("SHBG", "ALB", "SLCO1B1", "SLCO1B3")

steroid_tfs <- c("NR5A1", "NR5A2", "GATA4", "GATA6", "NR0B1",
                 "HNF4A", "PPARG", "NFKB1", "RELA", "CREB1",
                 "JUN", "FOS", "SP1")

all_pathway <- c(steroid_enzymes, receptors, transport, steroid_tfs)

# Cross-reference with WGCNA module assignments and kME values
# Identify which pathway genes land in opposite-direction modules
# Flag feed-forward loops (e.g., CYP19A1 + ESR1 co-clustering)

# Save: file.path(run_dir, "pathway_overlay.csv")
cat("Pathway overlay configured.", length(all_pathway), "genes in reference set.\n")

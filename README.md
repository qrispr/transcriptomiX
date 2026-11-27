# transcriptomiX

Versioned pipeline for steroidogenesis hub gene discovery and genomic validation (Chapter 4).

## Structure

```
transcriptomiX/
  configs/              # One YAML per analysis run (the single source of truth)
    example_run.yaml    # Template config with all parameters documented
  scripts/
    phase_a/            # Steps 1-10: GEO transcriptomics, WGCNA, Theory A filtering
      00_load_config.R  # Reads config YAML, creates results dir
      01_download_qc.R  # Download raw data, run QC
      02_normalize.R    # RMA / neqc / vst / TMM+voom
      03_batch_correct.R # ComBat / ComBat-seq / rank-based
      04_sex_verify.R   # XIST and Y-chromosome marker check
      05_differential_expression.R  # limma or DESeq2 per perturbation
      06_pathway_annotate.R  # Direction profiles per gene
      07_wgcna.R        # Co-expression network, module eigengenes
      08_theory_a_filter.R  # Opposite-direction module hub genes
      09_pathway_overlay.R  # Map steroidogenesis genes onto modules
      10_compile_hub_list.R  # Final Phase A hub gene table
    phase_b/            # Steps 11-16: GTEx age trends, SMR, COLOC, convergence
      11_gtex_download.R
      12_age_slopes.R
      13_theory_b_concordance.R
      14_smr.R
      15_coloc.R
      16_convergence_map.R
    generate_run_readme.R  # Auto-generates README from config
  results/              # One subfolder per run (gitignored except READMEs)
  manifest.csv          # Master log: one row per completed run
```

## How to run a new analysis

1. Copy the template config:
   ```
   cp configs/example_run.yaml configs/run_001_E2_HUVEC.yaml
   ```

2. Edit the config with your parameters (exposure, datasets, thresholds).

3. Generate the run README:
   ```
   Rscript scripts/generate_run_readme.R configs/run_001_E2_HUVEC.yaml
   ```

4. Run each step sequentially, passing the config:
   ```
   Rscript scripts/phase_a/01_download_qc.R configs/run_001_E2_HUVEC.yaml
   Rscript scripts/phase_a/02_normalize.R configs/run_001_E2_HUVEC.yaml
   ...
   ```

5. After step 16, the manifest auto-appends a summary row.

6. Commit and tag:
   ```
   git add .
   git commit -m "run_001: E2 in HUVEC, kME>0.7, H4>0.8"
   git tag run_001
   ```

## Versioning logic

Every decision lives in the config YAML, not in script comments or memory. To compare two runs, diff their configs:

```
diff configs/run_001_E2_HUVEC.yaml configs/run_002_T_VSMC.yaml
```

The manifest.csv gives you a searchable one-line summary of every completed run. Git tags let you checkout the exact state that produced any result.

## Dependencies

R packages: yaml, GEOquery, affy, oligo, limma, DESeq2, edgeR, sva, biomaRt, WGCNA, arrayQualityMetrics, coloc, dplyr, tidyr, ggplot2, data.table, rtracklayer

External tools: SMR (v1.3.1+), PLINK 1.9/2.0, STAR or Salmon, Subread (featureCounts), FastQC, MultiQC, fastp, SRA Toolkit, liftOver

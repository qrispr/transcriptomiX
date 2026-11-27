# Pipeline Step Reference Papers

Example papers from the literature for each step of the transcriptomiX pipeline. Papers are split into two categories: **methods papers** (the original tool/method publication) and **applied papers** (studies that used the method in a comparable context). Retrieved from PubMed.

---

## Phase A: GEO Transcriptomic Hub Gene Discovery

### Step 1: GEO Download and QC (01_download_qc.R)

**Methods paper:**
- Davis S, Meltzer PS. GEOquery: a bridge between the Gene Expression Omnibus (GEO) and BioConductor. *Bioinformatics*. 2007;23(14):1846-7. [DOI](https://doi.org/10.1093/bioinformatics/btm254)

**Applied paper:**
- Tsai CA et al. Transcriptomic meta-analysis of multiple sclerosis and its experimental models. *PLoS One*. 2014;9(1):e86643. [DOI](https://doi.org/10.1371/journal.pone.0086643)
  - Downloaded and reanalysed multiple GEO microarray datasets, applied QC filtering, then integrated across studies.

---

### Step 2: Normalization (02_normalize.R)

**Methods paper:**
- Irizarry RA et al. Exploration, normalization, and summaries of high density oligonucleotide array probe level data. *Biostatistics*. 2003;4(2):249-64. [DOI](https://doi.org/10.1093/biostatistics/4.2.249)

**Applied paper:**
- Chen Y et al. Reanalysis of the gene expression profile in chronic pancreatitis via bioinformatics methods. *Eur Rev Med Pharmacol Sci*. 2014;19(31). [DOI](https://doi.org/10.1186/2047-783X-19-31)
  - Applied RMA normalization to GEO Affymetrix data, then ran DE and pathway analysis on the reprocessed expression matrices.

---

### Step 3: Batch Correction (03_batch_correct.R)

**Methods paper:**
- Johnson WE, Li C, Rabinovic A. Adjusting batch effects in microarray expression data using empirical Bayes methods. *Biostatistics*. 2007;8(1):118-27. [DOI](https://doi.org/10.1093/biostatistics/kxj037)
  - The original ComBat paper. Foundational reference for empirical Bayes batch adjustment.

**Applied paper:**
- Fertig EJ et al. Influence of batch effect correction methods on drug induced differential gene expression profiles. *BMC Bioinformatics*. 2019;20(Suppl 17):437. [DOI](https://doi.org/10.1186/s12859-019-3028-6)
  - Compared ComBat, limma removeBatchEffect, and SVA across drug-treatment transcriptomic datasets.

---

### Step 4: Sex Verification (04_sex_verify.R)

**Methods paper:**
- Staedtler F et al. Robust and tissue-independent gender-specific transcript biomarkers. *Biomarkers*. 2013;18(5):436-44. [DOI](https://doi.org/10.3109/1354750X.2013.811538)
  - Identified and validated a five-gene panel (RPS4Y1, EIF1AY, DDX3Y, KDM5D, XIST) for sex prediction across tissues and platforms. Direct methodological precedent for the sex verification step.

---

### Step 5: Differential Expression (05_differential_expression.R)

**Methods paper:**
- Ritchie ME et al. limma powers differential expression analyses for RNA-sequencing and microarray studies. *Nucleic Acids Res*. 2015;43(7):e47. [DOI](https://doi.org/10.1093/nar/gkv007)

**Applied paper:**
- Wang Z et al. Computational gene expression profiling in the exploration of biomarkers, non-coding functional RNAs and drug targets in tendinopathy. *J Biomol Struct Dyn*. 2021;39(13):4858-70. [DOI](https://doi.org/10.1080/07391102.2020.1850360)
  - Used limma for DE on reprocessed GEO datasets, identified hub genes, then validated via pathway enrichment.
- Li F et al. Molecular insights into sarcopenia: ferroptosis-related genes as diagnostic and therapeutic targets. *J Biomol Struct Dyn*. 2024. [DOI](https://doi.org/10.1080/07391102.2023.2298390)
  - Applied limma DE on steroid-related treatment datasets, combined with WGCNA for hub gene identification.

---

### Step 6: Pathway Annotation (06_pathway_annotate.R)

**Applied paper:**
- Hatzirodos N et al. Transcriptome Reveals Granulosa Cells Coping through Redox, Inflammatory and Metabolic Mechanisms under Acute Heat Stress. *Cells*. 2022;11(9):1443. [DOI](https://doi.org/10.3390/cells11091443)
  - Annotated DE genes against steroidogenesis pathway nodes, tracked direction profiles per treatment condition.
- Patel SS et al. Identification and molecular characterization of genes modulating progression of an oocyte from M-I to M-II stage. *Am J Reprod Immunol*. 2024;91(2):e13825. [DOI](https://doi.org/10.1111/aji.13825)
  - Mapped DE results onto steroidogenesis pathway gene annotations to build direction profiles.

---

### Step 7: WGCNA (07_wgcna.R)

**Methods paper:**
- Langfelder P, Horvath S. WGCNA: an R package for weighted correlation network analysis. *BMC Bioinformatics*. 2008;9:559. [DOI](https://doi.org/10.1186/1471-2105-9-559)
  - The original WGCNA R package paper.

**Applied paper:**
- Chen J et al. Weighted gene Co-expression network analysis (WGCNA) reveals a set of hub genes related to chlorophyll biosynthesis under environmental pollutant stress. *Environ Pollut*. 2022;306:119360. [DOI](https://doi.org/10.1016/j.envpol.2022.119360)
  - Full WGCNA workflow on treatment response data with signed network, soft-power selection, module-trait correlation, and kME-based hub identification.

---

### Step 8: Theory A Filtering (08_theory_a_filter.R)

**Methods paper:**
- Langfelder P, Horvath S. When is hub gene selection better than standard meta-analysis? *PLoS One*. 2013;8(4):e61505. [DOI](https://doi.org/10.1371/journal.pone.0061505)
  - Demonstrates kME-based hub selection outperforms naive DE meta-analysis for identifying biologically meaningful genes across studies. Directly supports the kME filtering rationale.

**Applied paper:**
- Osei Bonsu JA et al. Using weighted gene co-expression network analysis (WGCNA) to identify the hub genes related to hypoxic adaptation in yak. *Genes Genomics*. 2021;43(10):1153-68. [DOI](https://doi.org/10.1007/s13258-021-01137-5)
  - Applied kME thresholding to filter hub genes from treatment-associated modules.

---

### Step 9: Steroidogenesis Pathway Overlay (09_pathway_overlay.R)

**Applied paper:**
- Patel SS et al. Identification and molecular characterization of genes modulating progression of an oocyte from M-I to M-II stage. *Am J Reprod Immunol*. 2024;91(2):e13825. [DOI](https://doi.org/10.1111/aji.13825)
  - Mapped identified hub genes back to curated steroidogenesis pathway components (enzymes, receptors, transporters).

---

### Step 10: Compile Hub Gene List (10_compile_hub_list.R)

No single standalone reference. This step consolidates outputs from steps 5 through 9, so the references above apply collectively.

---

## Phase B: GTEx Age Trends + SMR/COLOC Genetic Anchoring

### Step 11-12: GTEx Download and Age Slopes (11_gtex_download.R, 12_age_slopes.R)

**Methods paper:**
- GTEx Consortium. The GTEx Consortium atlas of genetic regulatory effects across human tissues. *Science*. 2020;369(6509):1318-30. [DOI](https://doi.org/10.1126/science.aaz1776)

**Applied papers:**
- Yang J et al. Improved Human Age Prediction by Using Gene Expression Profiles From Multiple Tissues. *Front Genet*. 2020;11:1025. [DOI](https://doi.org/10.3389/fgene.2020.01025)
  - Used GTEx expression data across tissues to model age-associated expression changes.
- de Vries PS et al. Lung tissue gene-expression signature for the ageing lung in COPD. *Thorax*. 2018;73(5):466-68. [DOI](https://doi.org/10.1136/thoraxjnl-2017-210074)
  - Computed age-associated expression slopes per gene in GTEx lung tissue.
- Baek S, Dalal Y, Sikder S. Protocol for quantifying age-associated centromere gene expression across human tissues using GTEx datasets. *STAR Protoc*. 2026;7(4):104985. [DOI](https://doi.org/10.1016/j.xpro.2026.104985)
  - Step-by-step protocol for age-dependent expression analysis in GTEx using standardized DE pipelines.

---

### Step 13: Theory B Concordance (13_theory_b_concordance.R)

No single standalone reference. This step tests concordance between GEO perturbation direction and GTEx age-trajectory direction, which is an internal validation logic specific to the Endocrine First-Hit framework. The GTEx aging references above (Step 12) and the WGCNA hub selection references (Step 8) provide the upstream methodological grounding.

---

### Step 14: SMR + HEIDI (14_smr.R)

**Methods paper:**
- Zhu Z et al. Integration of summary data from GWAS and eQTL studies predicts complex trait gene targets. *Nat Genet*. 2016;48(5):481-7. [DOI](https://doi.org/10.1038/ng.3538)
  - The original SMR + HEIDI method paper. Foundational reference for integrating GWAS and eQTL summary data.

**Applied papers:**
- Gao K et al. Multi-omics Mendelian randomization integrating GWAS, eQTL and pQTL data revealed GSTM4 as a potential causal target for migraine. *J Headache Pain*. 2024;25(1):120. [DOI](https://doi.org/10.1186/s10194-024-01828-w)
  - Full SMR + HEIDI workflow with eQTL integration, applied to a complex trait GWAS.
- Li N et al. Oxidative stress gene expression, DNA methylation, and gut microbiota interaction trigger Crohn's disease: a multi-omics Mendelian randomization study. *BMC Med*. 2023;21:179. [DOI](https://doi.org/10.1186/s12916-023-02878-8)
  - Applied SMR with HEIDI filtering to identify genes whose expression mediates GWAS associations, then integrated with COLOC for confirmation.

---

### Step 15: COLOC (15_coloc.R)

**Methods paper:**
- Giambartolomei C et al. A Bayesian framework for multiple trait colocalization from summary association statistics. *Bioinformatics*. 2018;34(15):2538-45. [DOI](https://doi.org/10.1093/bioinformatics/bty147)
  - The coloc2/multi-trait extension paper. For the original single-trait version, see Giambartolomei et al. 2014 (PMID: 24383934).

**Applied paper:**
- Giambartolomei C et al. Bayesian Genetic Colocalization Test of Two Traits Using coloc. *Curr Protoc*. 2022;2(12):e627. [DOI](https://doi.org/10.1002/cpz1.627)
  - Step-by-step protocol for running coloc, interpreting H4 posteriors, sensitivity checks.

---

### Step 16: Convergence Tiering (16_convergence_map.R)

**Applied papers:**
- Gao X et al. Cross-trait mapping of shared susceptibility across inflammatory bowel disease and spondyloarthropathies. *J Transl Med*. 2026;24(1). [DOI](https://doi.org/10.1186/s12967-026-08326-4)
  - Combined transcriptomic, SMR, and COLOC evidence into convergent tiers to prioritize shared causal genes.
- Li N et al. Oxidative stress gene expression, DNA methylation, and gut microbiota interaction trigger Crohn's disease: a multi-omics Mendelian randomization study. *BMC Med*. 2023;21:179. [DOI](https://doi.org/10.1186/s12916-023-02878-8)
  - Multi-layer evidence integration: SMR + COLOC + expression + methylation, with final gene prioritization across evidence streams.

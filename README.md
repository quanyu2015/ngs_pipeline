# Standardised binning Pipeline Metagenomics/Metatranscriptomics

We use data plumbing software Luigi and container software Docker to chain the necessary processing steps together:

![workflow](/img/workflow_pipeline.png)

1. Preprocessing 
	a. Read Quality Report (FastQC 0.11.5)
	b. (IllumiProcessor 2.0.7 + Trimmomatic 0.32)

2. RNA depletion [Optional - For whole metatranscriptome only SortMeRNA 2.1]

3. Sequence Homology Search (Diamond 0.7.12)

4. Taxonomic and Functional Binning (MEGAN: Ultimate_unix_6_3_9)

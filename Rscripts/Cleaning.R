#Dataset

#libraries
library(readr)
library(ggplot2)
library(dplyr)
library(BiocManager)
library(patchwork)

#Load and clean

proteome <- read.delim2("source_data/CPTAC_GBM_proteome_mssm_per_gene.txt")
phosprot <- read.delim2("source_data/CPTAC_GBM_phosphoproteome_mssm_site.txt")
genome <- read.delim2("source_data/CPTAC_GBM_rnaseq_fpkm_uq_log2.txt")
sampInfo <-read.delim2("source_data/CPTAC_GBM_CLI.txt")
mutations<- read.delim("source_data/somatic_mutations.maf.gz")
GBM_meta<-read.delim("source_data/GBM_meta.txt")

# Sample Info

sampInfo<-sampInfo[-1,]
mutations<-mutations[,c(-2,-3)]
GBM_meta<-GBM_meta[-1,]

# Proteomic Data cleaning

# First column contains the gene symbols. 
# Add gene symbols and rownames and remove first column.
rownames(proteome)<-proteome[,1]
proteome<-proteome[,-1]

rownames(phosprot)<-phosprot[,1]
phosprot<-phosprot[,-1]

# Genomic data cleaning

rownames(genome)<-genome[,1]
genome<-genome[,-1]

# Mutations cleaning

write.csv(sampInfo, "derived_data/sampInfo.csv", row.names = FALSE)
write.csv(GBM_meta,"derived_data/GBM_metainfo.csv", row.names = FALSE)


#Dataset

#libraries
library(readr)
library(ggplot2)
library(dplyr)
library(gtsummary)
library(BiocManager)
library(patchwork)

#Load and clean

proteome <- read.delim2("HS_CPTAC_GBM_proteome_mssm_per_gene.txt")
phosprot <- read.delim2("HS_CPTAC_GBM_phosphoproteome_mssm_site.txt")
genome <- read.delim2("HS_CPTAC_GBM_rnaseq_fpkm_uq_log2.txt")
sampInfo <-read.delim2("HS_CPTAC_GBM_CLI.txt")
mut_bin <- read.delim2("GBM_somatic_mutation_gene_level_binary.txt")
mutations<- read.delim("somaticwrapper_all_cases_filtered.v4.0.20200430.maf.gz")
GBM_meta<-read.delim("GBM_meta.txt")

sampInfo<-sampInfo[-1,]
mutations<-mutations[,c(-2,-3)]
GBM_meta<-GBM_meta[-1,]

# First column contains the gene symbols. 
# Add gene symbols and rownames and remove first column.
rownames(proteome)<-proteome[,1]
proteome<-proteome[,-1]

rownames(phosprot)<-phosprot[,1]
phosprot<-phosprot[,-1]

rownames(genome)<-genome[,1]
genome<-genome[,-1]


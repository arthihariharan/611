# Mutation Plots

#Libraries

library(dplyr)
library(ggplot2)
library(patchwork)
library(knitr)
library(kableExtra)
library(ComplexHeatmap)
library(BiocManager)
library(maftools)
library(GenVisR)
library(readr)

GBM_meta <- read.csv("derived_data/GBM_metainfo.csv")

# Subset the GBM data frame to rows 10 to 17 to choose only mutation columns
subset_data <- GBM_meta[,12:17]
subset_data <- subset_data %>% mutate_all(as.numeric)

# Calculating the sum of each column in the subset
row_sums <-rowSums(subset_data)

sum_table <- as.data.frame(table(row_sums))

# Rename the columns
colnames(sum_table) <- c("No.of.Mutations", "Freq")

# Calculating the sum of each column in the subset
col_sums <-colSums(subset_data)

col_sums<-as.data.frame(col_sums)
col_sums$genes <- rownames(col_sums)
rownames(col_sums)<-NULL
colnames(col_sums)<-c("Freq","Genes")
col_sums<-col_sums[,c("Genes","Freq")]
col_sums$Genes <- gsub("_mutation", "", col_sums$Genes)

# Plot

png("Figures/Gene_counts.png")
ggplot(data = col_sums, aes(x = Genes, y = Freq)) +
  geom_bar(stat = "identity", aes(fill=Genes), show.legend = F) +
  labs(title = "Gene Counts",
       x = "Genes",
       y = "Counts") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

#----------------------------
#Data
mutations<- read.delim("source_data/somatic_mutations.maf.gz")
mutations$Variant_Classification <- ifelse( mutations$Variant_Classification=="Splice_Region", "Splice_Site",mutations$Variant_Classification)

#Genes
genes <- c("ATRX", "PIK3CA", "RB1", "TP53", "EGFR", "PTEN")

#Subset
idx1<-which(mutations$Hugo_Symbol %in% genes)
mutation_subset <- mutations[idx1,]

#----------------------------

pClass <-mutation_subset %>%
  group_by(Hugo_Symbol, Variant_Classification) %>%
  tally() %>%
  ggplot(aes(x = Variant_Classification, y = n, fill = Variant_Classification)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ Hugo_Symbol, scales = "free_y") +  # Use facet_wrap for separate plots by Variant_Classification
  labs(title = "Variant Classification by Gene", x = "Gene Symbol", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

pType<- mutation_subset %>% 
  group_by(Hugo_Symbol, Variant_Type) %>% 
  tally()  %>%
  arrange(desc(n)) %>% 
  ggplot(aes(x = Variant_Type, y = n, fill = Variant_Type)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ Hugo_Symbol, scales = "free_y") +  # Use facet_wrap for separate plots by Variant_Classification
  labs(title = "Variant Type by Gene", x = "Gene Symbol", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

png("Figures/Mutation_gene.png", height = 500, width = 1500)
pClass + pType
dev.off()

#------------------------------------------------------------------

#Waterfall Plot
png("Figures/Mutation_waterfall.png", height = 1000, width = 2000)
waterfall(mutation_subset,
          plotGenes=genes,
          rmvSilent = F, 
          mainXlabel = T,
          mainGrid = T,
          main_geneLabSize = 10,
          mainDropMut = T,
          #mainRecurCutoff = 0.2,
          mainLabelSize = 3,
          plotMutBurden = T,
          plot_proportions = T)
dev.off()



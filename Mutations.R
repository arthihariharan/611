# Mutations dataset

#libraries
library(ggplot2)
library(dplyr)

GBM_meta <-read.csv("GBM_metainfo.csv")

# Subset the data frame to rows 10 to 17
subset_data <- GBM_meta[,12:17]

subset_data <- subset_data %>% mutate_all(as.numeric)

# Calculating the sum of each column in the subset
col_sums <-rowSums(subset_data)

# Calculating the sum of each column in the subset
col_sums <-colSums(subset_data)

col_sums<-as.data.frame(col_sums)
col_sums$genes <- rownames(col_sums)
col_sums$genes <- gsub("_mutation", "", col_sums$genes)

# Plot

png("Mutations.png")
ggplot(data = col_sums, aes(x = genes, y = col_sums)) +
  geom_bar(stat = "identity", aes(fill=genes)) +
  labs(title = "Gene Counts",
       x = "Genes",
       y = "Counts") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))
dev.off()


#Demographics

library(ggplot2)
library(dplyr)
library(patchwork)

sampInfo <- read.csv("sampInfo.csv")
GBM_meta <- read.csv("GBM_metainfo.csv")
#Age distribution by gender

p2<-sampInfo %>% ggplot(aes(as.numeric(age),gender)) +
  geom_boxplot(aes(fill=gender)) +
  labs(title= "Age distribution", xlab = "Gender", ylab = "Age") +
  coord_flip() +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

# Country of origin
p3<-sampInfo %>%
  filter(!is.na(country_of_origin)) %>%
  ggplot(aes(country_of_origin)) +
  geom_bar(aes(fill =country_of_origin)) +
  labs(title = "Country of Origin", xlab ="Countries") + 
  theme(axis.text.x=element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

# Smoking status

p4<-GBM_meta %>% 
  filter(!is.na(Tobacco_smoking_history)) %>%
  ggplot(aes(Tobacco_smoking_history)) +
  geom_bar(aes(fill= Tobacco_smoking_history)) +
  labs(title = "Smoking Status") +
  theme(axis.text.x=element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))
  
png("Demographics.png", height = 500, width = 800)
p2+p3+p4
dev.off()
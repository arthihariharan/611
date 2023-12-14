#Demographics

library(ggplot2)
library(dplyr)
library(patchwork)

sampInfo <- read.csv("derived_data/sampInfo.csv")
GBM_meta <- read.csv("derived_data/GBM_metainfo.csv")

# Age distribution by gender

p2<-sampInfo %>% ggplot(aes(as.numeric(age),gender)) +
  geom_boxplot(aes(fill=gender), show.legend = F) +
  labs(title= "Age distribution", x = "Gender", y = "Age") +
  coord_flip() +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

# Country of origin

p3 <- sampInfo %>%
  filter(!is.na(country_of_origin)) %>% 
  group_by(country_of_origin) %>%
  tally() %>%
  ggplot(aes(x = country_of_origin, y = n)) +  
  geom_bar(aes(fill = country_of_origin), stat = "identity", show.legend = F) +
  labs(title = "Country of Origin", x = "Countries", y = "Count") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

# Smoking status

p4 <- GBM_meta %>%
  filter(!is.na(Tobacco_smoking_history)) %>% 
  group_by(Tobacco_smoking_history) %>%
  tally() %>%
  ggplot(aes(x = Tobacco_smoking_history, y = n)) +  
  geom_bar(aes(fill= Tobacco_smoking_history),stat = "identity", show.legend = F) +
  labs(title = "Proportion of smokers and Non-smokers", x = "Smoking status", y = "Count") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

png("Figures/Demographics.png", height = 500, width = 800)
p2+p3+p4
dev.off()

```{r demo, fig.align='center', fig.height= 4, fig.width= 6}

#Age distribution by gender

p2<-sampInfo %>% ggplot(aes(as.numeric(age),gender)) +
  geom_boxplot(aes(fill=gender), show.legend = F) +
  labs(title= "Age distribution", x = "Gender", y = "Age") +
  coord_flip() +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

# Country of origin

p3 <- sampInfo %>%
  filter(!is.na(country_of_origin)) %>% 
  group_by(country_of_origin) %>%
  tally() %>%
  ggplot(aes(x = country_of_origin, y = n)) +  
  geom_bar(aes(fill = country_of_origin), stat = "identity", show.legend = F) +
  labs(title = "Country of Origin", x = "Countries", y = "Count") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

# Smoking status

p4 <- GBM_meta %>%
  filter(!is.na(Tobacco_smoking_history)) %>% 
  group_by(Tobacco_smoking_history) %>%
  tally() %>%
  ggplot(aes(x = Tobacco_smoking_history, y = n)) +  
  geom_bar(aes(fill= Tobacco_smoking_history),stat = "identity", show.legend = F) +
  labs(title = "Proportion of smokers and Non-smokers", x = "Smoking status", y = "Count") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

p2 + p3 + p4

```
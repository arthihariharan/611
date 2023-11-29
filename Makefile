# Define the targets and dependencies

all: Mutations.png Demographics.png

# Create Figure showing demographics of the dataset
#cleanin.R has Data cleaning and Demographics_plot.R has script has making figure
Demographics.png: Cleaning.R Demographics_plot.R
	Rscript Cleaning.R
	Rscript Demographics_plot.R
	
# Create figure to see which mutations are prevalent
#Mutations.R has number of mutations in each gene
Mutations.png: Cleaning.R Mutations.R
	Rscript Cleaning.R
	Rscript Mutations.R
	
# Dimensionality Reduction

Clustering.html: Cleaning.R Clustering_Homework.Rmd
	Rscript Cleaning.R
	Rscript -e "rmarkdown::render('Clustering_Homework.Rmd')"
	



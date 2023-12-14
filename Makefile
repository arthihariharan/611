.PHONY: clean

# Define the targets and dependencies

clean:
	rm -f *.png
	rm -f *.html
	rm -f Figures/*.png
	rm -f derived_data/
	
all: Report.html \
		Mutation_gene.png \
		Mutation_waterfall.png \
		Gene_counts.png \
		Demographics.png \
		Report.html

# Final Project Report

Report.html: Rscripts/Cleaning.R \
						Rscripts/Mutation_plots.R \
						Rscripts/Demographics_plot.R \
						Final_report.Rmd
	Rscript Rscripts/Cleaning.R
	Rscript Rscripts/Demographics_plot.R
	Rscript Rscripts/Mutation_plots.R
	Rscript -e "rmarkdown::render('Final_report.Rmd')"

# Create Figure showing demographics of the dataset
#cleaning.R has Data cleaning and Demographics_plot.R has script has making figure
Demographics.png: Rscripts/Cleaning.R Rscripts/Demographics_plot.R
	Rscript Rscripts/Cleaning.R
	Rscript Rscripts/Demographics_plot.R
	
# Create figure to analyse mutations
#Mutation_plots.R has script for making plots
Gene_counts.png:  Rscripts/Cleaning.R  Rscripts/Mutation_plots.R
	Rscript  Rscripts/Cleaning.R
	Rscript  Rscripts/Mutation_plots.R
	
Mutation_gene.png:  Rscripts/Cleaning.R  Rscripts/Mutation_plots.R
	Rscript  Rscripts/Cleaning.R
	Rscript  Rscripts/Mutation_plots.R
	
Mutation_waterfall.png:  Rscripts/Cleaning.R  Rscripts/Mutation_plots.R
	Rscript  Rscripts/Cleaning.R
	Rscript  Rscripts/Mutation_plots.R
	
Pathways.png:  Rscripts/Cleaning.R  Rscripts/Mutation_plots.R
	Rscript  Rscripts/Cleaning.R
	Rscript  Rscripts/Mutation_plots.R
	
# Dimensionality Reduction

Clustering.html:  Rscripts/Cleaning.R Clustering_Homework.Rmd
	Rscript  Rscripts/Cleaning.R
	Rscript -e "rmarkdown::render('Clustering_Homework.Rmd')"
	
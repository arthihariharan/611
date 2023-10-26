FROM rocker/rstudio

################
#install linux deps
################

RUN apt-get update -y && \
	apt-get install -y \
			curl

################
#install R packages
################

# Install additional R packages
RUN R -e "install.packages('readr')"
RUN R -e "install.packages('gtsummary')"
RUN R -e "install.packages('ggplot2')"
RUN R -e "install.packages('dplyr')"

# Install Bioconductor packages using BiocManager
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('maftools')"

# Install patchwork package from CRAN
RUN R -e "install.packages('patchwork')"


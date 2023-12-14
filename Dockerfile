FROM rocker/verse

################
# Set the working directory
################

WORKDIR /home/rstudio/work

################
#install linux dependencies
################

RUN apt-get update -y && \
	apt-get install -y \
			curl
			
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev

################
#install R packages
################

# Install additional R packages from CRAN
RUN R -e "install.packages('readr')"
RUN R -e "install.packages('ggplot2')"
RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('patchwork')"
RUN R -e "install.packages('kableExtra')"
RUN R -e "install.packages('pheatmap')"
RUN R -e "install.packages('R.utils')"
RUN R -e "install.packages('stringr')"

# Install Bioconductor packages using BiocManager
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('remotes')"
RUN R -e "BiocManager::install('PoisonAlien/maftools')"
RUN R -e "BiocManager::install('ComplexHeatmap')"
RUN R -e "remotes::install_github('griffithlab/GenVisR')"

# Install Bioconductor packages
#ADD rpackages.R /tmp/
#RUN R -f /tmp/rpackages.R && rm -r /tmp/rpackages.R

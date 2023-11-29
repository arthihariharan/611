Hi, This is my 611 Data Science Project. 

I am interested in analysing the proteome and genomic profile in Glioblastoma cancer.

The dataset used for this project is the CPTAC Gliobastoma cohort. 

There are 7 files with information about proteome, phosphoproteome, Genome, Mutations, Survival and Clinical information. 

The datasets used here can be downloaded from https://www.linkedomics.org/data_download/CPTAC-GBM/. The proteome data can also be found in Proteomics Data Commons (PDC).

Instructions to build the docker file:

1. Clone the repository using the URL.
2. Build the docker using the command "docker build . -t 611"
3. Run the docker container using "docker run "docker run -v $(pwd):/home/rstudio/work -p 8787:8787 -it 611"
4. The Makefile is used to create the images.
	To create a figure describing the demographics run "make demographics.png"
	To create a figure for the prevalence of mutations run "make mutations.png"




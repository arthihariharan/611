Hi, This is my BIOS611 Data Science Project. 

I am interested in analysing the proteome and genomic profile in Glioblastoma cancer patients.

The dataset used for this project is the CPTAC Gliobastoma cohort. 

There are 7 files with information about proteome, phosphoproteome, Genome, Mutations, Survival and Clinical information. 

The datasets used here can be downloaded from https://www.linkedomics.org/data_download/CPTAC-GBM/. The proteome data can also be found in Proteomics Data Commons (PDC).

Instructions to build the docker file:

1. Clone the repository in git bash using the repository URL.

```{bash}
git clone https://github.com/arthihariharan/611.git
```

2. Build the docker using the command "docker build . -t 611"

In a new terminal/window build the docker container with image name "611". 

```{bash}
docker build . -t 611
```

3. Run the docker container

For Mac/terminal, use the following command to run the container

```{bash}
docker run "docker run -v $(pwd):/home/rstudio/work -p 8787:8787 -it 611"
```

For Powershell, use the following command to run the container

```{bash}
docker run "docker run -v ${pwd}:/home/rstudio/work -p 8787:8787 -it 611"
```

Once the container is built and run, open the rstudio container image in a web browser. 
Type localhost:8787 in a browser window. 
Use "rstudio" as username and password generated in the terminal from previous step.

Once you are into the rstudio docker container cd into the work directory using terminal interface. 

```{bash}
cd work
ls
```

`ls` command should list all the files in the repository, including a Dockerfile and Makefile.

4. The Makefile is used to create the images.

	To create a figure describing the demographics run "make Demographics.png"
	
```{bash}
make Demographics.png
```

 To create a figure for the prevalence of mutations run "make Mutations.png"

```{bash}
make Mutations.png
```

  To run all the scripts in the Makefile
  
```{bash}
make all
```
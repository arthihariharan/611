===========================================================================

# BIOS 611 Final Project

------------------------------------------------------------

## Exploring CPTAC Glioblastoma dataset

------------------------------------------------------------


Hi, This is my BIOS611 Data Science Project. 

I am interested in analysing the mutational and genomic profile of Glioblastoma cancer patients.

The dataset used for this project is the CPTAC Gliobastoma cohort. 

The CPTAC dataset contains information about proteome, phosphoproteome, genome, mutations, survival and clinical information. I use the genomic, mutations and clinical information in my analysis.

The datasets used here can be downloaded from https://www.linkedomics.org/data_download/CPTAC-GBM/. 

------------------------------------------------------------

## Usage Instructions 

------------------------------------------------------------

Instructions to build the docker file:


#### 1. Clone the repository 

Clone the repository in git bash using the repository URL.

```
git clone https://github.com/arthihariharan/611.git
```


#### 2. Build a docker image 

In a new terminal/window build the docker container using the docker build command with image name.
For example, to build an image named 611 use the following command:

```
docker build . -t 611
```


#### 3. Run the docker container

For Mac/terminal, use the following command to run the container

```
docker run "docker run -v $(pwd):/home/rstudio/work -p 8787:8787 -it 611"
# Replace 611 with the image name used to build the container
```

For Powershell, use the following command to run the container

```
docker run "docker run -v ${pwd}:/home/rstudio/work -p 8787:8787 -it 611"
# Replace 611 with the image name used to build the container
```


#### 4. Running Rstudio Docker container

Once the container is built and run, open the rstudio container image in a web browser. 

Type http://localhost:8787  in a browser window. 
Use "rstudio" as username and password generated in the terminal from previous step.
This Rstudio image should have the necessary libraries and dependencies required for this project.

Once you are into the rstudio docker container set the 'work' directory as working directory using terminal interface. 

```
cd work
ls
```

`ls` command should list all the files in the repository, including a Dockerfile and Makefile.


#### 5. Makefile

The Makefile is used to create the report and images. Please see the makefile for information about the relationship between the scripts and outputs. 


  To create the final report run "make Report.html"

```
make Report.html
```
  
  To create a figure describing the demographics run "make Demographics.png"
	
```
make Demographics.png
```

 To create a figure for the prevalence of mutations run "make Mutations.png"

```
make Mutations.png
```

  To run all the scripts in the Makefile
  
```
make all
```

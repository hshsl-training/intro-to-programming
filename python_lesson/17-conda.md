---
title: Installing Bioinformatics Packages
teaching: 10
exercises: 5
questions:
- "How do I use Bioconda and other package repositories?"
objectives:
- "Learn about using Python packages and Software for Bioinformatics"
- "Add a channel to conda for installing bioinformatics packages"
keypoints:
- "Bioconda is the ideal place to find bioinformatics software for Python to install on your computer"
- "Packge managers make updating software easier than one off software installations"
---

So far we have seen the fundamentals of using Python as well as libraries for cleaning, analyzing and visualizing data like Matplotlib and NumPy using Python. When you hear about Python being used for Bioinformatics or Machine Learning however much of the time doing that work requires loading and using software developed with Python and other programming languages. When you are considering expanding your analytical repertoire to using these packages you are faced with a decision. Will I download this software from the developers website or will I use a package manager. There are tremendous benefits to using package managers. The most important benefit is ease of installation of the software as well as updating software that has been installed using a package manager. One important channel/package manager to familiarize yourself with is [Bioconda](https://bioconda.github.io/user/install.html) which is part of the [Conda](https://docs.conda.io/en/latest/) open-source package management system and environment management system. 

## Getting Started

**Bioconda supports only 64-bit Linux and Mac OS.** this means folks on Windows will need either a virtual machine running Linux or have the Windows Subsystem for Linux installed on their computer to use Bioconda.

The first thing required to install Bioconda packages is to have Conda installed. If you have an Anaconda Python installation, you already have Conda. Otherwise, the best way to install it is with the Miniconda package. The Python 3 version is recommended.

### Check your installation

To check your installation of Conda run: 

~~~
$ conda --version
~~~
{: .language-shell}

You should see an output such as this: 
~~~
conda 4.10.3
~~~
{: .output}

### Installing Conda

If you dont see that output you can install Conda on your platform with these commands according to Conda [documentation](https://bioconda.github.io/user/install.html)

On MacOS run:
~~~
$ curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
sh Miniconda3-latest-MacOSX-x86_64.sh
~~~
{: .language-shell}

On Linux, run:
~~~
$ curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh
~~~
{: .language-shell}

Follow the instructions in the installer. If you encounter problems, refer to the **[Miniconda](https://conda.io/en/latest/miniconda.html)** documentation. 

## Setting up channels

After installing conda you will need to add the bioconda channel as well as the other channels bioconda depends on. It is important to add them in this order so that the priority is set correctly (that is, conda-forge is highest priority).

The [conda-forge](https://conda-forge.org/) channel contains many general-purpose packages not already found in the defaults channel.

~~~
$ conda config --add channels defaults
$ conda config --add channels bioconda
$ conda config --add channels conda-forge
~~~
{: .language-shell}

* conda-forge: Most dependencies (numpy, scipy, zlib, CRAN packages, etc.)

* bioconda: Most bioinf packages (salmon, STAR, samtools, DESeq2, etc.)

* defaults: Packages built by Anaconda Inc.

## Finding Packages

* Search https://anaconda.org

* Search Google for package name + bioconda

* Use `conda search`

~~~
$ conda search pysam
~~~
{: .language-shell}

The output will show this:

~~~
# Name                       Version           Build  Channel             
[...]
pysam                       0.16.0.1  py37h3ee3bc3_1  bioconda            
pysam                       0.16.0.1  py37h3ee3bc3_2  bioconda            
pysam                       0.16.0.1  py37h505b978_3  bioconda            
pysam                       0.16.0.1  py38h4ebacbe_3  bioconda            
pysam                       0.16.0.1  py38hb3e8b06_1  bioconda            
pysam                       0.16.0.1  py38hb3e8b06_2  bioconda            
pysam                       0.16.0.1  py39h56703ae_3  bioconda 
~~~
{: .output}

* Packages have versions, build numbers, build hashes/strings
  * Build hashes include dependency information

* Bioconda packages are also listed at <http://bioconda.github.io/conda-package_index.html>

> ## How to find recent versions of bioconda packages?
>
> What are the most recent versions of samtools and Snakemake?
>
> > ## Solution
> >
> > To accomplish this use the `conda search` command with the `package name` then pipe the results to `tail -n1` since the most recent version
> > of the packages always appear at the end of the output from `conda search` .
> >
> > ~~~
> > $ conda search samtools | tail -n1
> > ~~~
> > {: .language-shell}
> >
> >
> > ~~~
> > samtools                        1.13      h7596a89_0  bioconda 
> > ~~~
> > {: .output}
> >
> >
> > ~~~
> > $ conda search snakemake | tail -n1
> > ~~~
> > {: .language-shell}
> >
> > ~~~
> > snakemake                      6.7.0      hdfd78af_0  bioconda
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}

## Install packages

After browsing the packages to see what’s available and knowing bioconda is now enabled, any packages on the bioconda channel can be installed into the current conda environment:

~~~
$ conda install bwa
~~~
{: .language-shell}

## Updating and checking out whats installed

To check all the conda packages installed on your system:

~~~
$ conda list
~~~
{: .language-shell}

~~~
# packages in environment at /Users/jpcourneya/miniconda3:
#
# Name                    Version                   Build  Channel
appnope                   0.1.2            py38h50d1736_1    conda-forge
argon2-cffi               20.1.0           py38h96a0964_2    conda-forge
async_generator           1.10                       py_0    conda-forge
attrs                     20.3.0                   pypi_0    pypi
backcall                  0.2.0              pyh9f0ad1d_0    conda-forge
[...]
trimmomatic               0.39                 hdfd78af_2    bioconda
urllib3                   1.26.6             pyhd8ed1ab_0    conda-forge
wcwidth                   0.2.5              pyh9f0ad1d_2    conda-forge
webencodings              0.5.1                    pypi_0    pypi
wheel                     0.36.2             pyhd3deb0d_0    conda-forge
~~~
{: .output}

To update all your package, on some kind of routine you'd type:

~~~
$ conda update -all
~~~
{: .language-shell}


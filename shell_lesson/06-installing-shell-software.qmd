---
title: "Installing Shell Software"
teaching: 10
exercises: 5
questions:
- How can I install shell software?
- How can I run this software once its installed
objectives:
- Install software using the shell
- Run the software.
keypoints:
- Each operating system has specific criteria for installing command line software
  and not all systems support specific command line tools.
- You can use bash commands in addition to command line software in the shell to work
  with genomic data without having to access a graphical user interface making working
  with a large amount of files and data more accesible.
---

# Overview

We have gone over many ways that you can use the shell to control your computer using commands entered with a keyboard instead of controlling graphical user interfaces (GUIs) with a mouse/keyboard combination.

One of the main reasons we spend so much time learning all these fundamentals is to be able to apply them in practice. One way which you can apply these is in combination with running software from the shell. So far all the commands you have been working with are part of BASH. There are programs that are designed to be run from the shell specifically. The following table provides some examples of commonly used command line software tools. 

### Software

| Software | Version | Manual | Available for | Description |
| -------- | ------------ | ------ | ------------- | ----------- |
| [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) | 0.11.7 | [Link](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/)| Linux, MacOS, Windows | Quality control tool for high throughput sequence data. |
| [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic) | 0.38 | [Link](http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf) | Linux, MacOS, Windows | A flexible read trimming tool for Illumina NGS data. |
| [BWA](http://bio-bwa.sourceforge.net/) | 0.7.17 | [Link](http://bio-bwa.sourceforge.net/bwa.shtml) | Linux, MacOS | Mapping DNA sequences against reference genome. |
| [SAMtools](http://samtools.sourceforge.net/) | 1.9 | [Link](http://www.htslib.org/doc/samtools.html) | Linux, MacOS | Utilities for manipulating alignments in the SAM format. |
| [BCFtools](https://samtools.github.io/bcftools/) | 1.8 | [Link](https://samtools.github.io/bcftools/bcftools.html) | Linux, MacOS | Utilities for variant calling and manipulating VCFs and BCFs. |
| [IGV](http://software.broadinstitute.org/software/igv/home) | [Link](https://software.broadinstitute.org/software/igv/download) | [Link](https://software.broadinstitute.org/software/igv/UserGuide) | Linux, MacOS, Windows | Visualization and interactive exploration of large genomics datasets. |

### QuickStart Software Installation Instructions

These are the QuickStart installation instructions. They assume familiarity with the command line and with installation in general. As there are different operating systems and many different versions of operating systems and environments, these may not work on your computer. If an installation doesn't work for you, please refer to the user guide for the tool, listed in the table above.

We have installed software using [miniconda](https://docs.conda.io/en/latest/miniconda.html). Miniconda is a package manager that simplifies the installation process. Please first install miniconda3 (installation instructions below), and then proceed to the installation of individual tools. 

### Miniconda3

> ## MacOS
> 
>To install miniconda3, type:
>
>~~~
>$ curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
>$ bash Miniconda3-latest-MacOSX-x86_64.sh
>~~~
>{: .bash}
> Then, follow the instructions that you are prompted with on the screen to install Miniconda3. 
{: .solution}


### FastQC

> ## MacOS
>
>To install FastQC, type:
>
> ~~~
> $ conda install -c bioconda fastqc=0.11.7=5
> ~~~
>{: .bash}
{: .solution}

> ## FastQC Source Code Installation
>
> If you prefer to install from source, follow the directions below:
>
> ~~~
> $ cd ~/src
> $ curl -O http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
> $ unzip fastqc_v0.11.7.zip
> ~~~
> {: .bash}
>
> Link the fastqc executable to the ~/bin folder that
> you have already added to the path.
>
> ~~~
> $ ln -sf ~/src/FastQC/fastqc ~/bin/fastqc
> ~~~
> {: .bash}
>
> Due to what seems a packaging error
> the executable flag on the fastqc program is not set.
> We need to set it ourselves.
>
> ~~~
> $ chmod +x ~/bin/fastqc
> ~~~
> {: .bash}
{: .solution}

**Test your installation by running:**

~~~
$ fastqc -h
~~~
{: .bash}

### Trimmomatic

> ## MacOS
>
> ~~~
> conda install -c bioconda trimmomatic=0.38=0
> ~~~
>{: .bash}
{: .solution}

> ## Trimmomatic Source Code Installation
>
> If you prefer to install from source, follow the directions below:
>
> ~~~
> $ cd ~/src
> $ curl -O http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.38.zip
> $ unzip Trimmomatic-0.38.zip
> ~~~
> {: .bash}
>
> The program can be invoked via:
>
> ~~~
> $ java -jar ~/src/Trimmomatic-0.38/trimmomatic-0.38.jar
> ~~~
>
> The ~/src/Trimmomatic-0.38/adapters/ directory contains
> Illumina specific adapter sequences.
>
> ~~~
> $ ls ~/src/Trimmomatic-0.38/adapters/
> ~~~
> {: .bash}
{: .solution}

**Test your installation by running:** (assuming things are installed in ~/src)

~~~
$ java -jar ~/src/Trimmomatic-0.38/trimmomatic-0.38.jar
~~~
{: .bash}


> ## Simplify the Invocation, or to Test your installation if you installed with miniconda3:
>
> To simplify the invocation you could also create a script in the ~/bin folder:
>
> ~~~
> $ echo '#!/bin/bash' > ~/bin/trimmomatic
> $ echo 'java -jar ~/src/Trimmomatic-0.36/trimmomatic-0.36.jar $@' >> ~/bin/trimmomatic
> $ chmod +x ~/bin/trimmomatic
> ~~~
> {: .bash}
>
> Test your script by running:
>
> ~~~
> $ trimmomatic
> ~~~
> {: .bash}
{: .solution}

### BWA

> ## MacOS
>
>~~~
>conda install -c bioconda bwa=0.7.17=ha92aebf_3
>~~~
>{: .bash}
{: .solution}

> ## BWA Source Code Installation
>
> If you prefer to install from source, follow the instructions below:
>
> ~~~
> $ cd ~/src
> $ curl -OL http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.17.tar.bz2
> $ tar jxvf bwa-0.7.17.tar.bz2
> $ cd bwa-0.7.17
> $ make
> $ export PATH=~/src/bwa-0.7.17:$PATH
> ~~~
> {: .bash}
{: .solution}

**Test your installation by running:**

~~~
$ bwa
~~~
{: .bash}

### SAMtools

> ## MacOS
>
>~~~
>$ conda install -c bioconda samtools=1.9=h8ee4bcc_1
>~~~
>{: .bash}
{: .solution}

> ## SAMtools Versions
> SAMtools has changed the command line invocation (for the better). But this means that most of the tutorials
> on the web indicate an older and obsolete usage.
{: .callout}

> ## SAMtools Source Code Installation
>
> If you prefer to install from source, follow the instructions below:
>
> ~~~
> $ cd ~/src
> $ curl -OkL https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
> $ tar jxvf samtools-1.9.tar.bz2
> $ cd samtools-1.9
> $ make
> ~~~
> {: .bash}
>
> Add directory to the path if necessary:
>
> ~~~
> $ echo export `PATH=~/src/samtools-1.9:$PATH` >> ~/.bashrc
> $ source ~/.bashrc
> ~~~
> {: .bash}
{: .solution}

**Test your installation by running:**

~~~
$ samtools
~~~
{: .bash}


### BCFtools

> ## MacOS
>
>~~~
>$ conda install -c bioconda bcftools=1.8=h4da6232_3 
>~~~
>{: .bash}
{: .solution}

> ## BCF tools Source Code Installation
>
> If you prefer to install from source, follow the instructions below:
>
> ~~~
> $ cd ~/src
> $ curl -OkL https://github.com/samtools/bcftools/releases/download/1.8/bcftools-1.8.tar.bz2
> $ tar jxvf bcftools-1.8.tar.bz2
> $ cd bcftools-1.8
> $ make
> ~~~
> {: .bash}
>
> Add directory to the path if necessary:
>
> ~~~
> $ echo export `PATH=~/src/bcftools-1.8:$PATH` >> ~/.bashrc
> $ source ~/.bashrc
> ~~~
> {: .bash}
{: .solution}

**Test your installation by running:**

~~~
$ bcftools
~~~
{: .bash}


### IGV

- [Download the IGV installation files](https://software.broadinstitute.org/software/igv/download)
- Install and run IGV using the [instructions for your operating system](https://software.broadinstitute.org/software/igv/download).

## Running FastQC  

We will now assess the quality of the reads that we downloaded. First, make sure you're still in the `untrimmed_fastq` directory

~~~
$ cd ~/Desktop/CLI_Class_Directory/shell_data/untrimmed_fastq/ 
~~~
{: .bash}

> ## Exercise
> 
>  How big are the files?
> (Hint: Look at the options for the `ls` command to see how to show
> file sizes.)
>
>> ## Solution
>>  
>> ~~~
>> $ ls -l -h
>> ~~~
>> {: .bash}
>> 
>> ~~~
>> -rw-r--r--  1 jpcourneya  staff    46K Jul 27 16:43 SRR097977.fastq
>> -rw-r--r--  1 jpcourneya  staff    42K Jul 27 16:43 SRR098026.fastq
>> ~~~
>> {: .output}
>> 
>> There are 2 FASTQ files ranging from 42k to 46k. 
>> 
> {: .solution}
{: .challenge}

FastQC can accept multiple file names as input, and on both zipped and unzipped files, so we can use the \*.fastq* wildcard to run FastQC on all of the FASTQ files in this directory.

~~~
$ fastqc *.fastq* 
~~~
{: .bash}

You will see an automatically updating output message telling you the 
progress of the analysis. When the analysis completes, your prompt will return. So your screen will look something like this: 

~~~
Started analysis of SRR097977.fastq
Analysis complete for SRR097977.fastq
Started analysis of SRR098026.fastq
Analysis complete for SRR098026.fastq
~~~
{: .output}

The FastQC program has created several new files within our
`data/untrimmed_fastq/` directory. 

~~~
$ ls 
~~~
{: .bash}

~~~
SRR097977.fastq		SRR097977_fastqc.html	SRR097977_fastqc.zip	SRR098026.fastq		SRR098026_fastqc.html	SRR098026_fastqc.zip
~~~
{: .output}

For each input FASTQ file, FastQC has created a `.zip` file and a
`.html` file. The `.zip` file extension indicates that this is 
actually a compressed set of multiple output files. We'll be working
with these output files soon. The `.html` file is a stable webpage
displaying the summary report for each of our samples.

We want to keep our data files and our results files separate, so we
will move these
output files into a new directory within our `results/` directory.

~~~
$ mkdir -p ~/Desktop/CLI_Class_Directory/results/fastqc_untrimmed_reads 
$ mv *.zip ~/Desktop/CLI_Class_Directory/results/fastqc_untrimmed_reads/ 
$ mv *.html ~/Desktop/CLI_Class_Directory/results/fastqc_untrimmed_reads/ 
~~~
{: .bash}

Now we can navigate into this results directory and do some closer
inspection of our output files.

~~~
$ cd ~/Desktop/CLI_Class_Directory/results/fastqc_untrimmed_reads/ 
~~~
{: .bash}

## Viewing the FastQC results

Since we were working on our local computers, we're able to look at each of these HTML files by opening them in a web browser.

## Assessing Quality using FastQC
In real life, you won't be assessing the quality of your reads by visually inspecting your 
FASTQ files.  

FastQC has a number of features which can give you a quick impression of any problems your
data may have, so you can take these issues into consideration before moving forward with your
analyses. Rather than looking at quality scores for each individual read, FastQC looks at
quality collectively across all reads within a sample. The image below shows one FastQC-generated plot that indicates
a very high quality sample:

![good_quality](https://i.imgur.com/I1YS90b.png)

The x-axis displays the base position in the read, and the y-axis shows quality scores. In this 
example, the sample contains reads that are 40 bp long. This is much shorter than the reads we 
are working with in our workflow. For each position, there is a box-and-whisker plot showing 
the distribution of quality scores for all reads at that position. The horizontal red line 
indicates the median quality score and the yellow box shows the 1st to 
3rd quartile range. This means that 50% of reads have a quality score that falls within the 
range of the yellow box at that position. The whiskers show the absolute range, which covers 
the lowest (0th quartile) to highest (4th quartile) values.

For each position in this sample, the quality values do not drop much lower than 32. This 
is a high quality score. The plot background is also color-coded to identify good (green),
acceptable (yellow), and bad (red) quality scores.

Now let's take a look at a quality plot on the other end of the spectrum. 

![bad_quality](https://i.imgur.com/GT1s2wT.png)

Here, we see positions within the read in which the boxes span a much wider range. Also, quality scores drop quite low into the "bad" range, particularly on the tail end of the reads. The FastQC tool produces several other diagnostic plots to assess sample quality, in addition to the one plotted above. 

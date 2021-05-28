# Internship Report

---
## Introduction

As from 3rd February 2021, I began my bioinformatics Internship at [icipe](http://www.icipe.org/) in Nairobi,Kenya. This internship opportunity has laid a strong foundation in my genomics and bioinformatics research career in my early stages.

At the beginning of the internship period I developed a learning [roadmap](https://github.com/Gatheru-rose/rose_bioinformatics_intern/blob/main/roadmap.md) and the goals I wished to achieve from the internship.

Here is a link to my internship project [plan](https://github.com/Gatheru-rose/rose_bioinformatics_intern/projects/1) that I keep on updating depending on the skills gaps and knowledge yet to cover. Additionally, here is the link to my internship repository [readme](https://github.com/Gatheru-rose/rose_bioinformatics_intern) document.

I am happy to document my progress here. This progress is respective of my milestones in the [roadmap](https://github.com/Gatheru-rose/rose_bioinformatics_intern/blob/main/roadmap.md) file as well as my [project plan](https://github.com/Gatheru-rose/rose_bioinformatics_intern/projects/1).

---
## Objectives and Expectations.

1. Learning programming languages applicable in genome analysis.
2. Use bioinformatics tools and resources in parsing genomic data.
3. Data management and reproducibility in science.
4. Participating in relevant workshops and seminars.

---
## Skills.
---

### 1. Scripting and Programming.

- **Bash programming language** - In the first month of the internship, I was introduced to bash programming language. I didn't have prior skills and expertise in this language, however from my trainers and the vast amount of resources at my disposal I am can confidently say that I am now quite conversant in bash programming langauge. 

    **Skills gained**
    - Developing bash scripts and their execution.
    - Using linux command line and navigating through the terminal.
    - Learning the importance of different commands, options, wildcards, absolute and relative paths in bash.
    - Creation of files and directories and moving them from one directory to another.
    - Navigating and working with files and directories
    - Understanding pipes, filters, loops, shell scripts and finding things.
    - Managing github from the commandline (linking remote and local repositories)

   I gained this skills from different online resources like the [datacarpentry workshops](http://swcarpentry.github.io/shell-novice/), [Bioinformatics for Biologist](https://www.futurelearn.com/courses/linux-for-bioinformatics) online course and H3ABioNet course [Module 2](https://training.h3abionet.org/IBT_2017/?page_id=915).

   I have been applying these skills on the HPC, 16S group project and also in an assignment from our trainers. Here are the [answers](https://github.com/Gatheru-rose/Bash_answers) to the assignment.
   
-  **Python programming language** - Unlike for Bash programming language, I had some expertise and knew python syntax prior to the internship. Thus, it was a great opportunity to have a recap on python basics and advance in it as well. I followed through the interactive tutorials of [Python for Bioinformatics](https://github.com/kipkurui/Python4Bioinformatics) using jupyter notebooks. 

      **Skills**
      - Distinguishing data types in python, and string manipulation.
      - Understanding how to use lists, tuples and dictionaries.
      - Scripts, opening and reading files.
      - Defining and reusing functions.
      - Using Biopython packages.

   Using Biopython, I have been able to analyze a fasta file containing Otu sequences and interpret the otu sequences. I was able to do this using Jupyter notebooks and here is the [link](https://github.com/Gatheru-rose/rose_bioinformatics_intern/blob/main/Unknown_Otus%20_analysis.ipynb) to the exercise.
   
-  **R programming language** - Just like for python programming language, I also had some prior interactions with R thus knew some basic R syntax and how to navigate through R. During the internship, I further enhanced my skills in R particularly in creating plots using ggplot2 package. Week 3 of [Bioinformatics for Biologists course](https://www.futurelearn.com/courses/linux-for-bioinformatics) and [ggplot2 online book](https://ggplot2-book.org/) helped me gain these skills.

      **Skills**
      - Manipulating data using dplyr package.
      - Data visualization with ggplot2.

   Additionally, I practised data visualization using ggplot2 from [Galaxy Training Network](https://shiltemann.github.io/global-galaxy-course/workshop) workshop.

### 2.  Data Management and Reproducibility.

One of the best practices in bioinformatics research is data management and reproducibility. This can be achieved through various **collaborative and version control tools**. 

During the first week of the internship program, I was introduced to **slack** for communication, and **git and github** for version control and creation of repositories that are easily accessible. Here is my [slack account](https://app.slack.com/client/T01AW0MEK6G/D01LLGSBMNJ) and [github handle](https://github.com/Gatheru-rose) which contains my repositories for this internship, exercises that I have done and some projects that I participated in. Github was used in the 16S accreditation process where the participants could access the 16S repository which had documentations of the project, scripts, results and the final report. Thus it was easier to follow up, update and keep up with the project in real-time. 

Other than in using slack, git and github, scientific computing notebooks are available for managing one’s analysis and making it reproducible. **Jupyter Notebook** is an example of such scientific computing notebooks which enables interactive data science across a number of languages for example python. An example of such is the [Python for Bioinformatics tutorial](https://github.com/kipkurui/Python4Bioinformatics2019) with different interactive sessions on jupyter notebook on python basics. Here is an example of [my jupyter notebook](http://localhost:8888/notebooks/Unknown_Otus%20_analysis.ipynb) on the analysis of otu sequences from 16S analysis using Biopython packages.

### 3. NGS analysis using bioinformatics tools, resources and programming languages.

There are several bioinformatics tools that are used in the analysis and parsing of Next-Generation Sequenced data. These tools are developed using different algorithms to carry out different tasks. Before any downstream analysis of NGS data, some crucial preprocessing steps are neccesary. Below are some of the tools that I have learnt which are useful in whole genome data analysis.

   - Quality checking of reads is normally the first step. `FastQc` tool is used in reporting the quality of the reads and informs one of any subsequent trimming steps needed to be done on the reads.
   - NGS reads are trimmed according to their; Phred quality score, false basecalls like N's, adapter and primer sequences, short sequence reads and those with low mean quality scores. `Trimmomatic`, and `Cutadapt` tools are used in quality correction of the reads.
   - `Multiqc` tool is useful in the aggregation of outputs from different tools for easier comparison of the results from different reads.
   - `[Usearch]`(https://www.drive5.com/usearch/) and `[Vsearch]`(https://github.com/torognes/vsearch) tool can be used for downstream analysis of the reads after quality correction. Both tools have similar commands that were developed from different algorithms and perform various tasks. 
   
      Using `-merge` command from either tools, paired-end reads whose quality has been checked and corrected can be merged and appended to one file. However,`Vsearch --merge` command can only process a pair of paired-end reads at a time thus its alternative `Usearch-merge` command comes in handy when merging numerous paired-end reads. 
      
      Both commands have a `-filter` command which strips off forward and reverse primers, and does further quality correction. Additionally, both tools have commands that can orient reads according to the reference database available (i.e the `-orient` command). 
      
      Dereplication is performed by `-derep` command from both tools to find the unique reads only among all available reads.
      
      Chimeric sequences can be detected and filtered using the Uchime algorithm in either `-uchime-ref` command using a reference database, or through `-uchime2-denovo3`, or in `-unoise3` command that performs denoising as well on the amplicon reads.
      
      Otus(Operational Taxonomic units) are clustered from the reads with the clustering command from both tools that is `-cluster_otus` command at 97% similarity threshold. However, true biological sequences known as **Amplicon Sequence variants** (ASVs) are the most preferred compared to Otus that were clustered at 97% similarity threshold that is becoming obsolete. Hence it is better to use the *-unoise* command available from both tools to perform denoising, remove chimeric sequences and output ASVs instead of Otus.
      
      **Limitation of Usearch and Vsearch tools.**
      
      - One disadvantage of th Usearch tool to Vsearch is that the open source 32bit Usearch tool can't process a large dataset thus the development of an alternative tool, Vsearch, which is fully open source and has a 64-bit design that can handle large datasets.
      - Vsearch *-merge* command can only process a pair of paired-end reads at a time unlike Usearch *-merge* command.
      - Some Vsearch commands are not compatible with downstream analysis using other tools like Qiime2 for example the *Vsearch -cluster_otus* command. 
      
   - **[Qiime2](https://qiime2.org/)** tool is a microbiome analysis package that enables researchers to start an analysis with raw DNA sequence data and finish with publication-quality figures and statistical results. It has different [plugins](https://docs.qiime2.org/2021.2/plugins/available/) for different tasks from Quality control to exploring community diversity and visualizing the results.
  
   - **[DADA2](https://benjjneb.github.io/dada2/index.html)** an open-source software package is used form microbiome analysis it has different commands for microbiome analysis and performs high resolution sample inference from Illumina amplicon data. DADA2 is better than Qiime2 in microbial community clustering since DADA2 uses a denoising algorithm and outputs ASVs unlike Qiime2 which outputs Otus. 
   
   I used these tools when participating in the 16S accreditation process and what I learnt from the project about bioinformatics tools and resources is that they are can be intergrated into pipelines and the choice of the tool depends on; nature and size of your data, computing resources as well as time. Moreover, before using a specific tool one needs to learn and understand well the working of the tool and it's commands.
   
   I also used some bioinformatics tools during the GTN workshop in analysis of whole genome data. Here is my [galaxy report](https://github.com/Gatheru-rose/rose_bioinformatics_intern/blob/main/Galaxy_report.md) from the workshop I attended describing the tools I used and some of my workflows.
   
### 4. Working on the HPC.

Most of the tasks done on the 16S accrediation project were run on icipe's HPC. High Performance Computing enables processing of large datasets at a faster speed that would have otherwise impaired the functioning of a PC when run locally. I was able to navigate around the different nodes of icipe's HPC in running some tasks. Task completion was fast and other tasks could also be done on the PC simultaneously. Bash programming was useful in navigating around the HPC terminal and in the process I learnt other commands as well.

### 5. Workflow management system languages.

Workflow management system languages such as [Nextflow](https://www.nextflow.io/docs/latest/index.html) and [Snakemake](https://snakemake.readthedocs.io/en/stable/) allow the automation and seammless execution of bioinformatics pipelines. This is essential in ensuring reproducibility of workflows, projects and even their scalability. 

I have learnt the basic concepts of nextflow scripting from creating a nextflow [main.nf](https://github.com/Gatheru-rose/rose_bioinformatics_intern/blob/main/main.nf) file script, a nextflow [config file](https://github.com/Gatheru-rose/rose_bioinformatics_intern/blob/main/nextflow.config) and the nextflow scripts containing processes that direct relevant inputs and outputs through all the processes. I collaboratively worked with my fellow team mates in converting a microbiome analysis pipeline using different tools into a nextflow workflow language. Here are some of my [nextflow scripts](https://github.com/Gatheru-rose/rose_bioinformatics_intern/tree/main/modules). 

---

## Workshops, Seminars and Online courses.

1. [GTN Smörgåsbord: A Global Galaxy Course](https://shiltemann.github.io/global-galaxy-course/) - From February 15th to 19th 2021, I participated in the GTN Smorgasbord galaxy course. This course aided my understanding in NGS analysis a field that I was new to. I learnt skills necessary in whole genome data analysis and interacted with other participants globally. Here is the [link](https://github.com/Gatheru-rose/rose_bioinformatics_intern/blob/main/Galaxy_report.md) to my galaxy report reporting in detail what I learnt from the course as well as links to my workflows and histories during the course. I succesfully completed the course and received a [certificate](https://drive.google.com/drive/folders/1o5ubEJII3p-a1CfE-dUkOkeb1lkNLxgW) of participation.
2. WiDS African conference. - On 8th March 2021, I attended Women in Data Science African conference and received insights from different succesful women in Data science field. This was an eye-opening conference to get advice from great speakers such as [Mamokgethi Phakeng](https://mamokgethi.com/) as I am in my early stage of my career in bioinformatics. From this conference I learnt of [BCWB](https://www.blackwomencompbio.org/) network and joined.
3. Bioinformatics for Biologists- I enrolled in the [Bioinformatics for Biologists](https://www.futurelearn.com/courses/linux-for-bioinformatics) short online course from Futurelearn web platform. This course further aided my understanding of different commands in bash scripting and it acted as a polish to what I had already learnt earlier on. The last week of the course, I gained skills on data visualization using ggplot2 an R package.
4. Journal club - I participated in journal club discussions held once in 2 weeks and have so far gained knowledge and insights from different topics on bioinformatics, High-Resolution Melting-PCR analysis, and general computer science. I also presented on 25th March 2021, and here is the [paper](https://jcm.asm.org/content/53/6/1908) I presented and its [slides](https://docs.google.com/presentation/d/1j11cCrxxwYnv98eQpwof5FhCqEJ1WOV_iwl7Rkv6JTk/edit#slide=id.p7). I also gained presentation skills through it. 

---

## Conclusion.

Data Science in particular bioinformatics is a significant field in interpreting the increasing amount of biological data from sequencing platforms. Through it there will be an understanding of genome data and aid researchers in coming up with relevant solutions to different problems at the genome level. All this is achievable through the bioinformatics tools,and resources available. To be good in bioinformatics, one should have a good understanding of the different tools, programming languages relevant in genome analysis and how to intergrate them together. One of the best practices in a bioinformatics research career is data management and reproducibilty. Hence open science and collaboration is important for this thus the availabity of numerous collaborative and version-control tools.

I have gained invaluable hands-on experience from this internship that could have only be learnt here through projects and sessions I participated in. Through this internship I have developed and refined my skills in bioinformatics, networked with some of the best bioinformaticians and received mentorship from them. From the journal club I also gained more confidence in presentation and learnt necessary preparation steps for interviews.

---
   ### Pending Tasks
   - [ ] Mini-project.
   - [ ] Revisit Git and Github from the commandline.
   - [ ] Snakemake workflow management system.




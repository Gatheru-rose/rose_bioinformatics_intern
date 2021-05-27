# **Galaxy training report**

---

### **Introduction**

[Galaxy](https://galaxyproject.org/community/) is an online platform developed by a community of scientists. This platform is distributed in different regions by presence of [servers](https://galaxyproject.org/usegalaxy/). These servers are accessible virtually and contain various tools which aid in the analysis of different types of data. From galaxy one can access training materials from the galaxy training network (GTN) [page](https://training.galaxyproject.org/). These page consists  of a wide range of tutorials on how to use the inbuilt tools in galaxy to carry out data analysis. 

From 15th to 19th February 2021, I participated virtually in the GTN Smörgåsbord: [A Global Course](https://training.galaxyproject.org/training-material/smorgasbord.html). This workshop comprised of different GTN tutorials exposing one to a wide range topics in the course of the week. I used the [Galaxy Australian server](https://usegalaxy.org.au/) in following through the hands-on tutorials. 

---

### **Objectives**
1. To familiarize with galaxy platform and learn data analysis using galaxy.
2. To understand NGS analysis using galaxy tools.
3. To determine the importance of using certain tools for data analysis over others.

---

### **Skills learnt**

1. #### **Carrying out Next-Generation analysis using galaxy tools.**

Once one receives sequenced data from a sequencer, there are a set of steps that are carried out in the analysis of the data. Galaxy platforms comprise of a set of tools that enables step-wise analysis of the data. 

**Quality control** is an essential first step to any sequenced data so that the downstream analysis of the data is not affected by the state of the data. Galaxy has a **FastQc** tool that checks the quality of the sequenced files. It assesses the data based on various parameters such as **sequence quality score** and **per base sequence quality**. Depending on the output of the fastQc tool, other tools come in handy when **quality correction** is necessary. These tools include **Cutadapt** and **Filter** tool. Cutadapt trims adapter sequences as well as low-quality score regions from the FastQ data. Filter tool on the there hand, removes N basecalls in the sequence, reads with short sequence length, and those with low mean quality scores. These tools aid in improving the quality of the sequenced data. Additionally, the **MultiQC** tool is useful in the aggregation of different output files from the same tool that was used. This makes it easier to compare the results at once. A link to my [Quality control](https://usegalaxy.org.au/u/rosewambui/h/quality-control) history and [workflow](https://usegalaxy.org.au/u/rosewambui/w/workflow-constructed-from-history-quality-control) of the hands-on tutorial.
  
Sequencing tools such as Illumina produce short reads of sequences whose genomic context and their location on the genome is not known. Thus **alignment** of the short reads to a reference genome is done so as to know their **specific location** on the genome and **insights** about the reads. There are various tools offered by galaxy for mapping reads like **Bowtie2, BWA-MEM**, and many more. Mapping reads is important to know any **potential errors** in the reads and what to do about them. Mapping tools generate a **Binary Alignment Map** of the reads to a sequence genome, their location, and the quality of mapping. The output of the BAM files is then visualized using visualizers including (but not limited to) **JBrowse and Integrative Genome Viewer (IGV)**. Visualization enables an interactive interface to view aligned reads to the genome and note any differences between the two. In galaxy there are very many tools and algorithms for mapping, it is dependent on one's data the outcome one desires. Here is an example of mapping genomes [workflow](https://usegalaxy.org.au/u/rosewambui/w/workflow-constructed-from-history-sequence-mapping) and [history](https://usegalaxy.org.au/u/rosewambui/h/sequence-mapping) from galaxy.
    
Unlike mapping of reads to a reference genome, **one may decide to assemble the short fragments back to the original DNA sequence**. This process is known as **De novo assembly**. Although theoretically, this process sounds simple it is quite difficult. **Flye** is an example of a tool for assembling reads from a nanopore sequencer. Nanopore sequencers generate long reads which might have errors during base calling, hence short reads from Illumina sequencers are used to polish and correct errors in the assembled reads. Pilon is an example of a tool that polishes long reads using the short reads from an Illumina sequencer. Once errors are removed, **annotation** is done of the assembled reads using tools like Prokka and Geseq. Annotation of the reads is then followed by visualization using preferred visualizers. De novo assembly [workflow](https://usegalaxy.org.au/u/rosewambui/w/workflow-constructed-from-history-chloroplast-genome-assembly) and [history](https://usegalaxy.org.au/u/rosewambui/h/chloroplast-genome-assembly) from galaxy.
	
2. #### **RNA-Seq analysis using Galaxy and Rstudio.**

RNA sequencing analyzes cellular transcriptome ( RNA molecules from a cell or a tissue) to find out which genes are upregulated or downregulated. RNA-seq is done mainly to identify novel genes and differentially expressed genes or molecular pathways in two or more biological conditions. The workflow of RNA-seq is quite similar to an NGS analysis, in that quality control is needed to determine the quality of your reads and whether improvement of the quality is required. After quality control, mapping is carried out to identify the location where the reads originated from. For RNA sequences it is somehow different from the mapping of DNA to a reference genome due to the presence of introns and splicing of the RNA therefore special tools such as RNASTAR are available for mapping RNA sequences. Visualization of the mapped reads using IGV tool which also enables one to view spliced regions using Sashimi plots. Before figuring out the differential expressed genes, it is necessary to count the reads occurring in annotated genes. RNA-Seq analysis [workflow](https://usegalaxy.org.au/u/rosewambui/w/workflow-constructed-from-history-rna-seqanalysis) and [history](https://usegalaxy.org.au/u/rosewambui/h/rna-seq).
   
An important step in RNA-seq workflow is to investigate for any differentially expressed genes. This can be done using the DESEq2 tool. DeSeq2 tool does this by estimating the presence of biological variance and significance of expression differences between any two conditions. Factors with several levels are incorporated in the analysis to describe known sources of variation. Differentially expressed genes are visualized using heatmaps. Gene ontology of the identified differentially expressed genes provides the functionality of the genes and if needed KEGG pathways where the genes are involved could also be investigated. Using Rstudio, visualization and data manipulation of the analyzed RNA-seq data can also be done. Rstudio has several packages such as ggplot2 which makes it easier to produce customized results for your work which couldn't be done using galaxy tools. With ggplot2 package for instance one can set different parameters and get scatter plots, boxplots, trendlines, and many more. It generally depends on your desired graphical presentation of data. RNA-Seq [workflow](https://usegalaxy.org.au/u/rosewambui/w/workflow-constructed-from-history-rna-deseqanalysis) and [history](https://usegalaxy.org.au/u/rosewambui/w/workflow-constructed-from-history-rna-seqanalysis) for the hands-on tutorial.

3. #### **Single cell RNA-Seq.**

Single case RNA-Seq differs from bulk RNA-Seq in that this time round it is the sequencing of transcripts of individual cells and not RNA from an entire tissue comprising different cells. This distinguishing factor makes the analysis right from sample preparation to any downstream analysis to be different. Using the flow cytometry, cells are captured and sorted depending on the set parameters. In order to differentiate transcripts of one cell from another, Barcodes (short oligonucleotides sequences) are added which will label all transcripts of a certain cell. Unique Molecular Identifiers (UMIs) are necessary in Single-cell RNA-Seq so as to mitigate amplification bias. UMIs label amplified reads from a certain transcript such that they are only counted once. Galaxy provides a tool known as **UMI-tools extract** which extracts UMIs and cell barcodes from the forward reads and appends them to the header sequence of their respective reverse reads. By doing so one is able to tell which transcript and cell the reverse read has originated from hence even without its forward read.

4. #### **Variant analysis.**

Variant analysis refers to the analysis of a given genome in reference to another genome preferably a reference genome to investigate the presence of any variant( changes present in the query sequence genome that are absent in the reference genome). These variants are associated with changes in phenotypes and in outbreak investigation. Before carrying out variant analysis one should be conversant with the organism in question. This variant analysis was for *M.tuberculosis* to gain more insights on drug resistance in relation to novel variants.

Any NGS analysis workflow starts with Quality Control step, where FastQc is used to infer the quality of your reads. In case quality correction is neccessary, tools such as Trimmomatic are useful in removing poor quality ends. Using Kraken2 tool, any contamination sources from other species are identifiable. Once the reads are confirmed to be of good quality and lack contamination, calling of variants can be done. Snippy is a tool that identifies variants (SNPs and indels) present in the sequence reads but absent in the reference genome. Depending on the species genome one is working on, there is need to further filter the variants identified before. For the case of M.tuberculosis, variants can be filtered using **TB_Variant filter** specifying the desired parameters to be applied. This ensures that the variants left are of high quality. **TB_Profiler profile** can also be used for variant calling, filtering and finds any relationship between identified variants to drug resistance. Using **JBrowse**, the identified SNPs and indels are visualized and their location identified respective of the reference genome. Here is my [history](https://usegalaxy.org.au/u/rosewambui/h/mtuberculosis-variant-analysis) and [workflow](https://usegalaxy.org.au/u/rosewambui/w/workflow-constructed-from-history-mtuberculosis-variant-analysis) for *M.Tuberculosis* variant analysis.

---

### **Challenges.**

1. The galaxy server I was using didn't have some of the tools necessary for certain analysis, thus didn't cover all topics for example Proteomics.
2. Some topics were a challenge to understand and follow through e.g Proteomics and some part of Single-cell RNA-Seq.
3. Encoutering errors during the hands-on tutorials.

---

### **Pending Tasks**

1. Completing analysis using a different galaxy server with tools available for the respective analysis.
2. Repeating tutorials where I had errors.
3. Going through Galaxy Training Network page and doing more practice.

---

### **Conclusion**

This 5 day workshop from Galaxy GTN Smörgåsbord, was an insightful and introductory course to Next-Generation Sequence analysis. From this course, I learnt how to structure NGS workflow analysis, and the importance of Quality control prior to any downstream analysis. What I loved the most about this course is that I can get back to the page and keep on learning at my own pace.

Here is the link to [GTN Smörgåsbord](https://shiltemann.github.io/global-galaxy-course/workshop) course.




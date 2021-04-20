#! /usr/bin/env nextflow

// Process 4(i): Conversion of OTUS into Qiime2 Artifact
process OTU_CONVERSION {
	tag "OTU conversion"
	publishDir path: { "${params.outdir}/artifacts" }

	input:
	file(otus)

	output:
	path "ASVs.qza", emit: otus_qza
	path "ASVs.qzv", emit: otus_qzv

	script:
	otus_conv = "ASVs.qza"
	otus_viz = "ASVs.qzv"

	"""
	qiime tools import --input-path ${otus} --output-path ${otus_conv} --type 'FeatureData[Sequence]'
	
	# otu visualization
	qiime feature-table tabulate-seqs --i-data ${otus_conv} --o-visualization ${otus_viz}

	"""
}

// Process 4(ii): MAFFT alignment, Masking Aligned OTUS, Generating a Phylogenetic Tree and rooting of the phylogenetic tree
process MAFFT_ALIGNMENT_PLUS {
	tag "Running MAFFT_alignment,masking_aligned_otus,generating a phylogenetic tree and rooting"
	publishDir path: { "${params.outdir}/artifacts" }

	input:
	path otusqza

	output:
	file(aligned)
	file(masked)
	file(unrooted_tree)
	file(rooted)

	script:
	aligned = "aligned_ASVs.qza"
	masked = "masked_aligned_ASVs.qza"
	unrooted_tree = 'unrooted_tree.qza'
	rooted = "rooted_tree.qza"

	"""
	qiime phylogeny align-to-tree-mafft-fasttree \
		--i-sequences ${otusqza} \
		--o-alignment ${aligned} \
		--o-masked-alignment ${masked} \
		--o-tree ${unrooted_tree} \
		--o-rooted-tree ${rooted}
	"""
}

// Process 4(iii): Converting the OTU Table to Qiime Artifact
process OTUTABLE_TO_ARTIFACT {
	tag "Converting OTU Table:"
  	publishDir path: { "${params.outdir}/artifacts" }

	input:
	file(otu_table)

	output:
	file(otubiomtable)

	script:
	otubiomtable = "otu_table.from_txt_hdf5.biom"
	"""
	biom convert -i ${otu_table} -o ${otubiomtable} --table-type="OTU table" --to-hdf5
  	"""
}

// Process 4(iii.2): Generating Feature Table
process FEATURE_TABLE {
	tag "Generating Feature Table"
	publishDir path: { "${params.outdir}/artifacts" }

	input:
	file(feature_tab)
	path medta_ch

	output:
	path "ASV_tab.qza", emit: otutab_qza
	path "ASV_tab.qzv", emit: otutabviz

	script:
	otutab_out = "ASV_tab.qza"
	otutab_viz = "ASV_tab.qzv"

	"""
	  qiime tools import --input-path ${feature_tab} --type 'FeatureTable[Frequency]' --output-path ${otutab_out}

	# otutab visualization

	qiime feature-table summarize --i-table ${otutab_out} --o-visualization ${otutab_viz} --m-sample-metadata-file ${medta_ch}

	"""
}

// Process 4 (iv): Downloading Greengenes classifier.
process CLASSIFIER {
	tag "Retrieving Greengenes classifier"
	publishDir path: { "${params.outdir}/artifacts" }
	
	output:
	path "greengenes-classifier.qza", emit: classifier_qza

	script:
	
	"""
	wget   -O "greengenes-classifier.qza"  "https://data.qiime2.org/2021.2/common/gg-13-8-99-515-806-nb-classifier.qza"

	"""
}

#!/bin/bash
#SBATCH --partition=DTN
#SBATCH --time=5:00:00

module load anaconda3

conda activate conda_environment

#Goes through parsed bam files and seperates first and second column with a comma

for content in *.txt;
do
	awk '{print $1", "$2}' $content >> $content-quality.txt
done

#loop Goes through the sequence IDs in the second column of every Refseq quality file and loops through them into a command
#that extracts the genbank file of the organism and gather the organism and taxonomy info
#appends the organism name and taxa info of each organism in every line of a txt file
#Then the Refseq quality files of the two columns are joined together by the Refseq taxa info files into one file

for file in *quality.txt;
do
	seqs=$(awk '{print $2}' $file)

	for ID in $seqs;
	do
		organism=$(efetch -db nuccore -id $ID -format gb | grep 'ORGANISM')
		taxa=$(efetch -db nuccore -id $ID -format gb | grep -A 2 'Eukaryota' | tr -d '\n' | sed 's/;/; /g')
		echo $organism $file $taxa >> $file.taxon.txt
	done

	paste $file $file.taxon.txt >> $file-profile.txt
done

#after loop is done, a python script is called that edits the files into csv format
#The final command adds a header to the csv file of all content in the csv file 

python3 Refseq_edit_file.py >> file_name.csv

sed -i '1i Hits,Sequence_ID,Microbe_organism,Animal_species,Domain,Kingdom,Subkingdom,Phylum,Subpyhlum,Class,Subclass,Order,Family,Genus,Species' file_name.csv



#!/bin/bash
#SBATCH --partition=DTN
#SBATCH --time=5:00:00

module load anaconda3

conda activate conda_environment


for content in *.txt;
do
	awk '{print $1", "$2}' $content >> $content-quality.txt
done


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



python3 Refseq_edit_file.py >> file_name.csv

sed -i '1i Hits,Sequence_ID,Microbe_organism,Bat_species,Domain,Kingdom,Subkingdom,Phylum,Subpyhlum,Class,Subclass,Order,Family,Genus,Species' file_name.csv



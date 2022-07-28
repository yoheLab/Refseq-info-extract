import os

def search():
    
    path = '/projects/yohe_lab/databases/Neotropical_Bat_Nasal_Microbiome_Data/BZ_Fungal_Bats/script_practice'
    ext = ('profile.txt')
    
    for files in os.listdir(path):
        if files.endswith(ext):
            fh = open(files)
            for line in fh:
                line = line.replace(";",",").replace("ORGANISM",",").replace("_qual.txt-quality.txt","").replace("__"," ").replace("NEW_",",")
                index = line.find('Eukaryota')
                reference = line.find('.R')
                final_string = line[:index] + "," + line[index:]

                final_string = final_string[:reference] 
                print(final_string)

                #print(files)
        else:
            continue




    
    #fh = open("combined_Arja_file.txt")
    #new_file =open("FASTA.txt","w")
    
    
    
    #for line in fh:
    #    line = line.replace(";",",").replace("ORGANISM",",")
    #    index = line.find('Eukaryota')
    #    reference = line.find('.R')
    #    final_string = line[:index] + "," + line[index:]
    #    final_string = final_string[:reference] + "\n"
        
    #    print(final_string)
        
       # new_file.write(final_string)

    




if __name__ == '__main__':
    search()
        
        

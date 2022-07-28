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

        else:
            continue
    




if __name__ == '__main__':
    search()
        
        

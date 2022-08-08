import os

def search():
    
    path = 'full/path/to/directory'
    ext = ('profile.txt')
    
    for files in os.listdir(path):
        if files.endswith(ext):
            fh = open(files)
            for line in fh:
                line = line.replace(";",",").replace("ORGANISM",",").replace(".bam-quality.txt","").replace("__"," ").replace("NEW_",",")
                index = line.find('Eukaryota')
                reference = line.find('.R')
                final_string = line[:index] + "," + line[index:]

                final_string = final_string[:reference] 
                print(final_string)

        else:
            continue
    




if __name__ == '__main__':
    search()
        
        

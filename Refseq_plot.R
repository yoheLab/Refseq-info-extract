> library(ggplot2)
> library(dplyr)

> file_name_data <- read.csv("file_name.csv", header = T, sep = ",")
#reading the file to a variable

> big_hits <- filter(file_name_data, Hits > 10)
#sorts the data by choosing hits greater than 10 to enhcance graph

> ggplot(big_hits, aes(color = Microbe_organism, y=Hits, x= Bat_species)) + geom_point(size=10) + theme_ipsum() + coord_flip()
#this is a horizontal point graph

> ggplot(big_hits, aes(fill = Microbe_organism, y=Hits, x= Bat_species)) + geom_bar(position="stack", stat="identity") + coord_flip()
#this is a horizontal bar graph

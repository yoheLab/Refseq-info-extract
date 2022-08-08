> library(ggplot2)
> library(dplyr)

> file_name_data <- read.csv("file_name.csv", header = T, sep = ",")

> big_hits <- filter(file_name_data, Hits > 10)

> ggplot(big_hits, aes(color = Microbe_organism, y=Hits, x= Bat_species)) + geom_point(size=10) + theme_ipsum() + coord_flip()

> library(ggplot2)
> library(dplyr)

> fungi_data <- read.csv("fungi_bat.csv", header = T, sep = ",")

> big_hits <- filter(fungi_data, Hits > 10)

> ggplot(big_hits, aes(color = Microbe_organism, y=Hits, x= Bat_species)) + geom_point(size=10) + theme_ipsum() + coord_flip()

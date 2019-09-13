'http://www.jaredlander.com/data/Tomato%20First.csv'
tomato <- read.table(file='H:/Tutorial on R/Tomato First.csv', header = TRUE, sep=',')

tomato
head(tomato)
class(tomato)
class(tomato$Tomato)



tomato <- read.table(file='H:/Tutorial on R/Tomato First.csv', header = TRUE, sep=',', stringsAsFactors = FALSE)
class(tomato$Tomato)

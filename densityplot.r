
ggplot(data=diamonds) + geom_histogram(aes(x=carat))



ggplot(data=diamonds) + geom_histogram(aes(x=carat), binwidth = 0.5)


ggplot(data=diamonds) + geom_histogram(aes(x=carat), binwidth = 0.1)

ggplot(data=diamonds) + geom_density(aes(x=carat), fill='grey50')


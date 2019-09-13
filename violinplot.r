
ggplot(diamonds, aes(y=carat, x =1)) + geom_boxplot()



ggplot(diamonds, aes(y=carat, x =cut)) + geom_boxplot()


ggplot(diamonds, aes(y=carat, x =cut)) + geom_violin(fill= 'red')


g <- ggplot(diamonds, aes(y=carat, x =cut)) 


g + geom_point() + geom_violin()



g + geom_violin() + geom_point()  


g + geom_jitter() + geom_violin()

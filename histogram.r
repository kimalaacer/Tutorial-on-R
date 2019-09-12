
require(ggplot2)
data(diamonds)
dia
diamonds
hist(diamonds$carat)

hist(diamonds$carat, main = 'Carat Histogram', xlab = 'Carat Size', ylab = 'Number of Diamonds' )

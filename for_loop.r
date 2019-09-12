

for(i in 1:10)
{
  print(i)
}  

fruit <- c('apple', 'banana', 'pomegranate')
fruitlength <- rep(NA, length(fruit))
fruitlength
names(fruitlength) <- fruit
fruitlength


fruitlength
i
# i retains the value of last iteraterated item. 

fruitlength2 <- nchar(fruit)
fruitlength2
names(fruitlength2) <- fruit
fruit
fruitlength2
identical(fruitlength, fruitlength2)

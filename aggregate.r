# aggregation same as SQL. 
require(ggplot2)
data(diamonds)
mean(diamonds$price) # this will calculate the average price of all diamonds. 
# in order to calculate mean price  / per cut type, we need aggregate function.
# the aggregate(statrs with a function price versus cut)
aggregate(price ~ cut, diamonds, mean) # which meens, take the data, break it by cut, 
                         # and then calculate the mean.
# if there is missing data: 
aggregate(price ~ cut , diamonds, mean, na.rm = TRUE)

# if we want to see the mean price per cut AND color:

aggregate(price ~ cut + color , diamonds, mean, na.rm = TRUE)


# price and carat per cut:
aggregate(cbind(price, carat) ~ cut , diamonds, mean, na.rm = TRUE)


aggregate(cbind(price, carat) ~ cut + color , diamonds, mean, na.rm = TRUE)

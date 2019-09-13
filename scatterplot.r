require(ggplot2)


#this is for scatter plot. 

plot(diamonds$carat, diamonds$price)

plot(price ~ carat, data=diamonds)

plot(price ~ carat, data=diamonds, main = "price versus Carat Size")

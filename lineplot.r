

# use line plot when date have a continuity such as time-data. 

head(economics)

ggplot(economics, aes(x=date, y=pop)) + geom_line() 


# we can use lubridate package to manipulate time data. 

require(lubridate)

economics$year <- year(economics$date)
economics$month <- month(economics$date)

head(economics)
econ2000 <-  economics[which(economics$year>=2000), ] # this code keeps only data 2000 and after. 
nrow(econ2000)


head(econ2000)
econ2000$month <- month(econ2000$date, label = TRUE)
#this code changes the month from numerical to alphabetical.
head(econ2000)


require(scales)


g <- ggplot(econ2000, aes(x=month, y=pop))

g <-  g + geom_line(aes(color=factor(year), group=year))
#by setting the year to factor - every year is different color. if not every years would have a different shade of 1 color. 
g <-  g + geom_line(aes(color=factor(year), group=year))
g



g <- g + scale_color_discrete(name = "Year")
g <- g + scale_y_continuous(labels=comma) # comma is a function in the scales package to format the y-axis. 

g <- g +labs(title = "Population Growth", x = 'Month', y= 'Population')
g
# In order to control the angle of the X axis for better visualization.
g <- g + theme(axis.text.x = element_text(angle = 90,hjust = 1)) 
g

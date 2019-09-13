# aggregation same as SQL.
# plyr is for super aggregation : simplifies the data munging process. 
# Data wrangling, sometimes referred to as data munging, is the process 
# of transforming and mapping data from one "raw" data form into another 
# format with the intent of making it more appropriate and valuable for 
# a variety of downstream purposes such as analytics.

require(plyr)
head(baseball)
# we need to change the sf (sacrifice flies) from NA to 0. 
# noticing that all sf before 1954 were NA. 

baseball$sf[baseball$year < 1954] <- 0
any(is.na(baseball$sf))
# this checks if we still have any NA in sf in baseball database. 

baseball$hbp[is.na(baseball$hbp)] <- 0 # this is another way
                                        # if we have occasional NA
                                        #to change it to 0
any(is.na(baseball$hbp))

# we have to select the players that have at-batt (column ab) >50
baseball <- baseball[baseball$ab >= 50, ]
# this way we modified the entire database to include only ab >=50

# now we calculate the on-base-percentage (OBP) for all players (ab >= 50)
# we are going to result-it in a new column.

baseball$OBP <- with(baseball, (h + bb +hbp)/(ab + bb + hbp + sf))
#instead of typing baseball$h, baseball$bb and so on, we can use the
#with or within function()

tail(baseball)
obp <- function(data)
{
     c(OBP = with(data, sum(h +  bb +hbp)/ sum(ab + bb + hbp + sf)))
}
# make sure the operator within a vector is = and not <- 
careerOBP <-  ddply(baseball, .variables = 'id', obp)

head(careerOBP)

careerOBP <- careerOBP[order(careerOBP$OBP, decreasing = TRUE), ]
head(careerOBP)
# ddply is dataframe to dataframe. 
# llply is from to list


thelist <- list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2)
lapply(thelist, sum)
llply(thelist, sum)
identical(lapply(thelist, sum), llply(thelist, sum) )

# not always identical.

sapply(thelist, sum)
laply(thelist, sum) # list to array (vector or matrices)
# it do omit vector names.

head(diamonds)
# if we want the mean AND median of price per cut
aggregate(price ~ cut, diamonds, each(mean, median))

# colwise Column-Wise Function.
# Turn a function that operates on a vector into a 
#function that operates column-wise on a data.frame.

# Usage:  colwise(.fun, .cols = true, ...)
#         catcolwise(.fun, ...)
#         numcolwise(.fun, ...)
colwise
# dplyr is faster than plyr

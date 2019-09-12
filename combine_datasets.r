# cbind for columns, rbind for rows

sport <- c('Hockey', 'Baseball', 'Football')
league <- c('NHL', 'MLB', 'NFL')
trophy <- c('Stanley Cup', "Comissioner's Trophy", "Vince Lombardi Trophy")

sports1 <- cbind(sport, league, trophy)
sports1

sports2 <- data.frame(sport = c("Basketball", "Golf"),
                      league = c("NBA", "PGA"),
                      trophy = c("Larry O'Brien Championship Trophy", 
                                 "Wanamaker Trophy"))
sports2


# combine both data.frame
sports <- rbind(sports1, sports2)
sports


# to join datasets. 
# in sql combine datasets by readinf them. GovType.csv

codes <- read.table('H:Tutorial on R/countryCodes.csv', 
                    header = TRUE, sep =',', stringsAsFactors = FALSE)
head(codes)
countries <- read.table('H:Tutorial on R/GovType.csv', 
                        header = TRUE, sep =',', stringsAsFactors = FALSE)
head(countries)
View(countries)
# we can use merge or join (is faster for large sets of data)
mergedcountries <- merge(x = codes, y = countries, 
                         by.x = 'Country.name', by.y = 'Country')

View(mergedcountries)

# join. will require same column names where you want to join. 
# so we need to rename out columns to match where we want to join. 

require(plyr)
codes <- rename(codes, c(Country.name = "Country"))
# since we renamed to match, we can use by only once without specifying. 
joinedcountries <- join(x = codes, y = countries, by = 'Country')

View(joinedcountries)


# 2 different sets of data: wide AND Long. 
# switch storage paradigms. from wide to long : melting
#                              long to wide : casting
# reshape2 package. 
require(reshape2)
head(airquality)
airmelt <-  melt(airquality, id = c('Month', 'Day'), 
                 value.name = 'Value', variable.name = 'Metric')

aircast <- dcast(airmelt, Month + Day ~ Metric, value.var = "Value")
View(aircast)

# we can rearrange the columns order:
aircast <- aircast[, c('Ozone', 'Solar.R', 'Wind', 'Temp', 'Month', 'Day')]
View(aircast)

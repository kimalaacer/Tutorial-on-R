# working with text, combining and splitting. 
# sprintf and paste. 

paste('hello', 'Jared', 'and others')
paste('hello', 'Jared', 'and others', sep = '/')
paste(c('Hello', 'Hey', 'Howdy'), c('Jared', 'Bob', 'David'))

paste(c('Hello', 'Hey', 'Howdy'), c('Jared', 'Bob', 'David'), sep = ', ')


paste('Hello', c('Jared', 'Bob', 'David'), sep = ', ')

paste('Hello', c('Jared', 'Bob', 'David'), sep = ', ', c('Goodbye', 'Seeya'))


vectoroftext <- c('Hello', 'Everyone', 'Out There', '.')
vectoroftext

paste(vectoroftext, collapse = ' ') # removes empty spaces and 
#makes it a single text (string)

person <- 'Jared'
partysize <-  8
waittime <- 25

paste('Hello, ', person, ', your party of ', 
      partysize, ' will be seated in ', waittime, ' minutes.', sep = "")

# paste is too laborious, let's use sprintf or even python 
sprintf('Hello %s, your party of %s will be seated in %s minutes.'
        , person, partysize, waittime)

# text extraction: using RegEx like in python re package
require(XML)
theurl <- "http://www.loc.gov/rr/print/list/057_chron.html"
presidents <- readHTMLTable(theurl, which = 3, 
                            as.data.frame = TRUE, 
                            skip.rows = 1,
                            header = TRUE, 
                            stringsAsFactors = FALSE)
View(presidents)
# we noticed the the last meaningful row is 65. 
# we need to remove the rest. 
presidents <- presidents[1:65, ]


View(presidents) # much cleaner. 
# 80% of the time spent on stats are data munging and cleaning. 

# we can use specific packages to help us. 
# such as stringr

require(stringr)
yearlist <- str_split(string = presidents$YEAR, pattern = '-')
View(yearlist)
# combine them in a matrix by rbind and reduce (such as re in python)

yearmatrix <- data.frame(Reduce(rbind, yearlist))
View(yearmatrix)
head(yearmatrix)

names(yearmatrix) <- c('Begining', 'Ending')
View(yearmatrix)


presidents <- cbind(presidents, yearmatrix)
View(presidents)

# if we need to get the first 3 characters of 
# the presidents name( do not know why, but just in case). 
# as in re python re.sub

str_sub(string = presidents$PRESIDENT, start = 1, end = 3)

str_sub(string = presidents$PRESIDENT, start = 4, end = 8)

# find all presidents that their presidency start in 
#year ending in 1, such as, Begining in 1981, 1971. 
# The start =4 refers to the 4th digit of the year, and 
# the end is also 4, because we are looking for this digit alone. 
presidents[str_sub(string = presidents$Begining, 
                   start = 4, end = 4) == 1,
           c('YEAR', "PRESIDENT", "Begining", "Ending")]

# we can do a generic search to check if the president 
# has a 'john' in their name.

str_detect(presidents$PRESIDENT, 'john') 
# case sensitive
# ignore.case did not work for me. 

str_detect(presidents$PRESIDENT, fixed('john', ignore_case=TRUE))

View(presidents[str_detect(presidents$PRESIDENT, 
                           fixed('john', ignore_case=TRUE)), ])

con <- url("http://jaredlander.com/data/warTimes.rdata")
load(con)
close(con)
View(warTimes)

warTimes[str_detect(string = warTimes, pattern = "-")]
thetimes <- str_split(string = warTimes,pattern = "(ACAEA)|-", n = 2)
head(thetimes)


starttimes <- sapply(thetimes, FUN = function(x) x[1])
head(starttimes)

starttimes <- str_trim(starttimes)
View(starttimes)


#how to extract information from the data, 
#say we are looking for January:
str_extract(string = starttimes,pattern = 'January')
starttimes[str_detect(string = starttimes,pattern = 'January')]


# if we want to extract a year (4 digit). 
head(str_extract(string = starttimes,pattern = "[0-9][0-9][0-9][0-9]"), 30)

# it would be very hard to do 16 [] if we are looking for 16 digits. 
head(str_extract(string = starttimes,pattern = "[0-9]{4}"), 30)
# or another way:
head(str_extract(string = starttimes,pattern = "\\d{4}"), 30)


# how to find a string that contain 1, 2, or 3 digit:
head(str_extract(string = starttimes,pattern = "\\d{1,3}"), 30)
# Same as Regex in python, ^ means begining of the line. 
head(str_extract(string = starttimes,pattern = "^\\d{4}"), 30)
# and $ is at the end of the line- which means in this case 
#the only date os the 4 digit year
head(str_extract(string = starttimes,pattern = "^\\d{4}$"), 30)

# to replace, use str_replace, which replaces only the first match. 
head(str_replace(string = starttimes,pattern = "\\d", 
                 replacement = 'x'), 30)

#if we need to replace all matches:
head(str_replace_all(string = starttimes,pattern = "\\d", 
                     replacement = 'x'), 30)
#if we nedd to replace all digit strings with a single x:

head(str_replace_all(string = starttimes,pattern = "\\d{1,4}", 'x'), 30)



# if we a scraping a website for info: 
comm <- c("<a href=index.html> the link is here</a>",
          "<b>this is bold text</b>")
comm
# we need to extract the info: we need to do a lazy wild card search.
# < start of search, . is a wildcard will search for 1 character
                    # + means search for all characters
                    # ? to stop the search once you hit the ending >
#"<a href=index.html> the link is here</a>"
#[2] "<b>this is bold text</b>"                

#> str_replace(string = comm,pattern = "<.+?>(.+?)<.+>", replacement = "\\1")
#[1] " the link is here" "this is bold text"
str_replace(string = comm,pattern = "<.+?>(.+?)<.+>", replacement = "\\1")

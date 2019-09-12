
# ifelse is to check the if statements on a vector. - similar to excel. this is a boolean check. 

# doing an ifelse check on single numbers is wasteful. 

# let's try it on a vector. for complicated tests , we need compound statements. 

a <- c(1,1,0,1)
b <- c(2, 1, 0, 1)

ifelse(a == 1 & b ==1, 'Yes', 'No')
# & means end and | means or
# && means check first vector only
# || means check first vector only

ifelse(a == 1 && b ==1, 'Yes', 'No')
ifelse(totest == 1, totest * 3, totest)


# nested ifelse statement:

ifelse(b ==1, "Hi", ifelse(b==0, 'Hello', 'GoodBye') )


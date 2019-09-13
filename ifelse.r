
# ifelse is to check the if statements on a vector. - similar to excel. 

ifelse(1 == 1, 'Yes', 'No')

# doing an ifelse check on single numbers is wasteful. 

# let's try it on a vector. 

totest <- c(1,1,0,1,0,1)
ifelse(totest == 1, 'Yes', 'No')

ifelse(totest == 1, totest * 3, totest)

ifelse(totest == 1, totest * 3, "Zero")
totest[2] <- NA
ifelse(totest == 1, totest * 3, "Zero")

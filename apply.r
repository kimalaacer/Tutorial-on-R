# R uses apply, s apply and other for loop iteration. 

thematrix <- matrix(1:9,nrow = 3)
thematrix
# apply always requires a matrix, not dataframes. if you supply dataframes, it will get converted to matrix. 
apply(thematrix, MARGIN = 2,sum) 
# Margin = 1 for rows, and margin = 2 for columns.
apply(thematrix, MARGIN = 1,sum)
# similar results could be retreived by using colsums and rowsums. 
colSums(thematrix)
rowSums(thematrix)
# in case of missing data in the matrix:
thematrix [2, 1] <- NA
thematrix
apply(thematrix, MARGIN = 1,sum) # the result of having a missing data is the sum of the netire row is NA. Even with rowsums. 
rowSums(thematrix)

# if we need to ignore the NA and still sum-it - you have to add na.rm = TRUE: 
apply(thematrix, MARGIN = 1,sum, na.rm = TRUE)
rowSums(thematrix, na.rm = TRUE)

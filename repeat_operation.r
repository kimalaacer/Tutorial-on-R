# repetaing an operation on a list - using an iterator such as lapply. 

thelist <- list(A = matrix(1:9, nrow = 3), 
                B = 1:5, 
                C = matrix(1:4, 2), 
                D = 2)
thelist
# we can use a for loop to iterate on 
#every list for sum sums or use lapply
lapply(thelist, sum)

# when you use lapply, the result will also be a list, and retains 
# the same headers, such as : $A [1] 45
#                             $B [1] 15
#                             $C [1] 10
#                             $D [1] 2
# if we need the result to be a vector: sapply wil try to do it: 
#A  B  C  D 
#45 15 10  2

sapply(thelist, sum)

thenamesvector <- c('Jared', 'Chady', 'Deb', 'Paul')
lapply(thenamesvector, nchar)



# mapply is to iterate on 2 different list on the same time.
#for loop can do it, or maplly

firstlist <- list(A = matrix(1:16, 4), B = matrix(1:16, 2), C = 1:5)
secondlist <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), C = 15:1)

mapply(identical, firstlist, secondlist)
# mapply takes function as first arg instead of a list. 

simplefunction <- function(x, y)
{
     NROW(x) + NROW(y)
}
mapply(simplefunction, firstlist, secondlist)

firstlist
secondlist

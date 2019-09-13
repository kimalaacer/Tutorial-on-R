
hello.person <- function(first, last="Doe")
{
  print(sprintf("Hello %s %s", first, last))
}

hello.person('chady', 'Meroueh')
do.call('hello.person', args=list(first = 'chady',last = 'Meroueh'))
# args has to be a list. 
#function can be a vector or not.
do.call(hello.person, args=list(first = 'chady',last = 'Meroueh'))



run.this <- function(x, func = mean)
{
  do.call(func, args = list(x))
  
}  
run.this(1:10)


run.this(1:10, mean)


run.this(1:10, sum)

run.this(1:10, sd)

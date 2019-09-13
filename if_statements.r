tocheck <- 1
if(tocheck ==1)
{
  print('Hello')
}

#stagger if with else such is in Python

check.bool <- function(x)
{
  if(x == 1)
  {
    print('Hello')
  } else 
  {
    print("GoodBye")
  }
}

check.bool(1)
check.bool(0)

check.bool(TRUE)
check.bool('k')

check.bool <- function(x)
{
  if(x == 1)
  {
    print('Hello')
  } else if(x == 0) # similar to elif in python
  {
    print('confused') 
  } else
  {
    print("GoodBye")
  }
  
}
check.bool(1)
check.bool(0)

check.bool(TRUE)
check.bool('k')

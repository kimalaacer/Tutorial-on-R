
sprintf("hello %s", 'Jared')

sprintf("hello %s, today is %s", 'Jared', 'Sunday')

sprintf("hello %s, today is %s", 'Jared', 'Saturday')


hello.person <-  function(name)
{
  print(sprintf("Hello %s", name))
}  

hello.person('Jared')
hello.person('Bob')
hello.person('Sarah')
hello.person <-  function(first, last)
{
  print(sprintf("Hello %s %s", first, last))
}  

hello.person('Chady', 'Meroueh')
# the function takes the arguments positionaly. or we can specify them like below. 
hello.person(last='Meroueh', first = 'Chady')
#default arguments are easier. 

hello.person <-  function(first, last="Doe")
{
  print(sprintf("Hello %s %s", first, last))
}  
hello.person('Chady', 'Meroueh')
hello.person('Chady')

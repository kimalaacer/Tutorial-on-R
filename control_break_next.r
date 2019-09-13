

for (i in 1:10)
{
  if (i==3) 
    {
    next # this means the loop will skip when i == 3
  } 
  print(i)
}


for (i in 1:10)
{
  if (i==4) 
  {
    break # this means the loop will terminate at i == 4
  } 
  print(i)
}

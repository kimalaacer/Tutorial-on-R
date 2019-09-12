
# check with many compounds with else. 

use.switch <- function(x)
{
  switch(x, 
         'a' = 'first',
         'b' = 'second',
         'c' = 'third',
          'z' = 'last',
         'other')
}

use.switch(a)
use.switch('a')
use.switch('d')
use.switch('z')
use.switch(1) # the number 1 refers to the position of first args. 
use.switch(17)
is.null(use.switch(17))

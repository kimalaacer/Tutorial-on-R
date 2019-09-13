
ggplot(diamonds,aes(x=carat, y= price)) +geom_point()

#instead of having to rewrite the ggplot multiple times, we assign it as a variable.

g <- ggplot(diamonds,aes(x=carat, y= price)) # this is a variable.

g + geom_point()

g + geom_point(aes(color=color))


ggplot(diamonds,aes(x=carat, y= price)) +geom_point()

#instead of having to rewrite the ggplot multiple times, we assign it as a variable.

g <- ggplot(diamonds,aes(x=carat, y= price)) # this is a variable.

g + geom_point()

g + geom_point(aes(color=color))


g + geom_point(aes(color=color, shape=clarity))
# The shape palette can deal with a maximum of 6 discrete values
  #because more than 6 becomes difficult to discriminate; you have
  # 8. Consider specifying shapes manually if you must have them.
  #too busy plot.

g + geom_point(aes(color=color, shape=cut))

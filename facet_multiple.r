

g <- ggplot(diamonds, aes(x = carat, y = price))

g + geom_point(aes(color = color)) + facet_wrap(~color)

g + geom_point(aes(color = color)) + facet_grid(cut~clarity)


ggplot(diamonds, aes(x = carat)) +geom_histogram() +facet_wrap(~color)



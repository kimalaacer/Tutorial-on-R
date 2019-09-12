




install.packages("ggthemes")


require (ggthemes)


ggplot(diamonds, aes(x = carat, y = price, color = color)) +geom_point()
g <- ggplot(diamonds, aes(x = carat, y = price, color = color)) +geom_point()

g+ theme_wsj()

g+theme_economist() + scale_color_economist()

g+ theme_tufte()

g+theme_excel() +scale_color_excel()

g+theme_excel_new() +scale_color_excel_new()

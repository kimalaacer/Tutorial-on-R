# boxplot for 1 variable data. 
# box have 50% of data, outside of box is the other 50%. 
# outliers are above the whiskers line, which is 1.5 x the inter-quartile range (=3rd - 1st quartile)

# box = lower = 1rst quartile
#  upper = 3 rd quartile
# thick line: median 

boxplot(diamonds$carat)

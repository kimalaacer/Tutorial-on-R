
# based on lesson 9 - Basic stats in R
#R for Everyone: Advanced Analytics and Graphics, By Jared P. Lander.  
#R Programming LiveLessons (Video Training): Fundamentals to Advanced

############ 1. Draw numbers from probability distribution:
rnorm(10)

rnorm(10, mean = 100, sd = 20)

randnorm10 <- rnorm(10)
randnorm10
# dnorm is for density: the probability of a number. 
dnorm(x = randnorm10)

dnorm(c(-1, 0, 1))
require(ggplot2)
randnorm <- rnorm(30000)
randdensity <- dnorm(randnorm)
ggplot(data = data.frame(x = randnorm, y = randdensity)) + aes(x = x,y = y) +
     geom_point() + labs(x = 'Random Variables', y = 'Density / probability')

#pnorm will give the probability to the left of the number. 
pnorm(c(-3, 0, 3))

#[1] 0.001349898 0.500000000 0.998650102 there is a 0.13 % probability of 
# getting a number below -3. 50% below 0, and 99.86% below 3. 

# if we want to calculate the probability of a number between 0 and 1: 
pnorm(1) - pnorm(0)

#qnorm is for quantile: given a probalibity, it tells you what 's the number?
randnorm10
pnorm(randnorm10)
qnorm(pnorm(randnorm10))

# binomial distribution: Binary. 
rbinom(n = 1,size = 10,prob = 0.4)

rbinom(n = 5,size = 10,prob = 0.4)

rbinom(n = 10,size = 10,prob = 0.4)

rbinom(n = 10,size = 1,prob = 0.4)

binomdata <- data.frame(Success= rbinom(n = 10000,size = 10,prob = 0.3))
ggplot(data = binomdata,aes(x = Success)) + geom_histogram(binwidth = 1)

binom5 <- data.frame(Success= rbinom(n = 10000,size = 5,prob = 0.3), size = 5)
binom10 <- data.frame(Success= rbinom(n = 10000,size = 10,prob = 0.3), size = 10)
binom100 <- data.frame(Success= rbinom(n = 10000,size = 100,prob = 0.3), size = 100)
binom1000 <- data.frame(Success= rbinom(n = 10000,size = 1000,prob = 0.3), size = 1000)

binomall <- rbind(binom5, binom10, binom100, binom1000)

ggplot(data = binomall, aes(x = Success)) + geom_histogram() + 
     facet_wrap(~size,scales = 'free' )

#distribution of a random variable. 
# dbinom: what is the probality of 3 successes out of 10 tries 
# when the probability of any success is 3. 
dbinom(x = 3,size = 10,prob = 0.3)
# pbinom: what is the probality of <=3 successes out of 10 tries 
# when the probability of any success is 3. 

pbinom(q = 3,size = 10,prob = 0.3)

# quantile: qbinom
qbinom(p = 0.3,size = 10,prob = 0.3)
qbinom(p = c(.3, .35, .4, .5, .6),size = 10,prob = 0.3)

# Poisson distribution: 
# The Poisson distribution is popular for modelling the
# number of times an event occurs in an interval of time or space.
# Example: The number of photons hitting a detector in a particular 
# time interval
# rpois, dpois, qpois

pois1 <- rpois(n = 10000,lambda = 1)
pois2 <- rpois(n = 10000,lambda = 2)
pois5 <- rpois(n = 10000,lambda = 5)
pois10 <- rpois(n = 10000,lambda = 10)
pois20 <- rpois(n = 10000,lambda = 20)

poisall <- data.frame(lambda.1 = pois1,
                      lambda.2 = pois2,
                      lambda.5 = pois5,
                      lambda.10 = pois10,
                      lambda.20 = pois20)
head(poisall)
# to plot this, we need a long format and not wide format. we need
# to use package reshape2 and melt function. 
require(reshape2)
meltedpois <- melt(data = poisall,variable.name = "Lambda",value.name = 'x') 
require(stringr)
#we need to remove lambda. from the column Lambda
meltedpois$Lambda <- str_extract(string = meltedpois$Lambda,pattern = '\\d+')
head(meltedpois)
class(meltedpois$Lambda)

# we need to make sure that the value in the column Lambda are 
# factors and not characters to work better in ggplot. 

meltedpois$Lambda <- as.factor(as.numeric(x = meltedpois$Lambda) )
class(meltedpois$Lambda)

ggplot(data = meltedpois, aes(x = x)) +geom_density(aes(group = Lambda,
                                                        color = Lambda,
                                                        fill = Lambda), 
                                                  adjust = 4, alpha = 1/2) +
     scale_color_discrete() + scale_fill_discrete() + 
     ggtitle('Probability Mass Function')

############ 2. Averages, SD, & Correlations.

x <- sample(x = 1:100, size = 100, replace = TRUE)
mean(x)
y <- x
y[sample(x = 1:100, size = 20,replace = FALSE)] <- NA
y
# the mean of a set of data that have a single NA is NA, to fix it:
mean(y, na.rm = TRUE )
# weighted mean: the value x * probability of x.

grades <- c(95, 72,87,66)
weights <- c(1/2, 1/4, 1/8, 1/8)
mean(grades)
weighted.mean(x = grades,w = weights)
 # measure of uncertainity - Variance= the sum of each observation  - the average 
# value, squared, divided the number of observation -1. 
# variance represents how far is a given value away from the center. 
# The smaller the variance, the more confident you are about your result
# var(x ) = sum ((x-mean(x))^2) / (length(x) - 1)
var(x)
sum ((x-mean(x))^2) / (length(x) - 1)
# sd = sqrt(var(x))
sqrt(var(x))
sd(x)


summary(x)
quantile(x = x,probs = c(.01, .1, .25,.5,.75,.9,.99))
# to find correlation between 2 variables: cor()

head(economics)
cor(x = economics$pce, y = economics$psavert)

cor(economics[, c(2, 4:6)])
econcor <- cor(economics[, c(2, 4:6)])

econmelt <- melt(econcor, varnames = c('x', 'y'), 
                 value.name = 'Correlation')

econmelt <- econmelt[order(econmelt$Correlation)]

ggplot(data = econmelt, aes(x = x,y = y)) +
     geom_tile(aes(fill = Correlation)) + 
     scale_fill_gradient2(low = 'red', mid = 'white', high = 'steelblue', 
                         guide = guide_colorbar(ticks = FALSE, barheight = 10),
                         limits = c(-1, 1)) +
     theme_minimal() + labs(x =NULL, NULL)


############ 3. t-test Vs. ANOVA.

data('tips', package = 'reshape2')
# two.sided: whether or not the tip is equal to 2.5$, 
# one sample t test
t.test(tips$tip, alternative = 'two.sided', mu = 2.5)

randt <- rt(30000, df = NROW(tips)-1)
tipttest <- t.test(tips$tip, alternative = 'two.sided', mu = 2.5)
ggplot(data = data.frame(x = randt)) +
     geom_density(aes(x = x), fill = 'grey', color = 'grey') +
     geom_vline(xintercept = tipttest$statistic) +
     geom_vline(xintercept = mean(randt) + c(-2, 2)*sd(randt), linetype = 2)


t.test(tips$tip, alternative = 'greater', mu = 2.5)
# ANOVA and t-test are for small datasets. 
# two sample test for t.test,  with similar ANOVA. 

#two sample t.test

aggregate(tip ~sex, data = tips,mean)

aggregate(tip ~sex, data = tips,var)

# some test require that the data be normally distributed. 
# to test : Shapiro-Wilk normality test
#    data:  tips$tip
# W = 0.89781, p-value = 8.2e-12: since p is close to 0: data is not
#normally distributed. and we can not use parametric test 
# for equality of variances. 
shapiro.test(tips$tip)


shapiro.test(tips$tip[tips$sex == 'Female'])

shapiro.test(tips$tip[tips$sex == 'Male'])

ggplot(data = tips, aes(x = tip, fill = sex)) + 
     geom_histogram(binwidth = .5, alpha = 1/2)

# in this case we use ansari bradley non-parametric test

ansari.test(tip ~ sex, data = tips, var.equal = TRUE) 
#if var.equal is set to false, it will run Welch's t test


require(plyr)
tipsummary <- ddply(.data = tips, 'sex', summarize, 
                    tip.mean = mean(tip), tip.sd = sd(tip), 
                    Lower = tip.mean - 2*tip.sd/sqrt(NROW(tip)), 
                    Upper = tip.mean + 2*tip.sd/sqrt(NROW(tip)))

tipsummary
ggplot(data = tipsummary, aes(x = tip.mean, y = sex)) +
     geom_point() +
     geom_errorbarh(aes(xmin = Lower, xmax = Upper), height = .2)

# paired t test
# A paired t test (also called a correlated pairs t-test, 
# a paired samples t test or dependent samples t test) is 
# where you run a t test on dependent samples. 
# Dependent samples are essentially connected - they are tests 
# on the same person or thing. For example:
#         Knee MRI costs at two different hospitals,
#         Two tests on the same person before and after training,
#         Two blood pressure measurements on the same person 
#              using different equipment.
install.packages(UsingR)
require(UsingR)
head(father.son)

t.test(x = father.son$fheight, y = father.son$sheight, paired = TRUE)


# 3 or more samples : use ANOVA:
tipanova <- aov(tip ~ day -1, tips)
tipintercept <- aov(tip ~ day, tips)
tipanova$coefficients
tipintercept$coefficients
summary(tipanova)


tips.by.day <- ddply(tips, "day", summarise, 
                     tip.mean = mean(tip),
                     tip.sd = sd(tip),
                     Length = NROW(tip),
                     tfrac = qt(p = .90, df = Length - 1),
                     Lower = tip.mean - tfrac * tip.sd / sqrt(Length),
                     Upper = tip.mean + tfrac * tip.sd / sqrt(Length))


ggplot(data = tips.by.day, aes(x = tip.mean, y = day)) +
     geom_point() + 
     geom_errorbarh(aes(xmin=Lower, xmax=Upper), height = .3)



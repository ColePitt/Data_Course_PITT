#  loads the mtcars data set
data(mtcars)
summary(mtcars)
str(data)

data <- mtcars

library(tidyverse)
library(dplyer)
library(ggplot2)


#  subsets the mtcars dataframe to include only **automatic transmissions**
auto = subset(mtcars)
auto = subset(mtcars, am == 0)

# saves this new subset as a new file called "automatic_mtcars.csv" in your Assignment_5 directory
write.csv(auto, file = "./automatic_mtcars.csv")


#  plots the effect of horsepower on miles-per-gallon (update plot to have meaningful labels and title)
ggplot(data = mtcars, aes(y = hp, x = mpg)) + xlab("Miles-per-gallon") + ylab("Horsepower") +
  geom_point() + ggtitle("Effect of horsepower on miles-per-gallon") + 
  theme(plot.title = element_text(hjust = .5)) + geom_smooth()

#  saves this plot as a png image called "mpg_vs_hp_auto.png" in your Assignment_5 directory
png('mpg_vs_hp_auto.png')
ggplot(data = mtcars, aes(y = hp, x = mpg)) + xlab("Miles-per-gallon") + ylab("Horsepower") +
  geom_point() + ggtitle("Effect of horsepower on miles-per-gallon") + 
  theme(plot.title = element_text(hjust = 0.5)) + geom_smooth()
dev.off()


#  plots the effect of weight on miles-per-gallon (with improved labels, again)
ggplot(data = mtcars, aes(y = wt, x = mpg)) + xlab("Miles-per-gallon") + ylab("Weight") +
  geom_point() + ggtitle("Effect of weight on miles-per-gallon") + 
  theme(plot.title = element_text(hjust = .5)) + geom_smooth()


#  saves this second plot as a **tiff** image called "mpg_vs_wt_auto.tiff" in your Assignment_5 directory
tiff('mpg_vs_wt_auto.tiff')
ggplot(data = mtcars, aes(y = wt, x = mpg)) + xlab("Miles-per-gallon") + ylab("Weight") +
  geom_point() + ggtitle("Effect of weight on miles-per-gallon") + 
  theme(plot.title = element_text(hjust = 0.5)) + geom_smooth()
dev.off()


#  subsets the original mtcars dataframe to include only cars with displacements less than or equal to 200 cu.in.
disp200 = subset(mtcars, disp <= 200)

#  saves that new subset as a csv file called mtcars_max200_displ.csv
write.csv(disp200, file = "./mtcars_max200_displ.csv")

# includes code to calculate the maximum horsepower for each of the three dataframes (original, automatic, max200)
max(data$hp)
max(auto$hp)
max(disp200$hp)

# prints these calculations (from task 10) in a readable format to a new plaintext file called 

a = max(mtcars$hp)
b = max(auto$hp)
c = max(disp200$hp)

capture.output(a, file = "hp_maximums.txt", append = TRUE)
capture.output(b, file = "hp_maximums.txt", append = TRUE)
capture.output(c, file = "hp_maximums.txt", append = TRUE)





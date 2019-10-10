library(modelr)
library(broom)
library(dplyr)
library(fitdistrplus)
library(tidyr)


data("mtcars")
glimpse(mtcars)

mod1 = lm(mpg ~ disp, data = mtcars)
summary(mod1)


# Website for more  https://feliperego.github.io/blog/2015/10/23/Interpreting-Model-Output-In-R


plot(mtcars$mpg ~ mtcars$disp)
abline(mod1)

# Question for Zahn, Where do you find the residual numbers? Do you have to write a command for each one?

mod2 = lm(mpg ~ qsec, data = mtcars)
plot(mtcars$mpg ~ mtcars$qsec)
abline(mod2, col="Blue")

#Question for Zahn, How do you know when to use the data frame first or not?

mean(mod1$residuals^2)
mean(mod2$residuals^2)

## Mod1 is a better graph because the residuals are less than mod2

## The add_predictions() function from the modelr package lets us take our data frame and our model and look at what values our model assigns to our response variable (mpg). This is looking at ACTUAL vs PREDICTED values.
+ If they are close enough for comfort we can move on and make predictions for unknown values in our model.

# Make a new dataframe with the predictor values we want to assess
# mod1 only has "disp" as a predictor so that's what we want to add here

newdf = data.frame(disp = c(500,600,700,800,900))

predictions = predict(mod1, newdata = newdf)

# plot those predictions on our original graph

plot(mtcars$mpg ~ mtcars$disp,xlim=c(0,1000),ylim=c(-10,50)) +
  points(x=newdf$disp,y=predictions, col="Red") +
  abline(mod1)

#ASSIGNMENT TIME

+ Make a new Rproj and Rscript in your personal Assignment_7 directory and work from there.
+ Write a script that:
  1.  loads the "/Data/mushroom_growth.csv" data set
2.  creates several plots exploring relationships between the response and predictors
3.  defines at least 2 models that explain the **dependent variable "GrowthRate"**
  + One must be a lm() and 
+ one must be an aov()
4.  calculates the mean sq. error of each model
5.  selects the best model you tried
6.  adds predictions based on new values for the independent variables used in your model
7.  plots these predictions alongside the real data
+ Upload responses to the following as a numbered plaintext document to Canvas:
  1.  Are any of your predicted response values from your best model scientifically meaningless? Explain.
2.  In your plots, did you find any non-linear relationships?  If so, do a bit of research online and give a link to at least one resource explaining how to deal with this in R




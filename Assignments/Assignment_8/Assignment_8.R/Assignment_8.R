# Make a new Rproj and Rscript in your personal Assignment_7 directory and work from there.
# Write a script that:
 
  
library(modelr)
library(broom)
library(dplyr)
library(fitdistrplus)
library(tidyr)
  
#1.  loads the "/Data/mushroom_growth.csv" data set

dat <- read.csv("../../../../Data_Course/Data/mushroom_growth.csv")
glimpse(dat)

#2.  creates several plots exploring relationships between the response and predictors

mod1 = lm(GrowthRate ~ Light, data = dat)
mod2 = lm(GrowthRate ~ Temperature, data = dat)
mod3 = lm(GrowthRate ~ Species, data = dat)

plot(dat$GrowthRate ~ dat$Temperature)
plot(dat$GrowthRate ~ dat$Light)
plot(dat$GrowthRate ~ dat$Species)
plot(dat$GrowthRate ~ dat$Humidity)

lm(GrowthRate ~ Temperature, data = dat)


#This did not work
ggplot(dat, aes(x=Species, y=GrowthRate, color=Light))


#This did not do anything, are my choices wrong?
abline(mod1)



#3.  defines at least 2 models that explain the **dependent variable "GrowthRate"**
#  + One must be a lm() and 
#+ one must be an aov()

model1 = lm(GrowthRate ~ Light, data = dat)
model2 = aov(GrowthRate ~ Temperature:Humidity, data=dat)


plot(dat$GrowthRate ~ dat$Temperature:dat$Humidity)
# lm(GrowthRate ~ Temperature:Humidity, data = dat)

#Why does this keep popping up? 

Hit <Return> to see next plot: newdf = data.frame(disp = c(500,600,700,800,900))
Hit <Return> to see next plot: predictions = predict(mod1, newdata = newdf)
> plot(dat$GrowthRate ~ dat$Temperature:dat$Humidity)
Hit <Return> to see next plot: 
#4.  calculates the mean sq. error of each model

mean(model1$residuals^2)
mean(model2$residuals^2)

#5.  selects the best model you tried


mod1 = lm(GrowthRate ~ Light, data = dat)

#6.  adds predictions based on new values for the independent variables used in your model

predict(mod1)


#   7.  plots these predictions alongside the real data
#   + Upload responses to the following as a numbered plaintext document to Canvas:

#   1.  Are any of your predicted response values from your best model scientifically meaningless? Explain.
I have no Flippin clue lol

#   2.  In your plots, did you find any non-linear relationships?  If so, do a bit of research online and give a link to at least one resource explaining how to deal with this in R


#I. 	Simple tidying exercise

library(ggplot2)
library(modelr)
library(broom)
library(dplyr)
library(fitdistrplus)
library(tidyr)


#1.  Read in salaries.csv (needs some tidying)
data = read.csv("../../../Data_Course/Exam_2/salaries.csv")


#This is faculty salary information from 1995 - Split up by university, state, faculty rank, and university tier  
  #Faculty "Rank" progresses from "AssistProf" to "AssocProf" to "FullProf"

#2.  Convert to a usable tidy format so we can look at "Salary" as a dependent variable (10 points)


dat1 = gather(data, key = "Rank", value = "Salary", c(5:7))
#3.  Using ggplot, create boxplot of salary (y-axis) by University Tier (x-axis), filled by Faculty Rank (10 points)
#x-axis = Tier
#y-axis = Salary
#Boxplot fill color = Rank
#Title = "Faculty Salaries - 1995"


ggplot(dat1, aes(x=Tier, y= Salary, color = Rank)) + ggtitle("Faculty Salaries - 1995") +
  geom_boxplot(outlier.color="black",
               outlier.size=2, notch=FALSE) 

library(scales)

ggplot(dat1, aes(x=Tier, y= Salary, color = Rank)) + ggtitle("Faculty Salaries - 1995") +
  geom_boxplot(outlier.color="black",
               outlier.size=2, notch=FALSE) + scale_y_continuous(labels = comma)

#4.  Export this delightful boxplot to a file named "LASTNAME_exam2_plot1.jpeg" (10 points)
#        x tier       y salary         fill rank         boxplot       title "Faculty Salaries - 1995"

jpeg("PITT_exam2_plot1.jpeg")
ggplot(dat1, aes(x=Tier, y= Salary, color = Rank)) + ggtitle("Faculty Salaries - 1995") +
  geom_boxplot(outlier.colour="black", outlier.shape=16,
               outlier.size=2, notch=FALSE) + scale_y_continuous(labels = comma)
dev.off()



#II. Linear modeling and predictions

#1.  Read in atmosphere.csv (pretty clean data set)

dat2 = read.csv("../../../Data_Course/Exam_2/atmosphere.csv")



#SampleID - The unique sample ID for the observation (dd-mm-YYYY)
#Year - What do you think?
  #Quarter - Q1 = Jan/Feb/Mar, Q2 = Apr/May/Jun, etc
#Month - This stands for "Magpie ovulation number..." no, it's just Month    ##GOOD ONE 
#        Mday - Day of the month
 #       BarcodeSequence - Not important
  #      Aerosol_Density - Number of detectable particles in the air sample per cubic cm
   #     CO2_Concentration - CO2 ppm on the day the sample was taken
    #    Diversity - Number of different fungal species found in the air sample
     #   Precip - Precipitation on the sampling day (mm)
   
#    2.  Create three different linear models with Diversity as the dependent variable. The three models should have different
#	predictors, or at least different numbers of predictors, with or without interaction terms. (10 points)


#        3     LM    WITH      DIFFERENT      PREDICTORSS
mod1 = lm(Diversity ~ Aerosol_Density , data = dat2)


summary(mod1)

plot(dat2$Diversity ~ dat2$Aerosol_Density)
abline(mod1, col="Blue")

mean(mod1$residuals^2)





mod2 = lm(Diversity ~ Aerosol_Density*Precip, data = dat2)

summary(mod2)

plot(dat2$Diversity ~ dat2$Aerosol_Density*dat2$Precip)


abline(mod2, col="Blue")

mean(mod2$residuals^2)




mod3 = lm(Diversity ~ CO2_Concentration , data = dat2)

summary(mod3)

plot(dat2$Diversity ~ dat2$CO2_Concentration)
abline(mod3, col="Blue")

mean(mod3$residuals^2)


    

#    3.  Compare the residuals of the three models and somehow document which has best explanatory power for the data (10 points)

mean_mod1 = mean(mod1$residuals^2)
mean_mod2 = mean(mod2$residuals^2)
mean_mod3 = mean(mod3$residuals^2)

comparedf = data.frame(mean_mod1, mean_mod2,mean_mod3)
new_mod = gather(comparedf,key = Model, value = Mean, c(1:3))
new_mod$Model[new_mod$Mean == min(new_mod$Mean)]

    
#    4.  Use all your models to predict Diversity values in the data set (10 points)

pred1 = add_predictions(dat2, mod1, var = "Model_1")
pred2 = add_predictions(pred1, mod2, var = "Model_2")
predictions = add_predictions(pred2, mod3, var = "Model_3")




#    5.  Make a plot showing actual Diversity values, along with the three models' predicted Diversity values.
#Use color or some other aesthetic to differentiate the actual values and all three predictions (20 points)
#Hint: gather_predictions()   ...wait, what is this magical function!? Maybe this hint should be for #4 ???

ggplot(predictions, aes(x = Aerosol_Density, y = Diversity)) +
  geom_point() +
  geom_point(aes(y= Model_1), color = "Red") +
  geom_point(aes(y= Model_2), color = "Blue") +
  geom_point(aes(y= Model_3), color = "Green")



#6.  Write code to show the predicted values of Diversity for each model using the hypothetical new data 
#found in hyp_data.csv (10 points)

dat = read.csv("../../../Data_Course/Exam_2/hyp_data.csv")
datpred1 = add_predictions(dat, mod1, var = "Model_1")
datpred2 = add_predictions(datpred1, mod2, var = "Model_2")
datprediction = add_predictions(datpred2, mod3, var = "Model_3")


ggplot(datprediction, aes(x = Aerosol_Density, y = Model_3)) +
  geom_point() +
  geom_point(aes(y= Model_1), color = "Red") +
  geom_point(aes(y= Model_2), color = "Green") 


#7.  Export a text file that contains the summary output from *both* your models to "model_summaries.txt" (10 points)
#(Hint: use the sink() function)
?sink
  
a <- summary(mod1)
b <- summary(mod2)
c <- summary(mod3)

capture.output(a, file = "model_summaries.txt", append = TRUE)
capture.output(b, file = "model_summaries.txt", append = TRUE)
capture.output(c, file = "model_summaries.txt", append = TRUE)


#*Bonus*
#  8.  Add these hypothetical predicted values (from hypothetical data - Part II, Step 6) to a plot of actual data 
#  and differentiate them by color. (10 bonus points possible for a pretty graph)


ggplot() +
  geom_point(data=predictions, aes(x = Aerosol_Density, y = Diversity), color='black') + 
  geom_point(data=datprediction, aes(x = Aerosol_Density, y = Model_2), color='red') + 
  geom_point(data=datprediction, aes(x = Aerosol_Density, y = Model_1), color='blue') 




#*Bonus*
#  9.  Split the atmosphere.csv data into training and testing sets, randomly. Train your single best model on 50% of the data and 
#test it on the remaining 50% of the data. Find some way to show how well it fits the data.
#This is the only cross-validation part of the exam. (10 bonus points for proper code)


#Push the following to your github web page in your new Exam_2 directory:
#  1.  Your complete R script for ALL the above tasks, saved as LASTNAME_Skills_Test_2.R
#2.  Your plot from Part I
#3.  Any plots generated from Part II
#4.  model_summaries.txt

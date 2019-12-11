library(tidyverse)
library(ggplot2)
library(dplyr)
#Read in Data

data <- read.csv("DNA_Conc_by_Extraction_Date.csv")

#Task1: Histogram of Ben's Data

hist(data$DNA_Concentration_Ben,xlab = "DNA Concentration", main = "Ben's DNA Concentrations")

# Histogram of Katy's Data

hist(data$DNA_Concentration_Katy, xlab = "DNA Concentration", main = "Katy's DNA Concentrations")






#Task2: Ben's Plot Recreation

boxplot(DNA_Concentration_Ben~Year_Collected,data= data, main="Ben's Extractions", 
        xlab="YEAR", ylab="DNA Concentration")

#Task2: Katy's Plot Recreation

boxplot(DNA_Concentration_Katy~Year_Collected,data= data, main="Katy's Extractions", 
        xlab="YEAR", ylab="DNA Concentration")

#Task3: Saving Ben's Plot as JPEG

jpeg('PITT_Plot2.jpeg')
boxplot(DNA_Concentration_Ben~Year_Collected,data= data, main="Ben's Extractions", 
        xlab="YEAR", ylab="DNA Concentration")
dev.off()

#Task3: Saving Katy's Plot as JPEG

jpeg('PITT_Plot1.jpeg')
boxplot(DNA_Concentration_Katy~Year_Collected,data= data, main="Katy's Extractions", 
        xlab="YEAR", ylab="DNA Concentration")
dev.off()

#Task4: Year of Ben's lowest performance relative to Katy's
lowest = data %>% group_by(Year_Collected) %>%
  summarise(avg.diff = abs(mean(DNA_Concentration_Ben) - mean(DNA_Concentration_Katy)))
lowest %>% filter(avg.diff == min(lowest$avg.diff))


difference <- data$DNA_Concentration_Ben - data$DNA_Concentration_Katy

mindifference <- which(difference == min(difference))

data[mindifference,"Year_Collected"]

#Task 5:

down <- data[data$Lab == "Downstairs",]
down$Date_Collected <- as.POSIXct(down$Date_Collected)
plot(x=down$Date_Collected,y=down$DNA_Concentration_Ben)

jpeg('Ben_DNA_over_time.jpeg')
plot(x=down$Date_Collected,y=down$DNA_Concentration_Ben)
dev.off()


#Highest Average DNA Concentration

ben_sub = data %>% group_by(Year_Collected) %>%
  summarise(Bens_Average = mean(DNA_Concentration_Ben))

ben_sub

write.csv(ben_sub, "Ben_Average_Conc.csv")


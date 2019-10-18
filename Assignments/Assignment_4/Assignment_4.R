#Read in the data
data = read.csv("../../../Data_Course/Data/ITS_mapping.csv", sep ="\t")

#Explore the Data
summary(data)
class(data$Ecosystem)
class(data$Lat)
summary(data$Ecosystem)

#Box plot of ecosystem and Lat
boxplot(Lat~Ecosystem,data= data, main="Ecosystem & Lat", xlab="Ecosystem", ylab="Lat", col=df$region) 
#Saving png of Boxplot
png(filename = "./silly_boxplot.png")
boxplot(Lat~Ecosystem,data= data, main="Ecosystem & Lat", xlab="Ecosystem", ylab="Lat")
dev.off()

#Answers to questions 

#1. What other stuff does read.csv() do automatically? 
  
#  Separates the values by commas. dec = "." which denotes that a period means a decimal point in the file.  fill = automatically true which means that in case the rows have unequal length, blank fields get added  

#2. How is it different from read.csv2()? 
  
#  read.csv2() separates values using a semi colon sep = ";"

#3. Why does read.csv2() even exist? 
  
  
#  for countries that use a comma as decimal point and a semicolon as field separator. frickin UK

#4. How could I change the parameters of read.csv() to make it so the class of the “State”
# column is “character” instead of “factor?” 


# you can change the parameters for calling the columns per individual column see following code: df <- read.csv("../../Data/landdata-states.csv", colClasses=c("State"="character")) 
df <- read.csv("../../../Data_Course/Data/landdata-states.csv", colClasses=c("State"="character")) 

#5. What command would give the summary stats for ONLY the Home.Value column? 
  
summary(df$Home.Value)

# 6. What value is returned by the command: 
names(df)[4] 

[1] "Home.Value"


#7. What is happening when you add (. . . col=df$region) to the above plotting code? 
  
  The plot is now colored by region 

library(readr)
dataset <- DNA_Conc_by_Extraction_Date
View(dataset)


#1 create separate histograms of the DNA concentrations for Katy and Ben.
    #Make sure to add nice labels to these (x-axis and main title).
    
    
dataset
?hist
hist(dataset$DNA_Concentration_Katy, main = "Katy", xlab= "Concentration")

hist(dataset$DNA_Concentration_Ben, main = "Benny", xlab= "Concentration")
hist()



#2 look at DNA concentrations from the different extraction years. 
#One way to do this is a separate figure for each 
  #student is demonstrated in those two files:	ZAHN_Plot1.jpeg and ZAHN_Plot2.jpeg 
#Open those files in some image viewing program and take a look. 
  #I'd like you to re-create these exactly, including the labels.
#This is tricky, so I'll give a hint: the plot() function behaves differently depending on 
  #the classes of vectors that are given to it.
    

####Y CONCENTRATION X YEAR   BOX 
?plot

#KATY
#?as.()\
str(dataset)
dataset$DNA_Concentration_Katy

dataset$Year_Collected <- factor(dataset$Year_Collected)

?plot()

plot(x= dataset$Year_Collected,y=dataset$DNA_Concentration_Katy,main="Katys Extractions", ylab="DNA Concentration",) 
  
    


#BENNY
plot(x= dataset$Year_Collected,y=dataset$DNA_Concentration_Ben,main="Bens Extractions", ylab="DNA Concentration")
    

#3.

####Once you have your code for creating the figures correctly, you need to save those two 
#images in YOUR Exam_1 directory. Name them similarly to how I named mine, but with your LASTNAME
#Make sure your code is saving the files. Don't do it manually with the mouse!


jpeg("./PITT_Plot1.jpeg")
plot(x= dataset$Year_Collected,y=dataset$DNA_Concentration_Katy,main="Katys Extractions", ylab="DNA Concentration",) 

dev.off()

jpeg("./PITT_Plot2.jpeg")
plot(x= dataset$Year_Collected,y=dataset$DNA_Concentration_Ben,main="Bens Extractions", ylab="DNA Concentration")

dev.off()


#4.

#### Your task here is to write some code that tells us: in which extraction YEAR, 
#was Ben's performance the lowest RELATIVE TO Katy's performance?

min(dataset$DNA_Concentration_Ben)



#5. Do another subset of the data for me. Subset the data frame so it's just the "Downstairs" lab.
#Now, make a scatterplot of the downstairs lab data such that 
#"Date_Collected" is on the x-axis and "DNA_Concentration_Ben" is on the y-axis. 
#Save this scatterplot as "Ben_DNA_over_time.jpg" in your Exam_1 directory. 
#See the file "Downstairs.jpg" for an example of how yours should look. 
#If it looks different, you might need to do some class conversions so the plot() function treats things correctly. 
#HintHintHint: POSIXct

summary(dataset)
str_split(dataset$Lab,"Upstairs")
c(dataset$Lab

dataset$Lab[,"Downstairs"]


NoUpstairs <- dataset[,c(6 == "Downstairs")]

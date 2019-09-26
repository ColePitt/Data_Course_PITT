# Exam 1 strategy
# This is not the ONLY way to do things, but one workable way:

# I. 	
# Once you get the file loaded into an R object as a data frame, feel free to do some exploratory visualizations or summaries to get a feel for the data if you like.
# Your first task, though, is to create separate histograms of the DNA concentrations for Katy and Ben. Make sure to add nice labels to these (x-axis and main title).
# 

# Load data
read.csv("DNA_Conc_by_Extraction_Date.csv")

# histograms
hist(dat$DNA_Concentration_Katy,xlab="DNA Concentration",main="Katy")
hist(dat$DNA_Concentration_Ben,xlab="DNA Concentration",main="Ben")

# II. 	
# Your second task is to look at DNA concentrations from the different extraction years. 
# One way to do this is a separate figure for each student is demonstrated in those two files:	ZAHN_Plot1.jpeg and ZAHN_Plot2.jpeg 
# Open those files in some image viewing program and take a look. I'd like you to re-create these exactly, including the labels.
# This is tricky, so I'll give a hint: the plot() function behaves differently depending on the classes of vectors that are given to it.
# 

# convert Year into a factor
dat$Year_Collected <- as.factor(dat$Year_Collected)

# plot
plot(x=dat$Year_Collected, y=dat$DNA_Concentration_Katy,xlab="YEAR",
     ylab="DNA Concentration",main = "Katy's Extractions")
plot(x=dat$Year_Collected, y=dat$DNA_Concentration_Ben,xlab="YEAR",
     ylab="DNA Concentration",,main = "Ben's Extractions")

# III.
# Once you have your code for creating the figures correctly, you need to save those two images in YOUR Exam_1 directory. Name them similarly to how I named mine, but with your LASTNAME
# Make sure your code is saving the files. Don't do it manually with the mouse!
# 

# wrap each plotting code with jpeg()
jpeg("ZAHN_Plot1.jpeg")
plot(x=dat$Year_Collected, y=dat$DNA_Concentration_Katy,xlab="YEAR",
     ylab="DNA Concentration",main = "Katy's Extractions")
dev.off()

jpeg("ZAHN_Plot2.jpeg")
plot(x=dat$Year_Collected, y=dat$DNA_Concentration_Ben,xlab="YEAR",
     ylab="DNA Concentration",,main = "Ben's Extractions")
dev.off()

# IV.
# Take a look at Ben's concentrations vs Katy's concentrations. You can do this however you like... with a plot or with summary stats or both.
# It looks like Ben had consistently higher DNA yields than Katy did...but surely it wasn't uniformly better, right? With some samples, he only had a marginal improvement over Katy.
# With other samples, he had a relatively massive improvement over her.
# Your task here is to write some code that tells us: in which extraction YEAR, was Ben's performance the lowest RELATIVE TO Katy's performance?
# 

# Find difference between Ben and Katy
difference <- dataset$DNA_Concentration_Ben - dataset$DNA_Concentration_Katy

# find maximum difference
mindifference <- which(difference == min(difference))

# use that to find the year in which it occurred
dataset[mindifference,"Year_Collected"]

# V.
# Do another subset of the data for me. Subset the data frame so it's just the "Downstairs" lab.
# Now, make a scatterplot of the downstairs lab data such that "Date_Collected" is on the x-axis 
#and "DNA_Concentration_Ben" is on the y-axis. 
#Save this scatterplot as "Ben_DNA_over_time.jpg" in your Exam_1 directory. 
#See the file "Downstairs.jpg" for an example of how yours should look. 
#If it looks different, you might need to do some class conversions 
#so the plot() function treats things correctly. HintHintHint: POSIXct

# Subset to "Downstairs"
down <- dat[dat$Lab == "Downstairs",]

# convert "Date_Collected" into POSIXct date-time class
down$Date_Collected <- as.POSIXct(down$Date_Collected)

# make scatterplot
plot(x=down$Date_Collected,y=down$DNA_Concentration_Ben)


# VI.
# For this final (BONUS) problem, let's just look at Ben's DNA concentration values. 
# I think Katy messed up her PCRs, and at any rate, we can't use them for sequencing.
# Besides, our original purpose for this experiment was to see if DNA extractions 
# sitting in a freezer degraded over time.
# To that end, I want you to make a new data frame (just using Ben's values) 
# that has one column containing the years that DNA extractions were made, 
# and another column that contains the AVERAGE of the values within that year.  
# Just to be clear, this data frame should have only 12 rows (one for each year)! 
# You will need to find a way to take the average of Ben's DNA values in each separate year. 
# A for-loop, or repeated subsetting, or some other way...
# Once you have this new data frame of averages by year, 
# write some code that shows which extraction year has the highest average 
# DNA concentration (and what that concentration is) and then save the 12-row dataframe 
# as a new csv file called "Ben_Average_Conc.csv"

# Many ways of doing this. You know one already.
# those who learned for-loops know a second way. I'll show both.

# long way:

# make a subset for each year, showing only Ben's column and take the mean of each...
ben2000 <- mean(dat[dat$Year_Collected == 2000,"DNA_Concentration_Ben"])
ben2001 <- mean(dat[dat$Year_Collected == 2001,"DNA_Concentration_Ben"])
ben2002 <- mean(dat[dat$Year_Collected == 2002,"DNA_Concentration_Ben"])
ben2003 <- mean(dat[dat$Year_Collected == 2003,"DNA_Concentration_Ben"])
ben2004 <- mean(dat[dat$Year_Collected == 2004,"DNA_Concentration_Ben"])
ben2005 <- mean(dat[dat$Year_Collected == 2005,"DNA_Concentration_Ben"])
ben2006 <- mean(dat[dat$Year_Collected == 2006,"DNA_Concentration_Ben"])
ben2007 <- mean(dat[dat$Year_Collected == 2007,"DNA_Concentration_Ben"])
ben2008 <- mean(dat[dat$Year_Collected == 2008,"DNA_Concentration_Ben"])
ben2010 <- mean(dat[dat$Year_Collected == 2010,"DNA_Concentration_Ben"])
ben2011 <- mean(dat[dat$Year_Collected == 2011,"DNA_Concentration_Ben"])
ben2012 <- mean(dat[dat$Year_Collected == 2012,"DNA_Concentration_Ben"])

# Now stick those means together into a vector
vec <- c(ben2000,ben2001,ben2002,ben2003,ben2004,ben2005,ben2006,
         ben2007,ben2008,ben2010,ben2011,ben2012)

# now, make a data frame with that vector as one column and the years as another:
ben_dat <- data.frame(Year = levels(dat$Year_Collected),
                      Ben_Mean = vec)

ben_dat


# the for-loop way:

x=1
v=c()
for(i in levels(dat$Year_Collected)){
  v[x] <- mean(dat[dat$Year_Collected == i,"DNA_Concentration_Ben"])
  x=x+1
}

# make a data frame using the newly-formed "v" vector from above:
ben_dat <- data.frame(Year=levels(dat$Year_Collected),
                      Ben_Mean = v)


# Now, find the row with the maximum mean from this 12-row data frame
maxrow <- which(ben_dat$Ben_Mean == max(ben_dat$Ben_Mean))

# use that to show the row
ben_dat[maxrow,]

library(dplyr)

df == dataset %>%
  group_by(Year_Collected) %>%
  summarize(Mean = )

mutate()



df = dat %>%
  group_by(Year_Collected) %>%
  summarize(MeanBen = mean(DNA_Concentration_Ben),
            MeanKaty = mean(DNA_Concentration_Katy),
            N = n(),
            STDDEV_BEN = sd(DNA_Concentration_Ben))

DAT2 = 123



df1 = dat %>%
  group_by(Lab) %>%
  summarize(MeanBen = mean(DNA_Concentration_Ben),
            MeanKaty = mean(DNA_Concentration_Katy),
            N = n(),
            STDDEV_BEN = sd(DNA_Concentration_Ben))
read.csv("../../../Data_Course/Data/GradSchool_Admissions.csv")
df = read.csv("../../../Data_Course/Data/GradSchool_Admissions.csv")

answer = df %>%
  group_by(rank) %>%
  summarize(meanrank = mean(gpa))

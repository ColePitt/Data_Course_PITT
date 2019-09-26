library(dplyr)
dat <- dataset
#Starts with "D"
# & Just upstairs lab rows

dat5 = dataset %>%
  filter(Lab == "Upstairs") %>%
  select(starts_with("D"))


summarise() ##GIVE YOU DATA FRAME

MEAN() #gIVES YOU VALUE


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


# mutate
# select
# filter
# summarize
# arrange

arrange(dat, Date_Collected)

df = dat %>%
  group_by(Year_Collected) %>%
  summarize(MeanBen = mean(DNA_Concentration_Ben),
            MeanKaty = mean(DNA_Concentration_Katy),
            N = n(),
            STDDEV_BEN = sd(DNA_Concentration_Ben))

DAT2 = 123



dat %>%
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


library(ggplot2)
####UGLY ggplot
df %>%
  filter(admit == 1) %>%
  ggplot(aes(x=rank,y=gpa))+
  geom_boxplot()


df %>%
  filter(admit == 1) %>%
  ggplot(aes(x=as.factor(rank),y=gpa))+
  geom_boxplot()

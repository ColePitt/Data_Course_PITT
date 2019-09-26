# Tuesday #

# Git pull all student repos to grade

# Go over assignment 3 (keep it brief)

# practice *exploring* data using ./Data/landdata-states

  # summaries
  # histograms
  # boxplots
  # scatterplots
  # coloring by category
  # subsetting

df = read.csv("./Data/landdata-states.csv",stringsAsFactors = TRUE)
str(df)


summary(df)

df$State[7803]

plot(x=df$Year,y=df$Home.Value,col=df$region)

# summary
summary(df$Home.Value)

# histogram of home value
hist(df$Home.Value,breaks = 7)

# histogram of state
hist(df$State)

##Wont work because state vector is a factor

# histogram of land value
hist(df$Land.Value,breaks=50)


plot(df$Home.Value,df$Land.Value)

# boxplot
plot(x=df$region,df$Home.Value,col="Red")

# boxplot ("quarter" needs to be a factor to get a boxplot)
plot(as.factor(df$Qrtr),df$Home.Value)

#



library(ggplot2)

?ggplot2

ggplot(df, aes(x=Year, y=Home.Value)) +
  geom_point(aes(color=region ,alpha=.25)) + 
  coord_cartesian(xlim=c(1970,2020), ylim=c(0, 900000)) +
  geom_smooth(method="lm",color="firebrick") + 
  labs(title="Year VS Home Value", subtitle="I hate R", y="Home Value", x="YEAR", caption="Values through the years") +
  facet_wrap(~region) +
  theme_classic()

ggplot(df, aes(x=Year, y=Home.Value, color=Land.Value)) +
  geom_point(alpha=.25) +
  geom_smooth(color="firebrick") +
  facet_wrap(~region) +
  theme_light()





df$ID <- row.names(df)





# just look at homes in the "West" ... these should be the same, but give different results. Why?
west <- subset(df,region=="West")
west2 <- df[df$region == "West",]


plot(west$Year,west$Home.Value,col=west$State)


# Which state is that up at the top!
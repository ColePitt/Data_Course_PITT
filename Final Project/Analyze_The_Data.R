
modSkills = glm(Pass ~ Skills * Pogil, data=data, family = "binomial")
modRelationship = glm(Pass ~ Relationship * Pogil, data=data, family= "binomial")
modConfidence = glm(Pass ~ Confidence * Pogil, data=data, family = "binomial")
modIdentity = glm(Pass ~ Identity * Pogil, data=data, family= "binomial")

modAll = glm(Pass ~ (Skills + Relationship + Identity) * Pogil, data=data, family="binomial" )


summary(modRelationship)
summary(modConfidence)
summary(modIdentity)
summary(modSkills)
summary(modAll)



data = add_predictions(data,modSkills,type="response",var = "pred_passfail_skills")
data = add_predictions(data,modConfidence,type="response",var = "pred_passfail_confidence")
data = add_predictions(data,modIdentity,type="response",var = "pred_passfail_identity")
data = add_predictions(data,modRelationship,type="response",var = "pred_passfail_relationship")

data = add_predictions(data,modAll, type="response",var = "pred_passfail_all")

library(modelr)


ggplot(data, aes(x=Skills,y=pred_passfail_skills)) + geom_smooth() +
  facet_wrap(~Pogil)


ggplot(data, aes(x=Identity,y=pred_passfail_identity)) + geom_smooth() +
  facet_wrap(~Pogil)


ggplot(data, aes(x=Relationship,y=pred_passfail_relationship)) + geom_smooth() +
  facet_wrap(~Pogil)

ggplot(data, aes(x=Confidence, y=pred_passfail_confidence)) + geom_smooth() +
  facet_wrap(~Pogil)

ggplot(data, aes(x=Relationship,y=pred_passfail_all,color=Relationship)) + geom_point() +
  facet_wrap(~Pogil)



ggplot(data, aes(x=Identity,y=pred_passfail_all,color=Identity)) + geom_smooth() +
  facet_wrap(~Pogil*Chem_Bio)


# Box Plot 
p1 = ggplot(data, aes(x=Pogil, y=Skills)) +
  geom_boxplot()

p2 = ggplot(data, aes(x=Pogil, y=Identity)) + 
  geom_boxplot()


p3 = ggplot(data, aes(x=Pogil, y=Relationship)) + 
  geom_boxplot()

p4 =ggplot(data, aes(x=Pogil, y=Confidence)) + 
  geom_boxplot()

library(gridExtra)
grid.arrange(p1,p2,p3,p4)

?geom_boxplot

#Kruskal Wallace 




#Effects of Pogil 
#kruskal.test(x=data$Pass,g=data$Pogil)

names(data)
kruskal.test(Pass ~ Pogil, data=data) #1.06E-06
ggplot(data,aes(x=Pogil,y=Pass)) + geom_bar(stat="identity")

tab = table(data$Pogil,data$Pass)
tab[]/rowSums(tab)

kruskal.test(Pass ~ Pogil, data=data)





kruskal.test(Skills ~ Pogil, data=data) #2.22-16
ggplot(data,aes(x=Pogil,y=Skills)) + geom_boxplot()


kruskal.test(Confidence ~ Pogil, data=data) #.03
ggplot(data,aes(x=Pogil,y=Confidence)) + geom_boxplot()


kruskal.test(Identity ~ Pogil, data=data) #.9
ggplot(data,aes(x=Pogil,y=Identity)) + geom_boxplot()


kruskal.test(Relationship ~ Pogil, data=data) #.08
ggplot(data,aes(x=Pogil,y=Relationship)) + geom_boxplot()


glm(family = "binomial")


#Effects of Skills on Passing Class 
kruskal.test(Pass ~ Skills, data=data) #.005
ggplot(data,aes(x=Skills,y=Pass)) + geom_boxplot()


ggplot(data, aes(x=Relationship,y=pred_passfail_all,color=Relationship)) + geom_point() +
  facet_wrap(~Pogil)




# testanova = aov(data=data,Q24 ~ factor(Pass))
# summary(testanova)
# TukeyHSD(testanova)


summary(modAll)



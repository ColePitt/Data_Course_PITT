data(iris)
data("iris")
iris
iris$Species
iris$Sepal.Length
iris$Species
iris$Species == "virginica"
iris[iris$Species == "virginica","Sepal.Length"]
virginica=iris[iris$Species == "virginica","Sepal.Length"]
iris[iris$Species == "setosa","Sepal.Length"]
setosa=iris[iris$Species == "setosa","Sepal.Length"]
iris[iris$Species == "versicolor","Sepal.Length"]
versicolor=iris[iris$Species == "versicolor","Sepal.Length"]
rm(ssl)
rm(vsl)
rm(versl)
summary(setosa)
summary(virginica)
summary(versicolor)

rbind(summary(setosa), summary(versicolor), summary(virginica))
write.csv(newtable,"../Data_Course_PITT/Assignments/Assignment_2/newtable.csv")

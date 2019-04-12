install.packages("C50") # install package for Decision Tree 

require(C50) # load to C50 in Ram
data(iris) # load IRIS dataset in Ram
head(iris) # it has 4 quantitative and 1 qualitative colummn

str(iris) # species is factor which have 3 level i.e. Setosa,versicolor,virginica

table(iris$Species) #frequency table of species 

# As we seen that dataset are arranged  
# Now we gonna shuffling the Data

set.seed(15)
newVal <- runif(nrow((iris))) 

irisR <- iris[order(newVal),] 

str(irisR)
head(irisR)

m1 <- C5.0(irisR[1:100,-5],irisR[1:100,5])
m1
summary(m1)

prediction <- predict(m1,irisR[101:150,-5])

table(irisR[101:150,5],prediction)

sum(predict(m1,irisR) != irisR$Species)/nrow(irisR)

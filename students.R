#practise exercise

#create a 100 row DF with the following variables
#gender, spl, age, experience, grade, placement
#gender - M, F
#spl - marketing, finance, HR
#grade - A, B, C, D(D<C<B<A)
#placement -Y, N
#age - 21 to 30
#experience - mean:3, sd: 1

(gender = sample(c('M','F'),size = 100, replace=T,prob=c(0.7,0.3)))
(spl = sample(c('marketing', 'finance', 'HR'), size = 100, replace= T, prob = c(0.5, 0.35, 0.15)))
(placement = sample(c('Y','N'),size = 100, replace=T,prob=c(0.5,0.5)))
(grade = sample(c('A', 'B', 'C', 'D'), size = 100, replace= T, prob = c(0.25, 0.40, 0.20, 0.15)))
(age = sample(c(20:30), size = 100, replace = T))
(experience = rnorm(100,4,1))

  
gender; spl; placement; grade; age 
experience
students= data.frame(gender, spl, placement, grade, age, experience, stringsAsFactors=F)
students

head(students)
str(students)
summary(students)
write.csv(students, file = "./data/data_students_1.csv")


library(dplyr)
names(students)
students %>% group_by(placement, gender) %>% summarise(mean(experience), max(experience), mean(age)) 
students %>% group_by(spl, gender) %>% summarise(mode(spl))
students %>% filter(spl=='Marketing') %>% group_by(spl) %>% summarise(mean(age), mean(experience))

hist(students$age)
t1 = table(students$placement)
boxplot(t1, col=1:2)
boxplot(students$age)
pairs(students[,c('age', 'experience')])
pie(t1)


par(mfrow = c(2,2))
pie(table(students$gender))
pie(table(students$placement))
pie(table(students$grade))
pie(table(students$spl))

par(mfrow = c(1,1))
table(students$gender, students$placement, students$spl)

#find students having largest experience in each spl in each gender
students %>% group_by(spl, gender) %>% arrange(spl, gender, experience) %>% top_n(1, experience)

students5= read.csv("./data/data_students_1.csv")
#creating a new dataframe from csv
head(students5)


#Clustering
km3 = kmeans(students[,c('age', 'experience' )], centers=3)  #kmeans for 3 clusters
km3
km3$centers
plot(students[,c('age', 'experience')], col=km3$cluster)



#Decision Tree

library(rpart)
library(rpart.plot)

tree= rpart(placement~., data=students)        #select all other variables
tree
rpart.plot(tree, nn=T, cex=.8)                #plotting a tree
printcp(tree)
ndata = sample_n(students,3)                   #sample of 3 records
ndata
predict(tree, newdata=ndata, type='class')
predict(tree, newdata=ndata, type = 'prob')


#logistic regression
logitmodel1=glm(placement~., data=students, family ='binomial')

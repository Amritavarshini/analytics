#data structures in R

#vectors----
x=1:10                #create sequences of numbers from 1 to 10       #ctrl+Enter is to execute
x

x1 <- 1:20
x1


(x1=1:30)
(x2=c(1,2,13,4,5))
class(x2)

(x3=letters[1:10])
class(x3)
LETTERS[1:26]

(x3b = c('a', "Amrita", '4'))
class(x3b)

(x4 = c(T, FALSE, TRUE, T, F))
class(x4)


x5=c(3L,5L)
class(x5)
x5a= c(3,5)          #default is numeric
class(x5a)                    #to create integer you have to put L         
(x5b = c(1, 'a', T, 4L))
class(x5b)




#access elements
(x6 = seq(0,100,by=3))
?seq
#[1] 0 2 4 6 8 10
ls()   #variables in m y environment
x6
length(x6)
x6[20]
x6[3]       #access 3rd element
#[1] 4
x6[c(2,4)]    #access 2nd and 4th element
x6[-1]       #access all but 1st element
x6
x6[-c(1:10)]
x6
x6[c(2,-4)]
#Error in x6[c(2, -4)] : only 0's may be mixed with negative subscripts

x6[c(2,4,3.54)]     #real no. truncated to integers
x6[-c(1,5,20)]
x6

length(x6)
x6[-(length(x6)-1)]
(x7 = c(x6, x2))   #combine two vectors


#modify
sort(x6)

sort(x6[-c(1,2)])
sort(x6, decreasing = T)  #sorting data in descending order
rev(x6)                   #reverse the original data
#note here the data is already in sequence, but it may not always be. Hence, rev is not equal to descending.


seq(-3, 10, by=.2)  #Arithematic Progression: a, t, d
(x=-c(13:2))
x6[-c(1:12)]   #printing x6, except first 12 elements

(x= -3:2)
x[2] = 0;x         #modify 2nd element
#[1] -3  0 -1  0  1  2



x
x<0
x[x<0]=5; x
x


(x= -3:2)
x[2] = 10;x


x
x<0
x[x<=1 &x>=-1]=100; x     #modify eelments less than 0
x


x= x[1:4]; x
#truncate to first 4 elements











(x= rnorm(100))
?rnorm
#mean=0, std. dev =1
plot(density(x))

(x1 = rnorm(1000, mean=50, sd = 5))
plot(density(x1))
mean(x1)
#as the range becomes large, you can close to the parameters defined
abline(v=mean(x1))
abline(v=mean(x1), h=0.04)


           
#matrices----

100:111
(m1=matrix(1:12, nrow=4))
(m2=matrix(1:12, ncol=3, byrow = T))

x=101:124
length(x)
matrix(x, ncol=6)
class(m1)
attributes(m1)
dim(m1)
m1

#access elements of matrix
m1[1,2:3]
m1[c(1,3),]  #access only 1st and 3rd row, and all colums







#modify vector
m2
m2[2,2]
m2[2,2] = 10
m2


m2[m2>10]=99             #replacing all values over 10 with 99
m2
rbind(m2, c(50,60,70))
m2
cbind(m2, c(55,65,75,85))

cbind(m2,m2)        #REAB ABOUT ROW AND COLUMN BIND
m2

#row and col wise summary
m1
colSums(m1); rowSums(m1)
colMeans(m1); rowMeans(m1)

t(m1)   #transpose
m1


m1
sweep(m1, MARGIN = 1, STATS=c(2,3,4,5), FUN = "+")  #rowrise
sweep(m1, MARGIN = 1, STATS=c(2,3,4), FUN = "*")  #colwise



#addmargins
m1

addmargins(m1, margin=1, sum)      #colwise function
addmargins(m1, 1, sd)             #colwise function

addmargins(m1,2,mean)             #rowwise funtion
addmargins(m1,c(1,2), mean)      #row and col wise function
addmargins()  #GET THIS ONE!!!





#arrays---












#data frames---
 #create vectors to be combined into DF
(rollno = 1:30)
(sname = paste('student', 1:30, sep=''))
(gender = sample(c('M','F'),size = 30, replace=T,prob=c(0.7,0.3)))
(marks = floor(rnorm(30, mean=50, sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA', 'MBA'), size=30, replace = T, prob=c(.5,.5)))
rollno; sname;gender
marks; marks2; course





#Crate DF
df1= data.frame(rollno, sname, gender, marks, marks2, course, stringsAsFactors=F)

df1


str(df1)     #structure of DF
head(df1)   #top 6 rows
head(df1, n=3)   #top 3 rows
tail(df1)
class(df1)
summary(df1)
df1$gender = factor(df1$gender)
df1$course = factor(df1$course)
str(df1)
summary(df1)

#list---













#factor---

grades = sample(c('A','B','C',"D"), size=30, replace = T, prob=c(0.4,0.2,0.3,0.1))
grades


grades = sample(c(LETTERS[1:4]), size = 30, replace = T, prob=c(0.4,0.2,0.3,0.1))
gradesF = factor(grades)               #replace = T -----> with replacement

summary(grades)
summary(gradesF)

table(grades)
table(gradesF)

class(gradesF)

(gradesF0 = factor(grades, ordered = T))
(gradesF01 = factor(grades, ordered = T, levels=c('B','C','A','D')))
summary(gradesF01)

(marks =ceiling(rnorm(30, mean=60, sd=5)))
(gender =factor(sample(c('M','F'), size=30, replace=T)))
(student1 = data.frame(marks, gradesF01))
boxplot(marks ~ gradesF01, data=student1)
boxplot(marks ~ gradesF01 + gender, data=student1)
boxplot(marks)
summary(marks)
abline(h=summary(marks))
quantile(marks)


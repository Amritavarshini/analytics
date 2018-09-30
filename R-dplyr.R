#data analysis using dplry

install.packages(dplyr)
library(dplyr)
dplyr::filter(mtcars, mpg>25 & am=1)
filter(mtcars, mpg>25 & am==1)

mtcars%>% filter(mpg>25 & am==1)
mtcars%>% filter(mpg>25 & am==1) %>% arrange(wt)  %>% summarise(n())

count(mtcars)








#filter {dplyr}	R Documentation
#?filter



mtcars%>% group_by(am) %>% summarise(mean(mpg)) #%>% is the pipe to sequence the functions, creates                                                       views---> temperory objects that don't save to memory

mtcars %>% group_by(gear) %>% summarise(mean(mpg))




plot(women)

plot(women, type = 'p', pch=15, col='red')
plot(women, type='l')
plot(women, type ='b')
plot(women, type ='b', pch =18, lty=2, col=2)
plot(women, xlim=c(30,100), ylim=c(min(women$weight)-10,200), pch=10)

#more features with plot
plot(x=women$weight)

#see cheat sheet on base graph
#1e-graphs-basic

plot(Women)
abline(lm(women$weight~ women$height), col='red', lty=2, lwd=4)



x3=runif(100, 0.15)
x3=ceiling(x3)
range(x3)
#divide range into step of 15, ie. 10 levels
breaks = seq(0,150, by=15)
breaks
length(breaks)


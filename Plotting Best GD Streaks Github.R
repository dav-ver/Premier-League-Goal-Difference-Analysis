#Plotting the best 5 week goal difference streak i.e. most GD gained over 5 games

#First find out what the best streak is
#This script also reads in the data
source("~/OneDrive (old PC)/Documents/GD_Streaks_Github.R")


#Read which is the best streak and amend the following code accordingly
#Currently the best is Man City in early 2017-18

#Swap the Man City and 17-18 references here as required
#Also fiddle with the parameters (e.g. ylim, labels)
plot(all_dataframes[["2017-18"]]$Gameweek, all_dataframes[["2017-18"]]$Man.City_17.18, 
     type="l", col="gray41", ylim=c(0, 85), cex.main = 1, lwd=1, xlab = "Game", 
     ylab = "Goal Difference", main="Best 5 Week Goal Difference Streak since 2000-01")
axis(1, at=1:38, labels = FALSE, tck=-0.025)
abline(h= 20, col="gray98", lwd=0.4)
abline(h= 40, col="gray98", lwd=0.4)
abline(h= 60, col="gray98", lwd=0.4)
abline(h= 80, col="gray98", lwd=0.4)
abline(v= 10, col="gray98", lwd=0.4)
abline(v= 20, col="gray98", lwd=0.4)
abline(v= 30, col="gray98", lwd=0.4)

#Plot over the line in a Man City Sky Blue
points(all_dataframes[["2017-18"]]$Gameweek, all_dataframes[["2017-18"]]$Man.City_17.18, 
       type="l", col="light blue", lwd=1)
#Plot over the streak (weeks 3-8, 4-9 when you include week 0) in a thicker deeper blue
points(all_dataframes[["2017-18"]]$Gameweek[c(4:9)], 
       all_dataframes[["2017-18"]]$Man.City_17.18[c(4:9)], type="l", col="deep sky blue", 
       lwd=3)
#Labels
text(5, 40,  labels = c("Man City 17-18"))
text(5, 28, labels= c("+22 GD"), cex=0.9)

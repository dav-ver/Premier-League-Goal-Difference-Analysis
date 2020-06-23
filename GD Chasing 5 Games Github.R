#What is the biggest goal difference gap between teams chased down within 5 games?

#Two ways to read in necessary data
#1. On my own PC, this works:
#source("~/OneDrive (old PC)/Documents/Running GD Script.R")

#2. On any PC, read in from my Github repo:
library(repmis)
source_data("https://github.com/dav-ver/Premier-League-Goal-Difference-Analysis/blob/master/GD_Evolution_All_Seasons.RData?raw=true")


# I think this is correct according to my data (GD by match for each team)...
# but not quite right according to PL data. That's because...
# my "Gameweek" data compares clubs after the same number of games...
# Whereas the PL compares clubs at actual gameweeks, when some clubs may have games in hand
# I could rectify this: my source data gives a date for every game played
# But it's a lot of work for not a huge payoff

Biggest_Chase = 0
Chase_Details = c()
print("BIGGEST CHASES OVER 5 GAMES:")

for (year in all_dataframes){

  for (chaser in 1:20){
  
    for (runner in 1:20) {

      for (gameweek in 1:33) {
        First_Diff = (year[gameweek, chaser]+100)-(year[gameweek, runner]+100)
        Second_Diff = (year[(gameweek+5), chaser]+100)-(year[(gameweek+5), runner]+100)
        Change = (Second_Diff+100) - (First_Diff+100)
          if(Change >= (-1*First_Diff)) {
            Overcame = TRUE
          }
            else {
              Overcame = FALSE
            }
        
          if (First_Diff < Biggest_Chase & Overcame == TRUE) {
            Biggest_Chase = First_Diff
            Chase_Details = paste(colnames(year)[chaser], "chased", colnames(year)[runner], "closing GD gap of", abs(Biggest_Chase), "starting in GW", (gameweek-1))
          }
            else if (First_Diff == Biggest_Chase & Overcame == TRUE) {
              Equal_Chase_Details = paste(colnames(year)[chaser], "chased", colnames(year)[runner], "closing GD gap of", abs(Biggest_Chase), "starting in GW", (gameweek-1))
              Chase_Details = list(Chase_Details, Equal_Chase_Details)
            }
      }
    }
  }
}
print(Chase_Details)
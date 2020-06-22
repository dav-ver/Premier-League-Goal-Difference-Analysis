#What is the most goal difference gained or lost in a 5 game streak in the PL?

#The output could be neatened but this basically works
#Need to have read in data from elsewhere first
#all_dataframes = list(GD_Evolution_08_09, GD_Evolution_09_10, GD_Evolution_10_11, GD_Evolution_11_12, GD_Evolution_12_13, GD_Evolution_13_14, GD_Evolution_14_15, GD_Evolution_15_16, GD_Evolution_16_17, GD_Evolution_17_18)

library(repmis)

source_data("https://github.com/dav-ver/Premier-League-Goal-Difference-Analysis/blob/master/GD_Evolution_All_Seasons.RData?raw=true")


Max_Added_Value = 0
Best_Streak = c()
print("BEST STREAKS:")
for(year in all_dataframes){
  for(i in 2:21) {
    #starts with 6 but this is fine as there is a week 0 in the frames
    for(j in 6:38) {
      added_value = year[j,i] - year[(j-5),i]
      if (added_value>Max_Added_Value) {
        Max_Added_Value = added_value
        Best_Streak = paste(colnames(year[i]), "   Starting Gameweek", ((j-5)-1), "   (plus", added_value, "GD)")
        Best_Streak_Equal = NULL                               
      }
        else if(added_value==Max_Added_Value) {
          Best_Streak_Equal = paste(colnames(year[i]), "   Starting Gameweek", ((j-5)-1), "   (plus", added_value, "GD)")
          Best_Streak = list(Best_Streak, Best_Streak_Equal)
        }
      
    }
  }
}
print(Best_Streak)



Max_Lost_Value = 0
Worst_Streak = c()
print("WORST STREAKS:")
for(year in all_dataframes){
  for(i in 2:21) {
    #starts with 6 but this is fine as there is a week 0 in the frames
    for(j in 6:38) {
      lost_value = (100+year[j,i]) - (100+year[(j-5),i])
      if (lost_value<Max_Lost_Value) {
        Max_Lost_Value = lost_value  
        Worst_Streak = paste(colnames(year[i]), "   Starting Gameweek", ((j-5)-1), "    (Minus", abs(Max_Lost_Value), "GD)")
        Worst_Streak_Equal = NULL                             
      }
        else if(lost_value==Max_Lost_Value) {
          Worst_Streak_Equal = paste(colnames(year[i]), "   Starting Gameweek", ((j-5)-1), "   (Minus", abs(lost_value), "GD)")
          Worst_Streak = list(Worst_Streak, Worst_Streak_Equal)
        }
      
    }
  }
}
print(Worst_Streak)

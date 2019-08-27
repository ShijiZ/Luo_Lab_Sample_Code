Score <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/2score_analysis/Score_for_analysis.csv")
str(Score)

library(ggpubr)
# Pairwise Barplot of ActKR-Ligand Stability Score
ggbarplot(Score, x="Ligand",y="Score", color="Reference", add = "mean_se", palette=c("#00AFBB","#E7B800"), position = position_dodge()) + 
  stat_compare_means(aes(group=Reference), method = "t.test", label = "p.format") 


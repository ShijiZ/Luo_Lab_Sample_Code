library(ggpubr)

###############################
# Binding Position Prediction #
###############################
Score <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-score-t-test/Score_by_frame_binding_position.csv")
str(Score)

ggbarplot(Score, x="Ligand",y="Score", color="Binding_site", add = "mean_se", palette=c("#00AFBB","#E7B800"),
          position = position_dodge(), ylab = expression("Stability-Score-by-Frame SS"[i])) + 
  stat_compare_means(aes(group=Binding_site), method = "t.test", label = "p.signif") 
ggsave("Score_by_frame_binding_position.png", device="png", path="/Users/shijizhao/Desktop", width=5, height=4, dpi=320)


######################
# Grouped by KR type #
######################
Score <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-score-t-test/Score_by_frame_KR_Promiscuity.csv")
str(Score)

ggbarplot(Score, x="KR",y="Score", color="KR", add = "mean_se", facet.by="Ligand", ylim = c(0, 1),
          palette=c("#00AFBB","#E7B800", "#B03A2E"), position = position_dodge(), ylab = expression("Stability-Score-by-Frame SS"[i])) +
  stat_compare_means(comparisons=list(c("DM-ActKR", "WT-ActKR"), c("DM-ActKR", "WT-HedKR"), c("WT-ActKR", "WT-HedKR")), 
                     label.y = c(0.7, 0.8, 0.9), method = "t.test", label = "p.signif")
ggsave("Score_by_frame_KR_Promiscuity.png", path="~/Desktop", width=8, height = 6.5,  dpi=320)


####################
# With P/Without P #
####################
# With P/Without P Tetraketide
Score_tet <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-score-t-test/Score_by_frame_WithP_WithoutP_tet.csv")
str(Score_tet)

ggbarplot(Score_tet, x="KR",y="Score", color="Ligand", add = "mean_se", palette=c("#00AFBB","#E7B800"),
          position = position_dodge(), ylab = expression("Stability-Score-by-Frame SS"[i])) + 
  stat_compare_means(aes(group=Ligand), method = "t.test", label = "p.signif")
ggsave("Score_by_frame_WithP_WithoutP_tet.png", device="png", path="/Users/shijizhao/Desktop", width=5, height=3, dpi=320)

# With P/Without P Octaketide
Score_oct <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-score-t-test/Score_by_frame_WithP_WithoutP_oct.csv")
str(Score_oct)

ggbarplot(Score_oct, x="KR",y="Score", color="Ligand", add = "mean_se", palette=c("#00AFBB","#E7B800"),
          position = position_dodge(), ylab = expression("Stability-Score-by-Frame SS"[i])) + 
  stat_compare_means(aes(group=Ligand), method = "t.test", label = "p.signif")
ggsave("Score_by_frame_WithP_WithoutP_oct.png", device="png", path="/Users/shijizhao/Desktop", width=5, height=3, dpi=320)
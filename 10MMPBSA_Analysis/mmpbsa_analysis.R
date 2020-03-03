library(dplyr)
library(broom)
library(ggpubr)

##########################################
############## Hypothesis 1 ##############
##########################################
# Grouped by KR type (Total energy)
mmpbsa_KR_Promiscuity_all_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_KR_Promiscuity_all_total.csv")
str(mmpbsa_KR_Promiscuity_all_total)

ggboxplot(mmpbsa_KR_Promiscuity_all_total, x="KR",y="Total_Energy", color="KR", facet.by="Ligand",
          add="jitter", palette=c("#00AFBB","#E7B800","#B03A2E"), ylim=c(-70, 10), ylab=expression(Delta*"G"[total]*" (kcal/mol)")) + 
  stat_compare_means(comparisons=list(c("DM-ActKR", "WT-ActKR"), c("DM-ActKR", "WT-HedKR"), c("WT-ActKR", "WT-HedKR")), method = "t.test", label = "p.signif")
ggsave("mmpbsa_KR_Promiscuity_total.png", path="~/Desktop",width=6, height = 8,  dpi=320)

# Grouped by KR type (Packing Hydrophobic Effect)
mmpbsa_KR_Promiscuity_all_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_KR_Promiscuity_all_vdw.csv")
str(mmpbsa_KR_Promiscuity_all_vdw)

ggboxplot(mmpbsa_KR_Promiscuity_all_vdw, x="KR",y="Packing_Hydrophobic_Effect", color="KR", facet.by="Ligand",
          add="jitter", palette="aaas", ylim=c(-80, 5), ylab=expression(Delta*"G"[vdw]*" (kcal/mol)")) + 
  stat_compare_means(comparisons=list(c("DM-ActKR", "WT-ActKR"), c("DM-ActKR", "WT-HedKR"), c("WT-ActKR", "WT-HedKR")), method = "t.test", label = "p.signif")
ggsave("mmpbsa_KR_Promiscuity_vdw.png", path="~/Desktop",width=6, height = 8,  dpi=320)

# Grouped by KR type (Electrostatic Effect)
mmpbsa_KR_Promiscuity_all_ele  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_KR_Promiscuity_all_ele.csv")
str(mmpbsa_KR_Promiscuity_all_ele)

ggboxplot(mmpbsa_KR_Promiscuity_all_ele, x="KR",y='Electrostatic_Effect', color="KR", facet.by="Ligand", 
          add="jitter", palette="jco", ylim=c(-5, 35), ylab=expression(Delta*"G"[ele]*" (kcal/mol)")) + 
  stat_compare_means(comparisons=list(c("DM-ActKR", "WT-ActKR"), c("DM-ActKR", "WT-HedKR"), c("WT-ActKR", "WT-HedKR")), method = "t.test", label = "p.signif")
ggsave("mmpbsa_KR_Promiscuity_ele.png", path="~/Desktop",width=8, height = 6.5,  dpi=320)

##########################################
############## Hypothesis 2 ##############
##########################################
# With P/Without P Tetraketide Total
mmpbsa_tet <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_PorNP_tet_total.csv")
str(mmpbsa_tet)

ggboxplot(mmpbsa_tet, x="KR",y="Total_Energy", color="Ligand", add="jitter", palette=c("#00AFBB","#E7B800"), ylab=expression(Delta*"G"[total]*" (kcal/mol)")) + 
  stat_compare_means(aes(group=Ligand), method = "t.test", label = "p.signif")
ggsave("mmpbsa_PorNP_tet_total.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# With P/Without P Octaketide Total
mmpbsa_oct <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_PorNP_oct_total.csv")
str(mmpbsa_oct)

ggboxplot(mmpbsa_oct, x="KR",y="Total_Energy", color="Ligand", add="jitter", palette=c("#00AFBB","#E7B800"), ylab=expression(Delta*"G"[total]*" (kcal/mol)")) + 
  stat_compare_means(aes(group=Ligand), method = "t.test", label = "p.signif")
ggsave("mmpbsa_PorNP_oct_total.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# With P/Without P Tetraketide vdw
mmpbsa_tet <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_PorNP_tet_vdw.csv")
str(mmpbsa_tet)

ggboxplot(mmpbsa_tet, x="KR",y="Packing_Hydrophobic_Effect", color="Ligand", add="jitter", palette=c("red2","royalblue3"), ylab=expression(Delta*"G"[vdw]*" (kcal/mol)")) + 
  stat_compare_means(aes(group=Ligand), method = "t.test", label = "p.signif")
ggsave("mmpbsa_PorNP_tet_vdw.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# With P/Without P Octaketide vdw
mmpbsa_oct <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_PorNP_oct_vdw.csv")
str(mmpbsa_oct)

ggboxplot(mmpbsa_oct, x="KR",y="Packing_Hydrophobic_Effect", color="Ligand", add="jitter", palette=c("red2","royalblue3"), ylab=expression(Delta*"G"[vdw]*" (kcal/mol)")) + 
  stat_compare_means(aes(group=Ligand), method = "t.test", label = "p.signif")
ggsave("mmpbsa_PorNP_oct_vdw.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# With P/Without P Tetraketide ele
mmpbsa_tet <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_PorNP_tet_ele.csv")
str(mmpbsa_tet)

ggboxplot(mmpbsa_tet, x="KR",y="Electrostatic_Effect", color="Ligand", add="jitter", palette="jco", ylab=expression(Delta*"G"[ele]*" (kcal/mol)")) + 
  stat_compare_means(aes(group=Ligand), method = "t.test", label = "p.signif")
ggsave("mmpbsa_PorNP_tet_ele.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# With P/Without P Octaketide ele
mmpbsa_oct <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data5-mmpbsa-t-test/mmpbsa_PorNP_oct_ele.csv")
str(mmpbsa_oct)

ggboxplot(mmpbsa_oct, x="KR",y="Electrostatic_Effect", color="Ligand", add="jitter", palette="jco", ylab=expression(Delta*"G"[ele]*" (kcal/mol)")) + 
  stat_compare_means(aes(group=Ligand), method = "t.test", label = "p.signif")
ggsave("mmpbsa_PorNP_oct_ele.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)


###########################
# Correlation Coefficient #
###########################
# DM-ActKR-octp
DM_ActKR_octp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-octp-front-total.csv")
DM_ActKR_octp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-octp-front-vdw.csv")
DM_ActKR_octp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-octp-front-ele.csv")

DM_ActKR_octp_total_vdw <- data.frame(DM_ActKR_octp_total, DM_ActKR_octp_vdw)
DM_ActKR_octp_total_ele <- data.frame(DM_ActKR_octp_total, DM_ActKR_octp_ele)
str(DM_ActKR_octp_total_vdw)
str(DM_ActKR_octp_total_ele)

ggscatter(DM_ActKR_octp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of DM-ActKR-octp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("DM_ActKR_octp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(DM_ActKR_octp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of DM-ActKR-octp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("DM_ActKR_octp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# DM-ActKR-octpp
DM_ActKR_octpp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-octpp-front-total.csv")
DM_ActKR_octpp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-octpp-front-vdw.csv")
DM_ActKR_octpp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-octpp-front-ele.csv")

DM_ActKR_octpp_total_vdw <- data.frame(DM_ActKR_octpp_total, DM_ActKR_octpp_vdw)
DM_ActKR_octpp_total_ele <- data.frame(DM_ActKR_octpp_total, DM_ActKR_octpp_ele)
str(DM_ActKR_octpp_total_vdw)
str(DM_ActKR_octpp_total_ele)

ggscatter(DM_ActKR_octpp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of DM-ActKR-octpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("DM_ActKR_octpp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(DM_ActKR_octpp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of DM-ActKR-octpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("DM_ActKR_octpp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# DM-ActKR-tetpp
DM_ActKR_tetpp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-tetpp-back-total.csv")
DM_ActKR_tetpp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-tetpp-back-vdw.csv")
DM_ActKR_tetpp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-tetpp-back-ele.csv")

DM_ActKR_tetpp_total_vdw <- data.frame(DM_ActKR_tetpp_total, DM_ActKR_tetpp_vdw)
DM_ActKR_tetpp_total_ele <- data.frame(DM_ActKR_tetpp_total, DM_ActKR_tetpp_ele)
str(DM_ActKR_tetpp_total_vdw)
str(DM_ActKR_tetpp_total_ele)

ggscatter(DM_ActKR_tetpp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of DM-ActKR-tetpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("DM_ActKR_tetpp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(DM_ActKR_tetpp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of DM-ActKR-tetpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("DM_ActKR_tetpp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# DM-ActKR-tetp
DM_ActKR_tetp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-tetp-back-total.csv")
DM_ActKR_tetp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-tetp-back-vdw.csv")
DM_ActKR_tetp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/DM-ActKR-tetp-back-ele.csv")

DM_ActKR_tetp_total_vdw <- data.frame(DM_ActKR_tetp_total, DM_ActKR_tetp_vdw)
DM_ActKR_tetp_total_ele <- data.frame(DM_ActKR_tetp_total, DM_ActKR_tetp_ele)
str(DM_ActKR_tetp_total_vdw)
str(DM_ActKR_tetp_total_ele)

ggscatter(DM_ActKR_tetp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of DM-ActKR-tetp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("DM_ActKR_tetp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(DM_ActKR_tetp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of DM-ActKR-tetp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("DM_ActKR_tetp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# WT-ActKR-octp
WT_ActKR_octp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-octp-front-total.csv")
WT_ActKR_octp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-octp-front-vdw.csv")
WT_ActKR_octp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-octp-front-ele.csv")

WT_ActKR_octp_total_vdw <- data.frame(WT_ActKR_octp_total, WT_ActKR_octp_vdw)
WT_ActKR_octp_total_ele <- data.frame(WT_ActKR_octp_total, WT_ActKR_octp_ele)
str(WT_ActKR_octp_total_vdw)
str(WT_ActKR_octp_total_ele)

ggscatter(WT_ActKR_octp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of WT-ActKR-octp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_ActKR_octp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(WT_ActKR_octp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of WT-ActKR-octp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_ActKR_octp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# WT-ActKR-octpp
WT_ActKR_octpp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-octpp-front-total.csv")
WT_ActKR_octpp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-octpp-front-vdw.csv")
WT_ActKR_octpp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-octpp-front-ele.csv")

WT_ActKR_octpp_total_vdw <- data.frame(WT_ActKR_octpp_total, WT_ActKR_octpp_vdw)
WT_ActKR_octpp_total_ele <- data.frame(WT_ActKR_octpp_total, WT_ActKR_octpp_ele)
str(WT_ActKR_octpp_total_vdw)
str(WT_ActKR_octpp_total_ele)

ggscatter(WT_ActKR_octpp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of WT-ActKR-octpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_ActKR_octpp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(WT_ActKR_octpp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of WT-ActKR-octpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_ActKR_octpp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# WT-ActKR-tetpp
WT_ActKR_tetpp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-tetpp-back-total.csv")
WT_ActKR_tetpp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-tetpp-back-vdw.csv")
WT_ActKR_tetpp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-tetpp-back-ele.csv")

WT_ActKR_tetpp_total_vdw <- data.frame(WT_ActKR_tetpp_total, WT_ActKR_tetpp_vdw)
WT_ActKR_tetpp_total_ele <- data.frame(WT_ActKR_tetpp_total, WT_ActKR_tetpp_ele)
str(WT_ActKR_tetpp_total_vdw)
str(WT_ActKR_tetpp_total_ele)

ggscatter(WT_ActKR_tetpp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of WT-ActKR-tetpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_ActKR_tetpp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(WT_ActKR_tetpp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of WT-ActKR-tetpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_ActKR_tetpp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# WT-ActKR-tetp
WT_ActKR_tetp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-tetp-back-total.csv")
WT_ActKR_tetp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-tetp-back-vdw.csv")
WT_ActKR_tetp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-ActKR-tetp-back-ele.csv")

WT_ActKR_tetp_total_vdw <- data.frame(WT_ActKR_tetp_total, WT_ActKR_tetp_vdw)
WT_ActKR_tetp_total_ele <- data.frame(WT_ActKR_tetp_total, WT_ActKR_tetp_ele)
str(WT_ActKR_tetp_total_vdw)
str(WT_ActKR_tetp_total_ele)

ggscatter(WT_ActKR_tetp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of WT-ActKR-tetp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_ActKR_tetp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(WT_ActKR_tetp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of WT-ActKR-tetp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_ActKR_tetp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# WT-HedKR-octp
WT_HedKR_octp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-octp-front-total.csv")
WT_HedKR_octp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-octp-front-vdw.csv")
WT_HedKR_octp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-octp-front-ele.csv")

WT_HedKR_octp_total_vdw <- data.frame(WT_HedKR_octp_total, WT_HedKR_octp_vdw)
WT_HedKR_octp_total_ele <- data.frame(WT_HedKR_octp_total, WT_HedKR_octp_ele)
str(WT_HedKR_octp_total_vdw)
str(WT_HedKR_octp_total_ele)

ggscatter(WT_HedKR_octp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of WT-HedKR-octp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_HedKR_octp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(WT_HedKR_octp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of WT-HedKR-octp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_HedKR_octp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# WT-HedKR-octpp
WT_HedKR_octpp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-octpp-front-total.csv")
WT_HedKR_octpp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-octpp-front-vdw.csv")
WT_HedKR_octpp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-octpp-front-ele.csv")

WT_HedKR_octpp_total_vdw <- data.frame(WT_HedKR_octpp_total, WT_HedKR_octpp_vdw)
WT_HedKR_octpp_total_ele <- data.frame(WT_HedKR_octpp_total, WT_HedKR_octpp_ele)
str(WT_HedKR_octpp_total_vdw)
str(WT_HedKR_octpp_total_ele)

ggscatter(WT_HedKR_octpp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of WT-HedKR-octpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_HedKR_octpp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(WT_HedKR_octpp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of WT-HedKR-octpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_HedKR_octpp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# WT-HedKR-tetpp
WT_HedKR_tetpp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-tetpp-back-total.csv")
WT_HedKR_tetpp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-tetpp-back-vdw.csv")
WT_HedKR_tetpp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-tetpp-back-ele.csv")

WT_HedKR_tetpp_total_vdw <- data.frame(WT_HedKR_tetpp_total, WT_HedKR_tetpp_vdw)
WT_HedKR_tetpp_total_ele <- data.frame(WT_HedKR_tetpp_total, WT_HedKR_tetpp_ele)
str(WT_HedKR_tetpp_total_vdw)
str(WT_HedKR_tetpp_total_ele)

ggscatter(WT_HedKR_tetpp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of WT-HedKR-tetpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_HedKR_tetpp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(WT_HedKR_tetpp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of WT-HedKR-tetpp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_HedKR_tetpp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

# WT-HedKR-tetp
WT_HedKR_tetp_total <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-tetp-back-total.csv")
WT_HedKR_tetp_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-tetp-back-vdw.csv")
WT_HedKR_tetp_ele <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data2-mmpbsa_raw/WT-HedKR-tetp-back-ele.csv")

WT_HedKR_tetp_total_vdw <- data.frame(WT_HedKR_tetp_total, WT_HedKR_tetp_vdw)
WT_HedKR_tetp_total_ele <- data.frame(WT_HedKR_tetp_total, WT_HedKR_tetp_ele)
str(WT_HedKR_tetp_total_vdw)
str(WT_HedKR_tetp_total_ele)

ggscatter(WT_HedKR_tetp_total_vdw, x = "Total.Energy", y = "Packing.Hydrophobic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[vdw]*" of WT-HedKR-tetp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[vdw]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_HedKR_tetp_vdw_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)

ggscatter(WT_HedKR_tetp_total_ele, x = "Total.Energy", y = "Electrostatic.Effect", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          title = expression("Pearson Correlation Test Between "*Delta*"G"[total]*" and "*Delta*"G"[ele]*" of WT-HedKR-tetp"),
          xlab = expression(Delta*"G"[total]*" (kcal/mol)"), ylab = expression(Delta*"G"[ele]*" (kcal/mol)")) +
  font("title", size = 12)
ggsave("WT_HedKR_tetp_ele_corr.png", device="png", path="/Users/shijizhao/Desktop", width=6, height=4, dpi=320)
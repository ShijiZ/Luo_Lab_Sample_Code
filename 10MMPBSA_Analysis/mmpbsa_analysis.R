library(dplyr)
library(broom)
library(ggpubr)

##########################################
################# ANOVA #################
##########################################
mmpbsa_Act_P1  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_anova_Act_P1.csv")
mmpbsa_Act_P2  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_anova_Act_P2.csv")
mmpbsa_Act_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_anova_Act_vdw.csv")
mmpbsa_Hed_P1  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_anova_Hed_P1.csv")
mmpbsa_Hed_P2  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_anova_Hed_P2.csv")
mmpbsa_Hed_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_anova_Hed_vdw.csv")
#str(mmpbsa_Act_P1)

my_anova_Act_P1  <- aov(Energy ~ Pantetheine*Mimic*Polyketide, data = mmpbsa_Act_P1)
my_anova_Act_P2  <- aov(Energy ~ Pantetheine*Mimic*Polyketide, data = mmpbsa_Act_P2)
my_anova_Act_vdw <- aov(Energy ~ Pantetheine*Mimic*Polyketide, data = mmpbsa_Act_vdw)
my_anova_Hed_P1  <- aov(Energy ~ Pantetheine*Mimic*Polyketide, data = mmpbsa_Hed_P1)
my_anova_Hed_P2  <- aov(Energy ~ Pantetheine*Mimic*Polyketide, data = mmpbsa_Hed_P2)
my_anova_Hed_vdw <- aov(Energy ~ Pantetheine*Mimic*Polyketide, data = mmpbsa_Hed_vdw)
summary(my_anova_Act_P1)
summary(my_anova_Act_P2) 
summary(my_anova_Act_vdw)
summary(my_anova_Hed_P1)  
summary(my_anova_Hed_P2)  
summary(my_anova_Hed_vdw)

##########################################
############## Hypothesis 1 ##############
##########################################
mmpbsa_h1_Act_P1  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h1_Act_P1.csv")
mmpbsa_h1_Act_P2  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h1_Act_P2.csv")
mmpbsa_h1_Act_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h1_Act_vdw.csv")
mmpbsa_h1_Hed_P1  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h1_Hed_P1.csv")
mmpbsa_h1_Hed_P2  <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h1_Hed_P2.csv")
mmpbsa_h1_Hed_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h1_Hed_vdw.csv")
#str(mmpbsa_h1_Act_P1)

mmpbsa_h1_Act_P1  %>% group_by(Polyketide.Pantetheine) %>% do(tidy(t.test(Energy~Mimic, data=.)))
mmpbsa_h1_Act_P2  %>% group_by(Polyketide.Pantetheine) %>% do(tidy(t.test(Energy~Mimic, data=.)))
mmpbsa_h1_Act_vdw %>% group_by(Polyketide.Pantetheine) %>% do(tidy(t.test(Energy~Mimic, data=.)))
mmpbsa_h1_Hed_P1  %>% group_by(Polyketide.Pantetheine) %>% do(tidy(t.test(Energy~Mimic, data=.)))
mmpbsa_h1_Hed_P2  %>% group_by(Polyketide.Pantetheine) %>% do(tidy(t.test(Energy~Mimic, data=.)))
mmpbsa_h1_Hed_vdw %>% group_by(Polyketide.Pantetheine) %>% do(tidy(t.test(Energy~Mimic, data=.)))

ggboxplot(mmpbsa_h1_Act_P1, x="Polyketide.Pantetheine",y='Energy', color="Mimic", add="jitter", palette=c("#00AFBB","#E7B800")) + 
  stat_compare_means(aes(group=Mimic), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h1_Act_P2, x="Polyketide.Pantetheine",y='Energy', color="Mimic", add="jitter", palette="jco") + 
  stat_compare_means(aes(group=Mimic), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h1_Act_vdw, x="Polyketide.Pantetheine",y='Energy', color="Mimic", add="jitter", palette=c("red2","royalblue3")) + 
  stat_compare_means(aes(group=Mimic), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h1_Hed_P1, x="Polyketide.Pantetheine",y='Energy', color="Mimic", add="jitter", palette=c("#00AFBB","#E7B800")) + 
  stat_compare_means(aes(group=Mimic), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h1_Hed_P2, x="Polyketide.Pantetheine",y='Energy', color="Mimic", add="jitter", palette="jco") + 
  stat_compare_means(aes(group=Mimic), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h1_Hed_vdw, x="Polyketide.Pantetheine",y='Energy', color="Mimic", add="jitter", palette=c("red2","royalblue3")) + 
  stat_compare_means(aes(group=Mimic), method = "t.test", label = "p.signif")

##########################################
############## Hypothesis 2 ##############
##########################################
mmpbsa_h2_Act_P1 <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h2_Act_P1.csv")
mmpbsa_h2_Act_P2 <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h2_Act_P2.csv")
mmpbsa_h2_Act_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h2_Act_vdw.csv")
mmpbsa_h2_Hed_P1 <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h2_Hed_P1.csv")
mmpbsa_h2_Hed_P2 <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h2_Hed_P2.csv")
mmpbsa_h2_Hed_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h2_Hed_vdw.csv")
#str(mmpbsa_h2_Act_P1)

mmpbsa_h2_Act_P1  %>% group_by(Polyketide.Mimic) %>% do(tidy(t.test(Energy~Pantetheine, data=.)))
mmpbsa_h2_Act_P2  %>% group_by(Polyketide.Mimic) %>% do(tidy(t.test(Energy~Pantetheine, data=.)))
mmpbsa_h2_Act_vdw %>% group_by(Polyketide.Mimic) %>% do(tidy(t.test(Energy~Pantetheine, data=.)))
mmpbsa_h2_Hed_P1  %>% group_by(Polyketide.Mimic) %>% do(tidy(t.test(Energy~Pantetheine, data=.)))
mmpbsa_h2_Hed_P2  %>% group_by(Polyketide.Mimic) %>% do(tidy(t.test(Energy~Pantetheine, data=.)))
mmpbsa_h2_Hed_vdw %>% group_by(Polyketide.Mimic) %>% do(tidy(t.test(Energy~Pantetheine, data=.)))

ggboxplot(mmpbsa_h2_Act_P1, x="Polyketide.Mimic",y='Energy', color="Pantetheine", add="jitter", palette=c("#00AFBB","#E7B800")) + 
  stat_compare_means(aes(group=Pantetheine), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h2_Act_P2, x="Polyketide.Mimic",y='Energy', color="Pantetheine", add="jitter", palette="jco") + 
  stat_compare_means(aes(group=Pantetheine), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h2_Act_vdw, x="Polyketide.Mimic",y='Energy', color="Pantetheine", add="jitter", palette=c("red2","royalblue3")) + 
  stat_compare_means(aes(group=Pantetheine), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h2_Hed_P1, x="Polyketide.Mimic",y='Energy', color="Pantetheine", add="jitter", palette=c("#00AFBB","#E7B800")) + 
  stat_compare_means(aes(group=Pantetheine), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h2_Hed_P2, x="Polyketide.Mimic",y='Energy', color="Pantetheine", add="jitter", palette="jco") + 
  stat_compare_means(aes(group=Pantetheine), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h2_Hed_vdw, x="Polyketide.Mimic",y='Energy', color="Pantetheine", add="jitter", palette=c("red2","royalblue3")) + 
  stat_compare_means(aes(group=Pantetheine), method = "t.test", label = "p.signif")

##########################################
############## Hypothesis 3 ##############
##########################################
mmpbsa_h3_Act_P1 <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h3_Act_P1.csv")
mmpbsa_h3_Act_P2 <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h3_Act_P2.csv")
mmpbsa_h3_Act_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h3_Act_vdw.csv")
mmpbsa_h3_Hed_P1 <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h3_Hed_P1.csv")
mmpbsa_h3_Hed_P2 <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h3_Hed_P2.csv")
mmpbsa_h3_Hed_vdw <- read.csv("/Users/shijizhao/Documents/Lab_Luo/Data/data4-mmpbsa-t-test/mmpbsa_h3_Hed_vdw.csv")
#str(mmpbsa_h3_Act_P1)

mmpbsa_h3_Act_P1  %>% group_by(Pantetheine.Mimic) %>% do(tidy(t.test(Energy~Polyketide, data=.)))
mmpbsa_h3_Act_P2  %>% group_by(Pantetheine.Mimic) %>% do(tidy(t.test(Energy~Polyketide, data=.)))
mmpbsa_h3_Act_vdw %>% group_by(Pantetheine.Mimic) %>% do(tidy(t.test(Energy~Polyketide, data=.)))
mmpbsa_h3_Hed_P1  %>% group_by(Pantetheine.Mimic) %>% do(tidy(t.test(Energy~Polyketide, data=.)))
mmpbsa_h3_Hed_P2  %>% group_by(Pantetheine.Mimic) %>% do(tidy(t.test(Energy~Polyketide, data=.)))
mmpbsa_h3_Hed_vdw %>% group_by(Pantetheine.Mimic) %>% do(tidy(t.test(Energy~Polyketide, data=.)))

ggboxplot(mmpbsa_h3_Act_P1, x="Pantetheine.Mimic",y='Energy', color="Polyketide", add="jitter", palette=c("#00AFBB","#E7B800")) + 
  stat_compare_means(aes(group=Polyketide), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h3_Act_P2, x="Pantetheine.Mimic",y='Energy', color="Polyketide", add="jitter", palette="jco") + 
  stat_compare_means(aes(group=Polyketide), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h3_Act_vdw, x="Pantetheine.Mimic",y='Energy', color="Polyketide", add="jitter", palette=c("red2","royalblue3")) + 
  stat_compare_means(aes(group=Polyketide), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h3_Hed_P1, x="Pantetheine.Mimic",y='Energy', color="Polyketide", add="jitter", palette=c("#00AFBB","#E7B800")) + 
  stat_compare_means(aes(group=Polyketide), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h3_Hed_P2, x="Pantetheine.Mimic",y='Energy', color="Polyketide", add="jitter", palette="jco") + 
  stat_compare_means(aes(group=Polyketide), method = "t.test", label = "p.signif")

ggboxplot(mmpbsa_h3_Hed_vdw, x="Pantetheine.Mimic",y='Energy', color="Polyketide", add="jitter", palette=c("red2","royalblue3")) + 
  stat_compare_means(aes(group=Polyketide), method = "t.test", label = "p.signif")

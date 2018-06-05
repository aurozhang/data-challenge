
## Day 1: Replicating results for paper predicting isSTEM

logdata <- merge_student_total

nonSTEM <- logdata[logdata$isSTEM == 0,]
STEM <- logdata[logdata$isSTEM == 1,]


# Mean and sd for each 

for(i in 1:12){ 
  nonSTEMsd <- paste("nonSTEM", colnames(nonSTEM)[i], mean(nonSTEM[[i]]), sd(nonSTEM[[i]]))
  STEMsd <- paste("STEM", colnames(STEM)[i], mean(STEM[[i]]), sd(STEM[[i]]))
#  print(nonSTEMsd)
#  print(STEMsd)
}


# Tried to figure out how to apply a t-test using a loop but didn't work
# Ended up just doing them individually lol
#lapply(logdata[,-1], function(i) t.test(i~),

t.test(STEM$NumActions, nonSTEM$NumActions)



# Logistic regression determining isSTEM

logit <- glm(isSTEM ~ AveKnow + AveResGaming + AveCarelessness + AveCorrect + NumActions, data = logdata, family = "binomial")
summary(logit)

anovamodel <- anova(logit, test="Chisq")
summary(anovamodel)



## Day 2: Replicating results from paper predicting test scores
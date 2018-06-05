
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

# lapply(mcas[,-1], function(x) cor(x,mcas$MCAS))
# finding the baseline MAE (for comparison purposes)

d <- total_students_MCAS

mcas <- d$MCAS
baseline <- rep(mean(mcas), length(mcas))

mae(baseline, mcas)

cor(mcas, d$AveCorrect)


# t-testing the significance of the difference
# when using only corr, when using only affect, vs. using both performance and affect (all)


# relevant dataframes 

d.corr <- d[4]
d.aff <- d[c(6:11)]
d.all <- d[c(2:4, 6:11)]


# linear models 

lmcorr <- lm(MCAS ~ AveCorrect, data = d)
lmaff <- lm(MCAS ~ AveResBored + AveResEngcon + AveResFrust + AveResOfftask + 
              AveResGaming, data = d)
lmall <- lm(MCAS ~ AveCorrect + AveKnow + AveCarelessness + AveResBored + 
              AveResEngcon + AveResFrust + AveResOfftask + AveResGaming, data = d)
#out <- CVlm(d,linear, m=5)
#summary(out)


# predictions and resulting errors 

predictcorr <- predict(lmcorr, d.corr)
predictaff <- predict(lmaff, d.aff)
predictall <- predict(lmall, d.all)

errorcorr <- abs(predictcorr - mcas)
erroraff <- abs(predictaff - mcas)
errorall <- abs(predictall - mcas)


# the MAE results!!

mean(errorcorr)
mean(erroraff)
mean(errorall)

range(erroraff)


# t-testing the errors

t.test(errorcorr, errorall)
t.test(erroraff, errorall)








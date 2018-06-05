#Commented out stuff is interesting, but not needed
stud <- read.csv("merge_student_total.csv")

attach(stud)

#Getting to know the data some
#library(ggplot2)
#ggplot(stud, aes(x=T, y=AveKnow)) + geom_boxplot()
#plot(AveKnow, AveCarelessness)
#plot(AveKnow, AveCorrect)
#plot(NumActions, AveKnow)

#For loop conducting t-tests to find relationships between attributes and STEM major

#colnames selects all the names of the columns #colnames(stud). These are the ones that we want to check

#for (i in c(2:11)) {
#  yesSTEM <- stud[isSTEM == 1,i]
#  noSTEM <- stud[isSTEM == 0,i]

  t.test(yesSTEM, noSTEM)
}

#We can do each individually like this instead. This is what Aurora did.
yesSTEM <- stud[isSTEM == 1,]
noSTEM <- stud[isSTEM == 0,]

t.test(yesSTEM$AveKnow, noSTEM$AveKnow)
t.test(yesSTEM$AveCarelessness, noSTEM$AveCarelessness)
t.test(yesSTEM$AveCorrect, noSTEM$AveCorrect)
t.test(yesSTEM$NumActions, noSTEM$NumActions)
t.test(yesSTEM$AveResBored, noSTEM$AveResBored)
t.test(yesSTEM$AveResEngcon, noSTEM$AveResEngcon)
t.test(yesSTEM$AveResConf, noSTEM$AveResConf)
t.test(yesSTEM$AveResFrust, noSTEM$AveResFrust)
t.test(yesSTEM$AveResOfftask, noSTEM$AveResOfftask)
t.test(yesSTEM$AveResGaming, noSTEM$AveResGaming)

#initialize the data frame
total_students <- read.csv("student_log_1.csv")
total_students <- total_students[,c(1, 3:12)]

for(i in 2:10) {
  #convert i=2, 3, ... to string value
  studNum <- toString(i)
  ##print(paste0("student_log_", studNum, ".csv"))
  #read in a temporary variable
  temp  <- read.csv(paste0("student_log_", studNum, ".csv"))
  #Trim the data set
  temp <- temp[,c(1, 3:12)]
  ##give it the name e.g. stud1 or stud7
  ##assign(paste0("stud", studNum), temp)
  #add the new data to the data frame
  total_students <- rbind(total_students, temp)
}

#Merge with training label to get isSTEM field
training <- read.csv("training_label.csv")
training <- training[,c(1, 4)] #just get the isSTEM field (5) or the MCAS standardized test field (4)
#eliminate rows with -999 value in MCAS column 
training <- training[training$MCAS != -999,]
total_students <- merge(total_students, training)

#Remove duplicates
total_students <- unique(total_students)

write.csv(total_students, file="total_students_MCAS.csv", row.names=F)






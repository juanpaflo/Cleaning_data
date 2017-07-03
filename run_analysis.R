## Files downloaded path relative path "./Project/UCI HAR Dataset" 
setwd("./Project/UCI HAR Dataset")

##Reading the data files
activitylabels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

setwd("./test")

test <- read.table("X_test.txt")
testlabels <- read.table("Y_test.txt")
subjecttest <- read.table("subject_test.txt")

setwd("..")
setwd("./train")

train <- read.table("X_train.txt")
trainlabels <- read.table("Y_train.txt")
subjecttrain <- read.table("subject_train.txt")

## Modifying columns names
colnames(activitylabels) <- c("actID","activity")

colnames(test) <- features[,2]
colnames(testlabels) <- "actID"
colnames(subjecttest) <- "subjectID"

colnames(train) <- features[,2]
colnames(trainlabels) <- "actID"
colnames(subjecttrain) <- "subjectID"

##Merging files of test
mergedtest <- cbind(testlabels,subjecttest,test)

##Merging files of train
mergedtrain <- cbind(trainlabels,subjecttrain,train)

##Merging the complete files of test and traing
testandtrain <- rbind(mergedtest,mergedtrain)

##Getting mean and standard deviation measurements
allcolumnnames <- colnames(testandtrain)
columnnamesmeanstd<-(grepl("actID" , allcolumnnames)|grepl("subjectID" , allcolumnnames)|
                grepl("mean.." , allcolumnnames)|grepl("std.." , allcolumnnames))
meananddstd <- testandtrain[,columnnamesmeanstd == TRUE]
meanandstdwithlabels <- merge(meananddstd,activitylabels, by="actID", all.x = TRUE)

meandata <- aggregate(. ~subjectID + actID, meanandstdwithlabels, mean)
finalmeandata <- secTidySet[order(secTidySet$subjectID, secTidySet$actID),]

write.table(finalmeandata, "finalmeandata.txt", row.name=FALSE)

setwd("..")
setwd("..")
setwd("..")
print(finalmeandata)
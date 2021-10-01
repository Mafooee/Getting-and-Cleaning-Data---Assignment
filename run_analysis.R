#Read Train & Test Files
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Read features & activity labels
features <- read.table('./UCI HAR Dataset/features.txt')
activitylabels = read.table('./UCI HAR Dataset/activity_labels.txt')

#Assigning
colnames(xtrain) <- features[,2]
colnames(ytrain) <-"activityId"
colnames(subjecttrain) <- "subjectId"
colnames(xtest) <- features[,2] 
colnames(ytest) <- "activityId"
colnames(subjecttest) <- "subjectId"
colnames(activitylabels) <- c('activityId','activityType')

#merge x, y and subject for training and testset
mergedtrain <- cbind(ytrain, subjecttrain, xtrain)
mergedtest <- cbind(ytest, subjecttest, xtest)
#merge training and test set
mergedtt <- rbind(mergedtrain, mergedtest)

#Filter for columens activityid, subjectid and all columns containing "mean" or "std" in their name
filtermeanandstd <- (grepl("activityId" , colnames(mergedtt)) | grepl("subjectId" , colnames(mergedtt)) | grepl("mean.." , colnames(mergedtt)) | grepl("std.." , colnames(mergedtt)))
#only use filtered columens
filtereddata <- mergedtt[ , filtermeanandstd == TRUE]

#add activitynames to the filtered data
addActNames <- merge(filtereddata, activitylabels, by='activityId', all.x=TRUE)

#create tidy data set
TidySet <- aggregate(addActNames, list(addActNames$activityId, addActNames$subjectId), mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),-c(1:2)]
write.table(TidySet, "TidySet.txt", row.name=FALSE)



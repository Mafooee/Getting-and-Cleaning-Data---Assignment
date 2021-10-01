# Getting-and-Cleaning-Data---Assignment
Getting and Cleaning Data - Assignment

R File "run_analysis.R" performs following 5 steps
  -Merges the training and the test sets to create one data set.
  -Extracts only the measurements on the mean and standard deviation for each measurement. 
  -Uses descriptive activity names to name the activities in the data set
  -Appropriately labels the data set with descriptive variable names. 
  -From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each   
  subject.

Variables
    -"xtrain", "ytrain", "xtest", "ytest", "subjecttrain" and "subjecttest" contain the data from the downloaded files.
    -"mergedtrain", "mergedtest", "mergedtt" merge the datasets for further analysis
    -"filtereddata" contains the filtered data set with only mean and standarddeviations
    -"addActNames" contains the filtered data with activitylabels added
    -"TidySet" is the aggregated tidy data set with mean values for activityIds + subjectIds

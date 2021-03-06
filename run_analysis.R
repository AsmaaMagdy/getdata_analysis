# setwd("E:/Worx/Data Science/Coursera/03-Getting and Cleaning Data/Course Project/Run_Analysis")
library("dplyr")
library("stringr")

# Read Training data 
TrainData<- read.table("./UCI HAR Dataset/Train/X_train.txt")
TrainLabel<- read.table("./UCI HAR Dataset/Train/y_train.txt")
TrainSubject<- read.table("./UCI HAR Dataset/Train/subject_train.txt")
TrainingData<- cbind(TrainLabel, TrainSubject,TrainData )

# Read Test data 
TestData<- read.table("./UCI HAR Dataset/Test/X_test.txt")
TestLabel<- read.table("./UCI HAR Dataset/Test/y_test.txt")
TestSubject<- read.table("./UCI HAR Dataset/Test/subject_test.txt")
TestData<- cbind(TestLabel, TestSubject,TestData )

# 1- Merges the training and the test sets to create one data set.
MergedData<- rbind(TrainingData,TestData)

# Read Column names
features<- read.table("./UCI HAR Dataset/features.txt")
listofNames <-as.character(features[,2])
listofNames<- make.names(listofNames, unique=TRUE)

# Assign column names to data
colnames(MergedData)<- tolower(c("Activity_Label","Subject",listofNames))

# 2- Extracts only the measurements on the mean and standard deviation for each measurement
extractMean <- select(MergedData, grep("mean", names(MergedData)) )
extractSTD <- select(MergedData, grep("std", names(MergedData)) )
SelectedColumns<- cbind(MergedData[,1:2],extractMean,extractSTD)

# 3- Uses descriptive activity names to name the activities in the data set
Activities<- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(Activities)<- c("id","activitynames")
ActLabels<- merge(SelectedColumns,Activities, by.x = "activity_label", by.y = "id")

# 4- Appropriately labels the data set with descriptive variable names. 

colnames(ActLabels)<- gsub("tbody", "timebody", colnames(ActLabels), )
colnames(ActLabels)<-gsub("fbody", "frequencybody", colnames(ActLabels), )
colnames(ActLabels)<-gsub("acc", "acceleration", colnames(ActLabels), )
colnames(ActLabels)<-gsub("gyro", "gyroscope", colnames(ActLabels), )
colnames(ActLabels)<-gsub("[.]", "", colnames(ActLabels), )
colnames(ActLabels)<-gsub("x$", "xaxis", colnames(ActLabels), )
colnames(ActLabels)<-gsub("y$", "yaxis", colnames(ActLabels), )
colnames(ActLabels)<-gsub("z$", "zaxis", colnames(ActLabels), )

# 5- creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy<- group_by(ActLabels, subject,activitynames)
tidy<- summarise_each(tidy, funs(mean), timebodyaccelerationmeanxaxis:frequencybodybodygyroscopejerkmagstd)

#6- Write output tidy data into a text file
write.table(tidy, "tidyData.txt", row.names = FALSE)

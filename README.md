---
title: "README"
date: "January 25, 2015"
output: html_document
---
The repo includes the following files:
=========================================
- 'README.md'
- 'run_analysis.R': Performs multiple operations on UCI HAR Dataset in order to have a tidy dataset
- 'CodeBook.md': Shows information about the variables used
- 'tidyData.txt': Constains the tidy data as an output from the run_analysis.R script

run_analysis.R script description
=================================
1- Load libraries needed throughout the process of merging and cleaning data.

2- Reading Training dataset into tables. 
        (Note, that the data folder "UCI HAR should be in the working directory")
```{r}
TrainData<- read.table("./UCI HAR Dataset/Train/X_train.txt")
TrainLabel<- read.table("./UCI HAR Dataset/Train/y_train.txt")
TrainSubject<- read.table("./UCI HAR Dataset/Train/subject_train.txt")
```
3- Add Subject and Activity Label columns to Training Data
```{r}
TrainingData<- cbind(TrainLabel, TrainSubject,TrainData )
```
4- Repeat steps 2 and 3 for test data.

5- Merge the training and the test sets to create one data set (MergedData).

6- Read Column names from features.txt
```{r}
features<- read.table("./UCI HAR Dataset/features.txt")
listofNames <-as.character(features[,2])
listofNames<- make.names(listofNames, unique=TRUE)
```
7- Assign column names to data, and set all column names to lower case
```{r}
colnames(MergedData)<- tolower(c("Activity_Label","Subject",listofNames))
```
8- Extracts only the measurements on the mean and standard deviation for each measurement
```{r}
extractMean <- select(MergedData, grep("mean", names(MergedData)) )
extractSTD <- select(MergedData, grep("std", names(MergedData)) )
SelectedColumns<- cbind(MergedData[,1:2],extractMean,extractSTD)
```
9- Uses descriptive activity names to name the activities in the data set
```{r}
Activities<- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(Activities)<- c("id","activitynames")
ActLabels<- merge(SelectedColumns,Activities, by.x = "activity_label", by.y = "id")
```

10- Appropriately labels the data set with descriptive variable names. 
```{r}
colnames(ActLabels)<- gsub("tbody", "timebody", colnames(ActLabels), )
colnames(ActLabels)<-gsub("fbody", "frequencybody", colnames(ActLabels), )
colnames(ActLabels)<-gsub("acc", "acceleration", colnames(ActLabels), )
colnames(ActLabels)<-gsub("gyro", "gyroscope", colnames(ActLabels), )
colnames(ActLabels)<-gsub("[.]", "", colnames(ActLabels), )
colnames(ActLabels)<-gsub("x$", "xaxis", colnames(ActLabels), )
colnames(ActLabels)<-gsub("y$", "yaxis", colnames(ActLabels), )
colnames(ActLabels)<-gsub("z$", "zaxis", colnames(ActLabels), )
```

11- Create a second, independent tidy data set with the average of each variable for each activity and each subject.
```{r}
tidy<- group_by(ActLabels, subject,activitynames)
tidy<- summarise_each(tidy, funs(mean), timebodyaccelerationmeanxaxis:frequencybodybodygyroscopejerkmagstd)
```

12- Write output tidy data into a text file
```{r}
write.table(tidy, "tidyData.txt", row.names = FALSE)
```

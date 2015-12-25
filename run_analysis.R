#Getting and Cleaning Data
#This takes files from wearable computing
#Dataset from UCI https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
#The goal is to prepare tidy data that can be used for later analysis.

library(plyr);

#Merges the training and the test sets to create one data set.

dat_path <-file.path("C:/Users/emiu/Documents/Data Science/Cleaning Data/data", "UCI HAR Dataset")

files <- list.files(dat_path, recursive=TRUE)

#Load All files

ActivityTest  <- read.table(file.path(dat_path, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(dat_path, "train", "Y_train.txt"),header = FALSE)
activityNames <- read.table(file.path(dat_path, "activity_labels.txt"),header = FALSE)

SubjectTrain <- read.table(file.path(dat_path, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(dat_path, "test" , "subject_test.txt"),header = FALSE)

FeatureTest  <- read.table(file.path(dat_path, "test" , "X_test.txt" ),header = FALSE)
FeatureTrain <- read.table(file.path(dat_path, "train", "X_train.txt"),header = FALSE)
FeatureDetails <- read.table(file.path(dat_path, "features.txt"),head=FALSE)

#Combine all the data
Activity<- rbind(ActivityTrain, ActivityTest)
Feature<- rbind(FeatureTrain, FeatureTest)
Subject <- rbind(SubjectTrain, SubjectTest)

names(Activity)<- c("activity")
names(Feature)<- FeatureDetails$V2
names(Subject)<-c("subject")

CombineThem <- cbind(Subject, Activity)
Final_Data <- cbind(Feature, CombineThem)

#Extracts only the measurements on the mean and standard deviation for each measurement. 

GetSDMean<-FeatureDetails$V2[grep("mean\\(\\)|std\\(\\)", FeatureDetails$V2)]

SubAct<-c(as.character(GetSDMean), "subject", "activity" )

SDMean<-subset(Final_Data,select=SubAct)


#Use descriptive activity names to name the activities in the data set
#Convert numbers to readable english description

SDMean$activity <- factor(SDMean$activity, labels=activityNames[,2])

head(SDMean$activity,50)

#Appropriately labels the data set with descriptive variable names. 

names(SDMean)<-gsub("Acc", "Accelerometer", names(SDMean))
names(SDMean)<-gsub("^f", "Frequency", names(SDMean))
names(SDMean)<-gsub("Gyro", "Gyroscope", names(SDMean))
names(SDMean)<-gsub("Mag", "Magnitude", names(SDMean))
names(SDMean)<-gsub("^t", "Time", names(SDMean))

#Output to check the results
#names(SDMean)

#From the data set in step 4, create a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

TidyData<-aggregate(. ~subject + activity, SDMean, mean)
write.table(TidyData, file = "tidydata.txt",sep="\t",row.name=FALSE)

---
title: "Codebook for Smartphone Movement"
author: "Erica Miu"
date: "Friday, December 25, 2015"
output: html_document
---

##Background: 

The data was collected from the accelerometers from the Samsung Galaxy S II smartphone that tracked the movements of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, data captured consists of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  


The files were not very user friendly in the raw format.  This project merges the activity, subject and features files to create a table that paints a clear picture of each person's movements.

Source files are located here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The purpose of this code is to demonstrate the ability to collect, work with, and clean a data set. 

The goal is to prepare tidy data that can be used for later analysis.

##Raw data:

There were 2 sets of files, test and train.  
Each contained the following:

Subject - contains users number 1-30

Activity data - Users' movements

Features data - definitions of the movements from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ

##Processed data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Features were translated to a more readable format:  
"Acc"   = "Accelerometer"  
"^f"    = "Frequency"  
"Gyro"  = "Gyroscope"  
"Mag"   = "Magnitude"  
"^t"    = "Time"


# Getting and Cleaning Data Course Project

The R script contained in this repo, run_analysis.R, will use data captured from the accelerometer and gyroscope of smartphones from 30 volunteers to create a "tidy dataset" to be used for further processing.

The dataset used, is described in detail here:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This dataset must reside in the same folder as the R script whereto the working directory should be set. The data may be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script, run_analysis.R, will:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script proceeds as follows:

First the "Subject", "Activity", and "Accelerometer and Gyroscope" observations from both the training and test datasets are loaded them merged. 
The descriptive activity names are loaded and joined with the activity observations.
The names of the variables for the "Accelerometer and Gyroscope" observations are loaded and altered to make "tidy" then applied to the merged data.
Finally the script makes use of "chained"commands to
* Join columns from all data sets arriving at our "one data set"
* Select only the measurements on the mean and standard deviation required for the tidy dataset
* Average of each variable grouping by activity and subject
* Write out the tidy dataset called "TidyData.txt"


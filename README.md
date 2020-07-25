# Getting-and-Cleaning-Data-Course-Project

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

- `README.md` - provides an overview of the data set and how it was created  
- `CodeBook.md` - describes the contents of the data set  
- `run_analysis.R` - the R script used to create the data set  
- `tidy_data.txt` - data set itself  

# About the R script
The R script `run_analysis.R` can be used to create the data set. 
It download, unzip and tidy the data to produce the final data.
As requested by the intructions, you can find the steps below:

Download and unzip source data if it doesn't exist  
Read all data and Merge the training and the test sets to create one data set  
Extract only the measurements on the mean and standard deviation for each measurement  
Use descriptive activity names to name the activities in the data set  
Appropriately label the data set with descriptive variable names  
Create a second, independent tidy set with the average of each variable for each activity and each subject  
Write the data set to the `tidy_data.txt` file  


The `tidy_data.txt` in this repository was created by running the `run_analysis.R` script using R version 3.6.2 (2019-12-12)
This script requires the `dplyr` package (I have used version_1.0.0)

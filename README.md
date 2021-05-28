# Peer-graded Assignment: Getting and Cleaning Data Course Project

# Project description

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data used for this project were obtained from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Content

In order to accomplish this assignment several files were submitted in this repository:

## Run_analysis.R: 
R script that contains the code used for downloading and unzipping the data obtained from the link above and transforming the row data into tidy data following 5 different directions :
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## TidyData.txt: 
It contains the tidy data exported into a text file

## CodeBook.md: 
It contains information about the raw and tidy data and the different steps taken to transform the raw data into tidy data

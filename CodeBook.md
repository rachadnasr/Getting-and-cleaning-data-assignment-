Raw data are obtained in UCI Machine Learning Repository with the title : Human Activity Recognition Using Smartphones Data Set. 
This project consisted on studying the human activity recognition database built from the recording of 30 subjects performing actitvities daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 

I created for this project a R script called "run_analysis.R" that contain the code allowing to execute the different steps in the aim of obtaining a tidy data. 

In order to work on the dataset I downloaded and extracted the data under the folder called UCI HAR Dataset. 
The data frames were assigned to variable names along with the columns : 

**The data frames were assigned to variable names along with the columns **
- features : representing two columns, one for the numbers (numb) and the other for the type of the signals (FUN) obtained from the accelerometer and gyroscope
- activitiy_labels: representing two columns one for the activity ID and the other for the labels of the activities performed during the measurments
-  subject_test: representing 1 column with each row identifies the subject who performed the activity for tests. It contain 9/30 volunteers.
-  x_train: It contains 561 columns representing recorded features train data
-  y_train: It contains 1 column representing training labels 
-  subject_test: representing 1 column with each row identifies the subject who performed the activity for trainings. It contain 21/30 volunteers
-  x_test: It contains 561 columns representing recorded features test data
-  y_test: It contains 1 column representing training labels 

1. Merges the training and the test sets to create on data set


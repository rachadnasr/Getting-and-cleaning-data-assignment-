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

'''1. Merges the training and the test sets to create one data set:
 
- training data (x_train) and training labels (y_train) are merged with cbind to obtain train_bind
- train_bind and the training subjects IDs (subject) are merged with cbind to obtain train_bind_subject
- test data (x_train) and test labels (y_train) are merged with cbind to obtain test_bind
- test_bind and the test subjects IDs (subject) are merged with cbind to obtain test_bind_subject
- train_bind_subject and test_bind_subject are merged together with rbind to create one final data set called merged_data

2. Extracts only the measurements on the mean and standard deviation for each measurement:

mean_std is created by subsetting merged_data by extracting the target features: the estmated mean (variable containing "mean" in its label) and estimated standard deviation(variable cotaining "std in its label) and by selecting the columns indicating the subjects ("subject") and the activities ("ActId")

3. Uses descriptive activity names to name the activities in the data set:

Adding to the mean_std a new column with the acitivity labels. This generate the mean_std_ActId data set

4. Appropriately labels the data set with descriptive variable names

- variables that start with t are changed to Time
- variables that start with f are changed to Frequency 
- All Acc in column's name are replaced by Acceleration
- All Gyro in column's name are replaced by Gyroscope
- All Mag in columns's name are replaced by Magnitude
- All .mean and .std are replced by Mean and STD respectivley 
- Freq that appear at the end of the column's name are replaced by Frequency

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to obtain the TidyData, the data are grouped by subject and ActId then each variable is summarized to find the average for the grouped values. TidyData is then exported into TidyData.txt 

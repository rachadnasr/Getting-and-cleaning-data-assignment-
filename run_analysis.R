#download and unzip the data

library(dplyr)
filezip <- "CourseraData.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, filezip)
"UCI HAR Dataset" <- unzip(filezip)

#Assigning data frames

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("numb", "FUN"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("ActId", "Activity"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$FUN)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "ActId")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$FUN)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "ActId")

#Merges the training and the test sets to create one data set

train_bind <- cbind(x_train, y_train)
train_bind_subject <- cbind(train_bind, subject_train)
test_bind <- cbind(x_test, y_test)
test_bind_subject <- cbind(test_bind, subject_test)
merged_data <- rbind(train_bind_subject, test_bind_subject)

#Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std <- merged_data[,grepl("mean|std|subject|ActId", features$FUN)] 
View(mean_std)

#Uses descriptive activity names to name the activities in the data set

mean_std_ActId <- merge(mean_std, activity_labels, by="ActId", all.x=TRUE)

#Appropriately labels the data set with descriptive variable names

names(mean_std_ActId) <- gsub("^t", "Time", names(mean_std_ActId))
names(mean_std_ActId) <- gsub("Acc", "Acceleration", names(mean_std_ActId))
names(mean_std_ActId) <- gsub("Gyro", "Gyroscope", names(mean_std_ActId))
names(mean_std_ActId) <- gsub("^f", "Frequency", names(mean_std_ActId))
names(mean_std_ActId) <- gsub("Mag", "Magnitude", names(mean_std_ActId))
names(mean_std_ActId) <- gsub("BodyBody", "Body", names(mean_std_ActId))
names(mean_std_ActId) <- gsub(".mean", "Mean", names(mean_std_ActId))
names(mean_std_ActId) <- gsub(".std", "STD", names(mean_std_ActId))
names(mean_std_ActId) <- gsub("Freq//.", "Frequency", names(mean_std_ActId))

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

TidyData <- mean_std_ActId %>% group_by(subject, Activity) %>% summarise_all(funs(mean))
write.table(TidyData, "TidyData.txt", row.name=FALSE)


## Step 0 - Preparation

# Load required packages
library(dplyr)

#Download the dataset
if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Assign data frames
features <- read.table('./data/UCI HAR Dataset/features.txt', col.names = c("n", "functions"))
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt', col.names = c("code", "activity"))

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")


## Step 1 - Merges the training and the test sets to create one data set
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)


## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement
tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))


## Step 3 - Uses descriptive activity names to name the activities in the data set
tidy_data$code <- activity_labels[tidy_data$code, 2]


## Step 4 - Appropriately labels the data set with descriptive variable names
names(tidy_data)[2] = "activity"
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))


## Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)
write.table(FinalData, "FinalData.txt", row.name=FALSE)
# Step -1 : Download the Data

library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "UCI HAR Dataset.zip"

if (!file.exists(file)) {
  download.file(url, file, mode = "wb")
}

dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(file)
}

# Step 0 : Read the Data 

features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities)<-c("id","label")

train_subject <- read.table(file.path(dataPath, "train", "subject_train.txt"))
train_x<- read.table(file.path(dataPath, "train", "X_train.txt"))
train_y<- read.table(file.path(dataPath, "train", "y_train.txt"))

test_subject <- read.table(file.path(dataPath, "test", "subject_test.txt"))
test_x <- read.table(file.path(dataPath, "test", "X_test.txt"))
test_y <- read.table(file.path(dataPath, "test", "y_test.txt"))

# Step 1 : Merges the training and the test sets to create one data set.

merge <- rbind(
  cbind(train_subject, train_x, train_y),
  cbind(test_subject, test_x, test_y))

colnames(merge)<-c("subject", features[, 2], "activity")

rm(train_subject, train_x, train_y, 
   test_subject, test_x, test_y)

# Step 2 : Extracts only the measurements on the mean and standard deviation for each measurement.

merge <-merge[, grepl("subject|activity|mean|std", colnames(merge))]

# Step 3 : Uses descriptive activity names to name the activities in the data set

merge$activity <- factor(merge$activity,
                         levels = activities[, 1], labels = activities[, 2])

# Step 4 : Appropriately labels the data set with descriptive variable names.

activitycols <- colnames(merge)
activitycols <- gsub("[\\(\\)-]", "", activitycols)

activitycols <- gsub("^f", "frequencydomain", activitycols)
activitycols <- gsub("^t", "timeDomain", activitycols)
activitycols <- gsub("Acc", "Accelerometer", activitycols)
activitycols <- gsub("Gyro", "Gyroscope", activitycols)
activitycols <- gsub("Mag", "Magnitude", activitycols)
activitycols <- gsub("Freq", "Frequency", activitycols)
activitycols <- gsub("mean", "Mean", activitycols)
activitycols <- gsub("std", "StandardDeviation", activitycols)
activitycols <- gsub("BodyBody", "Body", activitycols)

colnames(merge) <- activitycols

# Step 5 : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

activitymean<-merge %>%
  group_by(subject,activity)%>%
  summarise_each(funs(mean))

write.table(activitymean,"tidy.txt",row.names=FALSE,quote=FALSE)

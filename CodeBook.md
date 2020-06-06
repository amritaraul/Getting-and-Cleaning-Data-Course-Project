The run_analysis.R script does the following as required by the course project’s definition:

1. Download the data\
Dataset downloaded and extracted under the folder called UCI HAR Dataset

2. Read the data
* features <- features.txt : 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* activities <- activity_labels.txt : 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)
* train_subject <- subject_train.txt : 7352 rows, 1 column
contains train data of 21/30 volunteer subjects being observed
* train_x <- X_train.txt : 7352 rows, 561 columns
contains recorded features train data
* train_y <- y_train.txt : 7352 rows, 1 columns
contains train data of activities’code labels
* test_subject <- subject_test.txt : 2947 rows, 1 column
contains test data of 9/30 volunteer test subjects being observed
* test_x <- X_test.txt : 2947 rows, 561 columns
contains recorded features test data
* test_y <- y_test.txt : 2947 rows, 1 columns
contains test data of activities’code labels

3. Merges the training and the test sets to create one data set\
* Merge (train_subject, train_x, train_y) using cbind()
* Merge (test_subject, test_x, test_y) using cbind()
* Merging above using rbind() and saving to 'merge'.

4. Extracts only the measurements on the mean and standard deviation for each measurement\
Selecting only columns subject, activity, mean and std and assigning back to 'merge'.

5. Uses descriptive activity names to name the activities in the data set\
Special characters (i.e. (, ), and -) were removed

6. Appropriately labels the data set with descriptive variable names
* The initial f and t were expanded to frequencyDomain and timeDomain respectively.
* All Acc in column’s name replaced by Accelerometer
* All Gyro in column’s name replaced by Gyroscope
* All BodyBody in column’s name replaced by Body
* All mean in column's name replaced by Mean
* All Mag in column’s name replaced by Magnitude
* All Freq in column’s name replaced by Frequency
* All std in column's name replaced by StandardDeviation

7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject \
activitymean is created by sumarizing merge taking the means of each variable for each activity and each subject, after grouped by subject and activity. Export merge into tidy.txt file.

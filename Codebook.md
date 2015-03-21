#### Codebook for "Getting and Cleaning Data" Course Project
#####References:

- https://class.coursera.org/getdata-012/forum/thread?thread_id=9
- https://class.coursera.org/getdata-012/forum/thread?thread_id=234
- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


####README

The README contains details on how the tidydata is generated from the raw data.

#### Viewing the Tidy data
Use the following command to load and view the tidy dataset in **R**

```
data <- read.table("mydataset.txt", header = TRUE)
View(data)
```


#### Raw Data

Raw Data is available in the following file. 

- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##### The raw dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

#### Code Book
Invalid characters have been modified or removed from the variable names to allow further downstream processing.
##### Remove or modify invalid characters in variable names
```
names(mydataset) <- gsub("\\(\\)", "",names(mydataset))
names(mydataset) <- gsub("\\(", "",names(mydataset))
names(mydataset) <- gsub("\\)", "",names(mydataset))
names(mydataset) <- gsub("\\-", ".",names(mydataset))
```

##### Remove new line characters Test and Train Labels
```
y.test <- gsub("\n", "",as.character(y.test$V1))
y.train <- gsub("\n", "",as.character(y.train$V1))
```

Variable names are based on the supplied variable names in features.txt supplied with the data set. 
Descriptions for the variable names are based on information in features_info.txt supplied with the data set.

- Features are normalized and bounded within [-1,1].
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.
  + Ref: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names



Variable|Description
--------|-----------
subject.id|Subject ID identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
activity.name|Activity name is the name of the activity
tBodyAcc.mean.X|Time domain body accelerometer signal, mean of X
tBodyAcc.mean.Y|Time domain body accelerometer signal, mean of Y
tBodyAcc.mean.Z|Time domain body accelerometer signal, mean of Z
tGravityAcc.mean.X|Time domain gravity accelerometer signal, mean of X
tGravityAcc.mean.Y|Time domain gravity accelerometer signal, mean of Y
tGravityAcc.mean.Z|Time domain gravity accelerometer signal, mean of Z
tBodyAccJerk.mean.X|Time domain body accelerometer jerk signal, mean of X
tBodyAccJerk.mean.Y|Time domain body accelerometer jerk signal, mean of Y
tBodyAccJerk.mean.Z|Time domain body accelerometer jerk signal, mean of Z
tBodyGyro.mean.X|Time domain body gyroscope signal, mean of X
tBodyGyro.mean.Y|Time domain body gyroscope signal, mean of Y
tBodyGyro.mean.Z|Time domain body gyroscope signal, mean of Z
tBodyGyroJerk.mean.X|Time domain body gyroscope jerk signal, mean of X
tBodyGyroJerk.mean.Y|Time domain body gyroscope jerk signal, mean of Y
tBodyGyroJerk.mean.Z|Time domain body gyroscope jerk signal, mean of Z
tBodyAccMag.mean|Time domain body accelerometer magnitude, mean
tGravityAccMag.mean|Time domain gravity accelerometer magnitude, mean
tBodyAccJerkMag.mean|Time domain body accelerometer jerk magnitude, mean
tBodyGyroMag.mean|Time domain body  gyroscope magnitude, mean
tBodyGyroJerkMag.mean|Time domain body  gyroscope jerk magnitude, mean
fBodyAcc.mean.X|Frequency domain body accelerometer signal, mean of X
fBodyAcc.mean.Y|Frequency domain body accelerometer signal, mean of Y
fBodyAcc.mean.Z|Frequency domain body accelerometer signal, mean of Z
fBodyAccJerk.mean.X|Frequency domain gravity accelerometer jerk signal, mean of X
fBodyAccJerk.mean.Y|Frequency domain gravity accelerometer jerk signal, mean of Y
fBodyAccJerk.mean.Z|Frequency domain gravity accelerometer jerk signal, mean of Z
fBodyGyro.mean.X|Frequency domain body gyroscope signal, mean of X
fBodyGyro.mean.Y|Frequency domain body gyroscope jerk signal, mean of Y
fBodyGyro.mean.Z|Frequency domain body gyroscope jerk signal, mean of Z
fBodyAccMag.mean|Frequency domain body  accelerometer magnitude signal, mean
fBodyBodyAccJerkMag.mean|Frequency domain body accelerometer jerk magnitude, mean
fBodyBodyGyroMag.mean|Frequency domain body gyroscope magnitude, mean
fBodyBodyGyroJerkMag.mean|Frequency domain body  gyroscope jerk magnitude, mean
tBodyAcc.std.X|Time domain body accelerometer signal, standard deviation of X
tBodyAcc.std.Y|Time domain body accelerometer signal, standard deviation of Y
tBodyAcc.std.Z|Time domain body accelerometer signal, standard deviation of Z
tGravityAcc.std.X|Time domain gravity accelerometer signal, standard deviation of X
tGravityAcc.std.Y|Time domain gravity accelerometer signal, standard deviation of Y
tGravityAcc.std.Z|Time domain gravity accelerometer signal, standard deviation of Z
tBodyAccJerk.std.X|Time domain body accelerometer jerk signal, standard deviation of X
tBodyAccJerk.std.Y|Time domain body accelerometer jerk signal, standard deviation of Y
tBodyAccJerk.std.Z|Time domain body accelerometer jerk signal, standard deviation of Z 
tBodyGyro.std.X|Time domain body gyroscope signal, standard deviation of X
tBodyGyro.std.Y|Time domain body gyroscope signal, standard deviation of Y
tBodyGyro.std.Z|Time domain body gyroscope signal, standard deviation of Z
tBodyGyroJerk.std.X|Time domain body gyroscope jerk signal, standard deviation of X
tBodyGyroJerk.std.Y|Time domain body gyroscope jerk signal, standard deviation of Y
tBodyGyroJerk.std.Z|Time domain body gyroscope jerk signal, standard deviation of Z
tBodyAccMag.std|Time domain body accelerometer magnitude, standard deviation
tGravityAccMag.std|Time domain gravity accelerometer magnitude, standard deviation
tBodyAccJerkMag.std|Time domain body accelerometer jerk magnitude, standard deviation
tBodyGyroMag.std|Time domain body  gyroscope magnitude, standard deviation
tBodyGyroJerkMag.std|Time domain body  gyroscope jerk magnitude, standard deviation
fBodyAcc.std.X|Frequency domain body accelerometer signal, standard deviation of X
fBodyAcc.std.Y|Frequency domain body accelerometer signal, standard deviation of Y
fBodyAcc.std.Z|Frequency domain body accelerometer signal, standard deviation of Z
fBodyAccJerk.std.X|Frequency domain gravity accelerometer jerk signal, standard deviation of X
fBodyAccJerk.std.Y|Frequency domain gravity accelerometer jerk signal, standard deviation of Y
fBodyAccJerk.std.Z|Frequency domain gravity accelerometer jerk signal, standard deviation of Z
fBodyGyro.std.X|Frequency domain body gyroscope signal, standard deviation of X
fBodyGyro.std.Y|Frequency domain body gyroscope jerk signal, standard deviation of Y
fBodyGyro.std.Z|Frequency domain body gyroscope jerk signal, standard deviation of Z
fBodyAccMag.std|Frequency domain body  accelerometer magnitude signal, standard deviation
fBodyBodyAccJerkMag.std|Frequency domain body accelerometer jerk magnitude, standard deviation
fBodyBodyGyroMag.std|Frequency domain body gyroscope magnitude, standard deviation
fBodyBodyGyroJerkMag.std|Frequency domain body  gyroscope jerk magnitude, standard deviation


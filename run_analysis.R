# Getting and Cleaning Data Course Project
# You should create one R script called run_analysis.R that does the following. 
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 
#    activity and each subject.
#

# Set working directory. Data files should be extracted in this directory 
# Change this directory to reflect the users directory structure
setwd("C:/Users/baz/Google Drive/Data Analysis/Getting and Cleaning Data/src/CourseProject")

library("dplyr")
library("data.table")
# This script assumes the data will be in the same directory as the script (run_analysis.R) in a directory
# called "UCI HAR Dataset"
# Load data
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# Read test data
x.test <- read.table("UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Read train data
x.train <- read.table("UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")


# Appropriately labels the data set with descriptive variable names.
# Change features.txt into Column headings
names(x.test) <- features$V2
names(x.train) <- features$V2

# Remove new line characters from y.test and y.train
y.test <- gsub("\n", "",as.character(y.test$V1))
y.train <- gsub("\n", "",as.character(y.train$V1))


# Uses descriptive activity names to name the activities in the data set
# Convert activity id numbers in y.test and y.train to activity names from activity.labels
for (i in 1:nrow(activity.labels)) {y.test <- gsub(as.character(i),activity.labels$V2[i],y.test)}
for (i in 1:nrow(activity.labels)) {y.train <- gsub(as.character(i),activity.labels$V2[i],y.train)}

# Add y.test as a column
x.test <- cbind(y.test,x.test)

# Rename column V1 to activity
names(x.test)[names(x.test)=="y.test"] <- "activity"

# Add y.train as a column
x.train <- cbind(y.train,x.train)

# Rename column V1 to activity
names(x.train)[names(x.train)=="y.train"] <- "activity"

# Add subject_test.txt as a column
x.test <- cbind(subject.test,x.test)

# Rename column V1 to activity
names(x.test)[names(x.test)=="V1"] <- "subject"

# Add subject_test.txt as a column
x.train <- cbind(subject.train,x.train)

# Rename column V1 to activity
names(x.train)[names(x.train)=="V1"] <- "subject"


# Merge the training and the test sets to create one data set.
dataset <- rbind(x.test,x.train)

# Rename columns to be easier to read. Remove parentheses. Less characters and makes dplyr easier to use
# Create a logical list of columns a that contains the string mean() or std()
mean.names <- grep("mean\\(\\)",names(dataset),ignore.case = TRUE)
std.names <- grep("std\\(\\)",names(dataset),ignore.case = TRUE)

# Extract only the measurements on the mean and standard deviation for each measurement.
mean.dataset <- dataset[,mean.names]
std.dataset <- dataset[,std.names]

# Extract subject and activity vectors
subject <- dataset$subject
activity <- dataset$activity

# Add subject_test.txt as a column
mydataset <- cbind(subject,as.character(activity))
mydataset <- cbind(mydataset,mean.dataset)
mydataset <- cbind(mydataset,std.dataset)

# Remove or modify invalid characters in variable names
names(mydataset) <- gsub("\\(\\)", "",names(mydataset))
names(mydataset) <- gsub("\\(", "",names(mydataset))
names(mydataset) <- gsub("\\)", "",names(mydataset))
names(mydataset) <- gsub("\\-", ".",names(mydataset))

# Rename column V1 to activity
names(mydataset)[names(mydataset)=="V2"] <- "activity"

# Create a second, independent tidy data set
# Create a data table to hold the final data
mynewdataset <- data.table()

# Get subject list
subject.list <- sort(as.numeric(unique(mydataset$subject)))
# Get activity list
activity.list <- sort(unique(mydataset$activity))

# Function to process the data
process.data <- function(subject.id,activity.name){
        mysubject <- filter(mydataset,subject == subject.id)
        mysubject.activity <- filter(mysubject,activity == activity.name)
        activitymeans <- t(as.data.frame(colMeans(select(mysubject.activity,-subject,-activity))))
        newdatarow <- cbind(subject.id,activity.name) 
        newdatarow <- as.data.table(cbind(newdatarow,activitymeans))
        newdataset <- rbind(newdataset,newdatarow)
        newdataset
}

# Loop through subject list and activity.list and process data to create tidy data set.
# Produces a tidy dataset of 180 observations of 68 variables
for (subject.id in subject.list) {
        newdataset <- data.table()
        for(activity.name in activity.list){
                tmp.data <- process.data(subject.id,activity.name)
                mynewdataset <- rbind(mynewdataset,tmp.data)
        }
}

# Write data file to disk using "write.table() and row.name=FALSE
write.table(mynewdataset,"mydataset.txt",row.name=FALSE)
# Remove objects from memory
rm(list = ls())

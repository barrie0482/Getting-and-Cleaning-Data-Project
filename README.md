
The output of this script, **run_analysis.R**, described in this document, provides a single wide form tidy dataset saved to disk. Each variable is in one column, each observation is in a different row. These three elements describe a tidy dataset.


A full description of the data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### Creating the tidy data
This script assumes the raw data will be in the same (working) directory as the script (**run_analysis.R**) in a directory
called **UCI HAR Dataset**

To produce the tidy dataset, run the following commands. Don't forget to set you path.
```
setwd("path/to/working/directory")
source('run_analysis.R')
```
### Script Description
#### 1. Loading the data
The raw data is loaded from the source files in **UCI HAR Dataset**. Each data file is loaded in variable in the R environment for further processing.

The data involves three sets of information, subjects, activities and measurements.

**Ref:** https://class.coursera.org/getdata-012/forum/list?forum_id=10009

Variable|Data File| Data Type
--------|---------|----------
activity.labels|UCI HAR Dataset/activity_labels.txt| Activity names
features|UCI HAR Dataset/features.txt| Measurment names
x.test|UCI HAR Dataset/test/X_test.txt| Measurement data
y.test|UCI HAR Dataset/test/y_test.txt| Activity id
subject.test|UCI HAR Dataset/test/subject_test.txt| Subject id
x.train|UCI HAR Dataset/train/X_train.txt| Measurement data
y.train|UCI HAR Dataset/train/y_train.txt| Activity id
subject.train|UCI HAR Dataset/train/subject_train.txt| Subject id


#### 2. Appropriately labeling the data set with descriptive variable names.

The features.txt file contains the measurement variable names. These names were applied to the data from the measurement data files to form descriptive variable (column) names. 

The descriptive variable (column) names used are based on the measurement names provided with the original data set 


#### 3. Using descriptive activity names to name the activities in the data set
The activity id numbers in y.test and y.train were converted to activity names from activity.labels. Both y.test and y.train were added as a column to the beginning of x.test and x.train respectively. 

The column names y.test and y.train in x.test and x.train were both changed to **activity** to become descriptive variable names.

Both subject.test and subject.train were added as a column to the beginning of x.test and x.train respectively. 

The column names subject.test and subject.train in x.test and x.train were both changed to **subject** to become descriptive variable names.


#### 4. Merge the training and the test sets to create one data set.

Both x.test and x.train were merged into one dataset called **dataset**. 


#### 5. Clean data and column names.
The data set was cleaned by removing random new line characters from the the measurement data.
Invalid characters were removed or modifed in variable names. This produces a data set that is easier to use for downstream processing.


#### 6. Extract only the measurements on the mean and standard deviation for each measurement.

Columns containing the strings mean(),std(), subject and activity were extracted and combined to form an interim data set to be processed. 

#### 7. Create a second, independent tidy data set

A second, independent tidy data set with the average of each variable for each activity and each subject was created. This was achieved by looping through each subject and calculating the mean of each variable, for each activity and for each subject. The output of this processing was stored in a new data set called **newdataset**. This dataset contains a tidy dataset of 180 observations of 68 variables

#### 8. Write data file to disk using "write.table() and row.name=FALSE

The output data set is saved to disk using "write.table() and row.name=FALSE in the same directory as the **run_analysis.R** script.

#### 9. Remove objects from memory
Once the script has completed it removes all objects from the **R** environment

#### 10. Read the data back into R

Use the following command to load and view the tidy dataset in **R**

```
data <- read.table("mydataset.txt", header = TRUE)
View(data)
```
**Ref:** https://class.coursera.org/getdata-012/forum/thread?thread_id=9


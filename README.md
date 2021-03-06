## Getting and Cleaning Data Course Project

This repository is created as part of the course offered by John Hopkins University on coursera.

Author:- Divyaprakash Panda

### Description

This file contains details about how the script works

## Tasks completed by the analysis file
### Section 1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Assign column names and merge to create one data set.

### Section 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Generate a vector that contains TRUE values for the IDs, mean and stdev columns and FALSE values for the others.
Using the logical vector subset the merged file to keep only the necessary columns.

### Section 3. Use descriptive activity names to name the activities in the data set
Merge data subset with the activity_type table to get an extra column for activity names.

### Section 4. Appropriately label the data set with descriptive variable names.
Visually Check the column names to determine the what words need to be replaced.
Use gsub function for pattern replacement to clean up the data labels.

### Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Use aggregate function to average each variable based on each activity and each subject.
extract the final data.frame into a text file using write.table command


### Reading the tidy_data File

The tidy data file might not look very proper when opened with a local text editor. Please use the read.table command to get the data into R and cross check.

The following command can also be used to get the data into 

data1<-read.table("https://s3.amazonaws.com/coursera-uploads/user-eb35a391319191001a328a63/975117/asst-3/859f6c507b6111e59f1427905112e56c.txt")

head(data1)

Else The Data can also be converted into csv file and opened in a spreadsheet.

write.csv(data1,"Test1.csv")





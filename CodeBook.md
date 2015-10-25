## Getting and Cleaning Data Course Project

Author:- Divyaprakash Panda

### Details aboout this file and data processed

### Description
This documnet describes the variables, the data, and any transformations or work that are performed to clean up the data

### Data Source
The data is downloaded from the folowing link:- (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Description about the data is provided in the folowing link:- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Short description abou the data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Variables Used

- col_names:- to contain the column names of the data_frames which are required during various operations.
- combined_data:- dataframe formed by merging the test and training data.
- final_data:- dataframe containing only the columns corresponding to Subject, activity, mean and stddev.
- tidy_data:- contains the aggregated data 

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
extract the final data.frame into a text file.

##########################################################################################################
# Coursera Getting and Cleaning Data Course Project
# Author: Divyaprakash Panda
# Date: 25-Oct-2015
# Version 1.0
# Need :- Getting the required data as mentioned in the instructions and converting it to tidy data
# Steps:-
# Step 1. Merges the training and the test sets to create one data set.
# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Step 3. Uses descriptive activity names to name the activities in the data set
# Step 4. Appropriately labels the data set with descriptive variable names. 
# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##########################################################################################################

#set working directory to the location where the UCI HAR Dataset was unzipped
setwd('C:/Users/Divya/Desktop/coursera/Getting_and_cleaning/Project/UCI HAR Dataset');

# Getting The data into variables from the required files
features      = read.table('./features.txt',header=FALSE);
activity_type = read.table('./activity_labels.txt',header=FALSE);
subject_train = read.table('./train/subject_train.txt',header=FALSE);
subject_test = read.table('./test/subject_test.txt',header=FALSE);
x_train       = read.table('./train/x_train.txt',header=FALSE);
x_test       = read.table('./test/x_test.txt',header=FALSE);
y_train       = read.table('./train/y_train.txt',header=FALSE);
y_test       = read.table('./test/y_test.txt',header=FALSE);


# Naming the columns in the file for easy classification
colnames(activity_type)  = c('activity_id','activity_type');
colnames(subject_train)  = "subject_id";
colnames(subject_test) = "subject_id";
colnames(x_train)        = features[,2]; 
colnames(x_test)       = features[,2]; 
colnames(y_train)        = "activity_id";
colnames(y_test)       = "activity_id";

#Verifying that the column names are changed
head(activity_type)
head(subject_train)
head(subject_test)
head(x_train)
head(x_test)
head(y_train)
head(y_test)

### Step 1. Merge the training and the test sets to create one data set.

# Creating a single data frame for Training set from 3 different files.
training_data = cbind(y_train,subject_train,x_train);

# Creating a single data frame for test set from 3 different files.
test_data = cbind(y_test,subject_test,x_test);

# Combine training and test data to create a final data set
combined_data = rbind(training_data,test_data);

# Getting the column names to extract only the columns with respect to mean and Std_Dev
col_names  = colnames(combined_data);


### Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# Generating a vector that contains TRUE values for the Ids, mean() & std() columns and FALSE for others
name_vector = (grepl("activity",col_names) | grepl("subject",col_names) | grepl("mean\\(\\)",col_names) | grepl("std\\(\\)",col_names))

#cross checking the Column names
col_names[name_vector==TRUE]

# Subset the combined data to get only the required columns
final_data = combined_data[name_vector==TRUE];

### 3. Use descriptive activity names to name the activities in the data set

# Merge the final_data dataframe with the acitivity_type dataframe
final_data = merge(final_data,activity_type,by='activity_id',all.x=TRUE);

# Updating the col_names vector to include the new column names after merge
col_names  = names(final_data); 

# 4. Appropriately label the data set with descriptive activity names.

# Checking the column names in the final data
names(final_data)
# Cleaning up the column names
  names(final_data)<-gsub("^t", "time", names(final_data))
  names(final_data)<-gsub("^f", "frequency", names(final_data))
  names(final_data)<-gsub("Acc", "Accelerometer", names(final_data))
  names(final_data)<-gsub("Gyro", "Gyroscope", names(final_data))
  names(final_data)<-gsub("Mag", "Magnitude", names(final_data))
  names(final_data)<-gsub("BodyBody", "Body", names(final_data))
  
### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Create a new table, final_data1 without the activity_type column
final_data1 = final_data[,names(final_data) != 'activity_type'];

# Summarizing the final_data1 table to include just the mean of each variable for each activity and each subject
tidy_data    = aggregate(. ~subject_id + activity_id, final_data1, mean);

# Merging the tidy_data with activity_type to include descriptive activity names
tidy_data    = merge(activity_type,tidy_data,by='activity_id',all.x=TRUE);

# Export the tidy_data dataframe 
write.table(tidy_data, './tidy_data.txt',row.names=FALSE,sep='\t');


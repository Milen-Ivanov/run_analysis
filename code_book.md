## Input
Download the data zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The files contain data recorded from experiments with 30 volunteers wearing a smartphone (Samsung Galaxy S II) on the waist.

The run_analysis.R script reads in the following files and stores them in variables with matching names.

* subject_test.txt
* X_test.txt
* y_test.txt
* subject_train.txt
* X_train.txt
* y_train.txt
* features.txt
* activity_labels.txt

*'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

*'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

*'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

*'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Output
The run_analysis.R script creates a file named tidy_data_1.txt. and tidy_data_2.txt

The first column of the tidy_data_2.txt file is "subject_id" with contains the subject id originally found
in the subject_test and subject_train files. 
The next column of the tidy_data.txt file is "activity_title" describes the one of six activities:
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. 
The remaining columns contain the mean of the values defined in the features.txt file,
the column names are based on those names.

tidy_data_2.txt is created from tidy_data_1.txt and creates an independent tidy data set 
with the average of each variable for each activity and each subject.

## Process

This script uses packages "data.table" and "reshape2"
* 1. Merges the training and the test sets to create one data set.
   * imports all source files
   * binds the rows
* 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   * gets feature titles
   * strips out all fields that are not mean or standard deviation
* 3. Use descriptive activity names to name the activities in the data set
   * gets activity titles
   * adds a second column of activity titles based on the activity id
   * sets activity names
* 4. Merges the data, Appropriately label the data set with descriptive variable names nad save as txt file. 
   * Combines Final data into one data table
* 5. From the data set in step 4, creates a second, independent tidy data set 
   * with the average of each variable for each activity and each subject.
   * Output tidy_data to a file.


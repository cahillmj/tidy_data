## run_analysis.R

This script combines various files from the UCI HAR Dataset and combines them 
into a single, tidy dataset ready for analysis.  

The folder containing the entirety of the data can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Before running the script,set your working directory to this folder.

Here is a list of steps that the script performs:

  *Combines the training subject list ('train/subject_train.txt) and test subject list('test/subject_test.txt).
  *Combines the training activity list ('train/y_train.txt') and the test activity list('test/y_test.txt).
  *Combines the training data ('train/x_train.txt) and test data ('test/x_test.txt') 
  *Combines subject list, activity list, and the rest of the data into a single data set.
  *Extracts only the columns that are reporting a mean or standard deviation.
  *replaces activity codes (e.g., 1,2,3,...) with activity labels (e.g., 'WALKING', 'WALKING_UPSTAIRS','WALKING_DOWNSTAIRS').
  *Updates variable names for clarity.
  *Summarizes the data by subject and by activity, so that for each subject, the mean of each variable 
   is reported for each of the 6 activities (30 subjects x 6 activities = 180 total rows of data).
  *Writes this summary table to a text file in your working directory
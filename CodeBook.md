
# Code Book

Original data source is:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

With the description of 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## R script Code: run_analysis.R

This script performs these steps to clean up the data and present it in a summarize way:

1. Merges data files
    + Merges the training (train//X_train.txt) and the test sets (test//X_test.txt) to create one data set (a 10299 obs./561 attributes result data frame)
    + Merges the training labels (train//Y_test.txt) and the test labels sets (test//Y_train.txt) to create one data set (a 10299 obs./1 attributes result data frame) of activity IDs
    + Merge the Subject (volunteers) train (train//subject_train.txt) and test files (test//subject_test.txt) (a 10299 obs./1 attributes result data frame)
    
2. Extracts only the measurements on the mean and standard deviation for each measurement
    + Read the features data set
    + Set the name of the merged X dataset using the features in the text file
    + Only keep the mean and std measurements from the merged X datasets (the results is a 10299 obs. / 66 attributes dataframe) - other measurements (495 measurements were not mean or standard deviation measurements)
    
3. Uses descriptive activity names to name the activities in the data set
    + Activity names were cleaned up (e.g. WALKING_UPSTAIRS changed to walkingupstairs)
    
4. Appropriately labels the data set with descriptive variable names 
    + Clean up the variable names - all lowercase, and remove the parenthesis (e.g. tBodyAcc-mean()-X changed to tbodyAcc-mean-x)
    + Combine the 3 datasets - Subject, Y (activity), and X (measurements) (a 10299 obs./68 attributes result data frame)
    
5. From the data set in step 4, an independent tidy data is created
    + Data is summarized by subject and activity
    + A result file is produced (subj_activ_averages.txt). This file includes 180 rows (30 subjects x 6 activities) with the mean of each 66 variables for each subject and activities - dimension is therefore 180x68
 

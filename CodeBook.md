
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
    
**Variables in the resulting data set:**

* *activity*    : Activity performed on the subject: laying, sitting, standing, walking, walkingdownstairs, walkingupstairs
* *subject*	: Number of the volunteer performing the activity tests

*Note that the following variables are all averaged for each activity performed by each subject:*

* *tbodyacc-mean-x*	: Mean value of all body acceleration X Axis measurements (time signal)
* *tbodyacc-mean-y*	: Mean value of all body acceleration Y Axis measurements (time signal)
* *tbodyacc-mean-z*	: Mean value of all body acceleration Z Axis measurements (time signal)
* *tbodyacc-std-x*	: Standard deviation of all body acceleration X Axis measurements (time signal)
* *tbodyacc-std-y*	: Standard deviation of all body acceleration Y Axis measurements (time signal)
* *tbodyacc-std-z*	: Standard deviation of all body acceleration Z Axis measurements (time signal)
* *tgravityacc-mean-x*	: Mean value of all gravity acceleration X Axis measurements (time signal)
* *tgravityacc-mean-y*	Mean value of all gravity acceleration Y Axis measurements (time signal)
* *tgravityacc-mean-z*	Mean value of all gravity acceleration Z Axis measurements (time signal)
* *tgravityacc-std-x*	Standard deviation of all gravity acceleration X Axis measurements (time signal)
* *tgravityacc-std-y*	Standard deviation of all gravity acceleration Y Axis measurements (time signal)
* *tgravityacc-std-z*	Standard deviation of all gravity acceleration Z Axis measurements (time signal)
* *tbodyaccjerk-mean-x*	Mean value of all body acceleration jerk X Axis measurements (time signal)
* *tbodyaccjerk-mean-y*	Mean value of all body acceleration jerk Y Axis measurements (time signal)
* *tbodyaccjerk-mean-z*	Mean value of all body acceleration jerk Z Axis measurements (time signal)
* *tbodyaccjerk-std-x*	Standard deviation of all body acceleration jerk X Axis measurements (time signal)
* *tbodyaccjerk-std-y*	Standard deviation of all body acceleration jerk Y Axis measurements (time signal)
* *tbodyaccjerk-std-z*	Standard deviation of all body acceleration jerk Z Axis measurements (time signal)
* *tbodygyro-mean-x*	Mean value of all body gyroscope X Axis measurements (time signal)
* *tbodygyro-mean-y*	Mean value of all body gyroscope Y Axis measurements (time signal)
* *tbodygyro-mean-z*	Mean value of all body gyroscope Z Axis measurements (time signal)
* *tbodygyro-std-x*	Standard deviation of all body gyroscope X Axis measurements (time signal)
* *tbodygyro-std-y*	Standard deviation of all body gyroscope Y Axis measurements (time signal)
* *tbodygyro-std-z*	Standard deviation of all body gyroscope Z Axis measurements (time signal)
* *tbodygyrojerk-mean-x*	Mean value of all body gyroscope jerk X Axis measurements (time signal)
* *tbodygyrojerk-mean-y*	Mean value of all body gyroscope jerk Y Axis measurements (time signal)
* *tbodygyrojerk-mean-z*	Mean value of all body gyroscope jerk Z Axis measurements (time signal)
* *tbodygyrojerk-std-x*	Standard deviation of all body gyroscope jerk X Axis measurements (time signal)
* *tbodygyrojerk-std-y*	Standard deviation of all body gyroscope jerk Y Axis measurements (time signal)
* *tbodygyrojerk-std-z*	Standard deviation of all body gyroscope jerk Z Axis measurements (time signal)
* *tbodyaccmag-mean*	Mean value of all body acceleration magnitude  measurements (time signal)
* *tbodyaccmag-std*	Standard deviation of all body acceleration magnitude  measurements (time signal)
* *tgravityaccmag-mean*	Mean value of all gravity acceleration magnitude  measurements (time signal)
* *tgravityaccmag-std*	Standard deviation of all gravity acceleration magnitude  measurements (time signal)
* *tbodyaccjerkmag-mean*	Mean value of all body acceleration jerk magnitude  measurements (time signal)
* tbodyaccjerkmag-std*	Standard deviation of all body acceleration jerk magnitude  measurements (time signal)
* *tbodygyromag-mean*	Mean value of all body gyroscope magnitude  measurements (time signal)
* *tbodygyromag-std*	Standard deviation of all body gyroscope magnitude  measurements (time signal)
* *tbodygyrojerkmag-mean*	Mean value of all body gyroscope jerk magnitude  measurements (time signal)
* *tbodygyrojerkmag-std*	Standard deviation of all body gyroscope jerk magnitude  measurements (time signal)
* *fbodyacc-mean-x*	Mean value of all body acceleration X Axis measurements (frequency domain signal)
* *fbodyacc-mean-y*	Mean value of all body acceleration Y Axis measurements (frequency domain signal)
* *fbodyacc-mean-z*	Mean value of all body acceleration Z Axis measurements (frequency domain signal)
* *fbodyacc-std-x*	Standard deviation of all body acceleration X Axis measurements (frequency domain signal)
* *fbodyacc-std-y*	Standard deviation of all body acceleration Y Axis measurements (frequency domain signal)
* *fbodyacc-std-z*	Standard deviation of all body acceleration Z Axis measurements (frequency domain signal)
* *fbodyaccjerk-mean-x*	Mean value of all body acceleration jerk X Axis measurements (frequency domain signal)
* *fbodyaccjerk-mean-y*	Mean value of all body acceleration jerk Y Axis measurements (frequency domain signal)
* *fbodyaccjerk-mean-z*	Mean value of all body acceleration jerk Z Axis measurements (frequency domain signal)
* *fbodyaccjerk-std-x*	Standard deviation of all body acceleration jerk X Axis measurements (frequency domain signal)
* *fbodyaccjerk-std-y*	Standard deviation of all body acceleration jerk Y Axis measurements (frequency domain signal)
* *fbodyaccjerk-std-z*	Standard deviation of all body acceleration jerk Z Axis measurements (frequency domain signal)
* *fbodygyro-mean-x*	Mean value of all body gyroscope X Axis measurements (frequency domain signal)
* *fbodygyro-mean-y*	Mean value of all body gyroscope Y Axis measurements (frequency domain signal)
* *fbodygyro-mean-z*	Mean value of all body gyroscope Z Axis measurements (frequency domain signal)
* *fbodygyro-std-x*	Standard deviation of all body gyroscope X Axis measurements (frequency domain signal)
* *fbodygyro-std-y*	Standard deviation of all body gyroscope Y Axis measurements (frequency domain signal)
* *fbodygyro-std-z*	Standard deviation of all body gyroscope Z Axis measurements (frequency domain signal)
* *fbodyaccmag-mean*	Mean value of all body acceleration magnitude  measurements (frequency domain signal)
* *fbodyaccmag-std*	Standard deviation of all body acceleration magnitude  measurements (frequency domain signal)
* *fbodybodyaccjerkmag-mean*	Mean value of all body acceleration jerk magnitude  measurements (frequency domain signal)
* *fbodybodyaccjerkmag-std*	Standard deviation of all body acceleration jerk magnitude  measurements (frequency domain signal)
* *fbodybodygyromag-mean*	Mean value of all body gyroscope magnitude  measurements (frequency domain signal)
* *fbodybodygyromag-std*	Standard deviation of all body gyroscope magnitude  measurements (frequency domain signal)
* *fbodybodygyrojerkmag-mean*	Mean value of all body gyroscope jerk magnitude  measurements (frequency domain signal)
* *fbodybodygyrojerkmag-std*	Standard deviation of all body gyroscope jerk magnitude  measurements (frequency domain signal)

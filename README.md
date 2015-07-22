
# Getting and Cleaning Data
This repos includes my written code for the Johns Hopkins University Getting and Cleaning data course project. My code was run on Windows 7. If you are running on other environments, **you may have to make changes to the file path slashes in the R code according to your OS needs.**

## Course Project
The code needs the following data files (zip) to be downloaded to your computer:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Additional info on these files can be found on:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
After you have downloaded the zip file to your computer (replacing yourname by your own Windows username):

+ Unzip the downloaded file on your local drive in the folder C:\\Users\\yourname\\Documents\\R\\
+ All the unzipped files should now be found under C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\. That folder should only include 2 subfolders (train, test - which each have their own files), along with 4 text files.
+ Get the run_analysis.R code from my Github repos (you can copy and paste the code found in that file to a text file with the same name, and save it under C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\
+ Start R Studio
+ Set your working directory in R Studio using this command: setwd("C:\/Users\/yourname\/Documents\/R\/UCI HAR Dataset\/") **Path is OS dependent - you may have to adapt**
+ The R Script requires packages plyr and dplyr. **Please insure you have downloaded these packages using Tools - Install Packages in R Studio (if you don't already have in the past)**
+ Write the following command in R Studio: source("run_analysis.R") **This will take few seconds to run**
+ The code will produce a file called **subj_activ_averages.txt** which can be read using the following commands in RStudio:  data <- read.table("subj_activ_averages.txt", header=TRUE); View(data)
+ This file includes 180 rows (30 subjects x 6 activities) with the mean of each 66 variables for each subject and activities - dimension is therefore 180x68

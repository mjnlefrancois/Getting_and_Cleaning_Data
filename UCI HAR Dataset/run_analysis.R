###################################################################
## 1) Merge the training and the test sets to create one data set
###################################################################

## Merge X files

dtXtrain <- read.table("./train/X_train.txt")
dtXtest <- read.table("./test/X_test.txt")
dtX <- rbind(dtXtrain, dtXtest)

## Merge Y files
dtYtrain <- read.table("./train/Y_train.txt")
dtYtest <- read.table("./test/Y_test.txt")
dtY <- rbind(dtYtrain, dtYtest)

## Merge Subject (volunteers) files
dtSubjecttrain <- read.table("./train/subject_train.txt")
dtSubjecttest <- read.table("./test/subject_test.txt")
dtSubject <- rbind(dtSubjecttrain, dtSubjecttest)


############################################################################################
## 2) Extracts only the measurements on the mean and standard deviation for each measurement
############################################################################################

## Read the features data set
dtFeatures <- read.table("./features.txt")

## Set the name of the merged X dataset using the features in the text file
names(dtX) <- as.character(dtFeatures$V2)

## Logical Vector of features to keep (mean and standard deviation only)
features <- grepl(pattern = "-mean\\(\\)|-std\\(\\)",x = dtFeatures$V2, ignore.case = FALSE)

## Only keep the mean and std from the merged X datasets
dtX <- dtX[,features]

############################################################################
## 3) Uses descriptive activity names to name the activities in the data set
############################################################################

## Read the activity data sets
dtActivities <- read.table("./activity_labels.txt")

## Replace the underscores as well as present in lowercase
dtActivities[, 2] <- gsub("_", "", tolower(as.character(dtActivities[, 2])))

## Replace the code by the decsriptive activity name
dtY$V1 <- dtActivities$V2[match(dtY$V1, dtActivities$V1)]

#######################################################################
## 4) Appropriately labels the data set with descriptive variable names 
#######################################################################

## Clean up the variable names - all lowercase, and remove the parenthesis
names(dtX) <- tolower(names(dtX))
names(dtX) <- gsub(pattern = "\\(|\\)", "", names(dtX))
names(dtSubject) <- c("subject")
names(dtY) <- c("activity")

## Combine the 3 datasets - Subject, Y (activity), and X (measurements)
complete <- cbind(dtSubject, dtY, dtX)

###########################################################################
## 5) From the data set in step 4, creates a second, independent tidy data 
## set with the average of each variable for each activity and each subject
###########################################################################

library(plyr)
library(dplyr)

## Summarize the average of all means and standard deviations measurements in the data set by subject / activity
finaldf <- complete %>% group_by(activity, subject) %>% summarise_each(funs(mean))

## Produce a txt file with the final results of means of all observations by activity/subject

write.table(finaldf, file="./subj_activ_averages.txt", row.names=FALSE)
# read.table("./subj_activ_averages.txt")

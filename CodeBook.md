==================================================================
Getting & Cleaning Data Course - Coursera, December, 2014
Course Project
==================================================================

This CodeBook.md describes the variables, the data, and the transformations and work performed to clean up the data and build the two tidy datasets.

==================================================================

By executing the download() function in the run_analysis.R script the raw data sets are written in the Course_Project directory.
The run_analysis() function in the run_analysis.R script will perform the transformations below to the raw data sets and write two tidy data sets: "train_test.txt" and "tt_means.txt".

The transformations and work are:

a) Read the raw dat sets in the Course_Project\UCI HAR Dataset directory:
     activity_labels.txt (Links the class labels with their activity name, the readable activity labels)
     features.txt (readable variable names, each row corresponding to a column of the variables files)
     test/subject_test.txt (subjects measured, each corresponding to an observation)
     test/X_test.txt (Test set, variables)
     test/y_test.txt (activity code corresponding to variable row)
     train/subject_train.txt (subjects measured, each corresponding to an observation)
     train/X_train.txt (Training set, variables)
     train/y_train.txt (activity code corresponding to variable row)
    
b.1) cbind train/subject_train.txt, train/y_train.txt, train/X_train.txt as a new data.frame "train".
b.2) merge activity_labels.txt and the "train" data.frame from above to include the readable activity name to each observation.

c.1) cbind test/subject_test.txt, test/y_test.txt, test/X_test.txt as a new data.frame "test".
c.2) merge activity_labels.txt and the "test" data.frame from above to include the readable activity name to each observation.

d) rbind "train" and "test" on a new data.frame train_test. 
    
e) extract measurements on the mean and standard deviation overwriting "train_test" and writing this tidy dataset as "train_test.txt". I used the grep() function to select features containing "-mean()" or "-std()". This completes steps 1-4 of the instructions. See structure description of this data set below.

f) melt the train_test data frame from, and

g) dcasts to calculate the means of the  extracted variables, writing this tidy dataset as "tt_means.txt". See structure description of this data set below. (This completes step 5. of the instructions).

==================================================================

Structure of the output files:

- train_test is a tidy data set with 10,300 observations and 68 columns. The variables contain all of the "-mean()" or "-std()" observations.
- tt_means is a tidy data set with 181 observations and 68 columns. The variables contain the average of each variable for each activity and each subject of the "-mean()" or "-std()" observations.
Both datasets have the same column names, which are:

"activity"
"subject"
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyAccMag-mean()"
"tGravityAccMag-mean()"
"tBodyAccJerkMag-mean()"
"tBodyGyroMag-mean()"
"tBodyGyroJerkMag-mean()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyAccMag-mean()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroJerkMag-mean()"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-std()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-std()"
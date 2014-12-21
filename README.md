==================================================================
Getting & Cleaning Data Course - Coursera, December, 2014
Course Project
==================================================================

This README.md explains how all of the scripts work and how they are connected.

==================================================================

Two functions in the run_analysis.R script should be executed: download() and run_analysis().

- download()
    Will download the "dataset.zip" to the Course_Project directory and unzip the raw data sets to the "UCI HAR Dataset" directory. The script performs the following steps:
    a) Creates a directory named Course_Project,
    b) sets this directory as de working directory,
    c) unzips the dataset.zip file.

- run_analysis()
    Will write two files in the Course_Project directory: "train_test.txt" and "tt_means.txt". Should be run with working directory set to Course_Project if executed separately from download(). The script performs the following steps:
        a) Reads the raw dat set,
        b) places the adequate names of the columns using the features.txt downloaded file and replaces the activity codes with activity names merged from the activity_labels.txt downloaded file (steps 3. and 4. of the instructions),
        c) rbinds the train and test data into a single dataset (step 1. of the instructions),
        d) extract measurements on the mean and standard deviation writing this tidy dataset as "train_test.txt" (step 4. of the instructions),
        e) melts the data frame from d), and
        d) dcasts to calculate the means of the extracted variables, writing this tidy dataset as "tt_means.txt" (step 5. of the instructions).
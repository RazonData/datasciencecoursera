# Getting and Cleaning Course Project

in the file run_analysis.R is the code for the tasks of the course project,

You should create one R script called run_analysis.R that does the following. 

  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  3.  Uses descriptive activity names to name the activities in the data set
  4.  Appropriately labels the data set with descriptive variable names. 
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


to run the file the source documents must be in the working directory and in the subfolders /train und /test  according to the downloadeble zip file.

To execute the script you have to have the library(dplyr) and after that you can call the funtion: run_analysis()

The resulting file tidyData.txt will be in working directory

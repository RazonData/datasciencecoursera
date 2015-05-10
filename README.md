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

whats going on in the function you can see in the comments of the code below

run_analysis <- function () {

# load the needed data
TestX<- read.table("./test/X_test.txt")
TestY <- read.table("./test/y_test.txt")
TestSub <- read.table("./test/subject_test.txt")

TrainX<- read.table("./train/X_train.txt")
TrainY <- read.table("./train/y_train.txt")
TrainSub <- read.table("./train/subject_train.txt")

features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

# setting column names

colnames(TestX) <- features[,2]
colnames(TrainX) <- features[,2]
colnames(TestSub) <- "Subject_ID"
colnames(TrainSub) <- "Subject_ID"
colnames(TestY) <- "Act_ID"
colnames(TrainY) <- "Act_ID"

# 1. Merges the training and the test sets to create one data set.

total_Test <- cbind(TestSub, TestY, TestX) 
total_Train <- cbind(TrainSub, TrainY, TrainX) 
total <- rbind(total_Test, total_Train)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
columnNames <- colnames(total)

MeanStdCols <- grepl("(Subject_ID|Act_ID|mean|std)", columnNames,ignore.case=T)    # Build a logical vector with TRUE for the needed columns

total_relevant <- total[MeanStdCols==TRUE]    # Discard every column not needed


# 3. Uses descriptive activity names to name the activities in the data set

colnames(activity_labels) <- c("Act_ID", "Activity Category")

total_act <- merge(activity_labels,total_relevant,by.x="Act_ID",by.y="Act_ID",all=TRUE)


columnNames <- colnames(total_act)   # include "Activity Category" in colNames



# 4. Appropriately labels the data set with descriptive variable names. 


# Cleaning up with following clearing rules
for (i in 1:length(columnNames)) 
{
  columnNames[i] = gsub("-mean","Mean",columnNames[i]) 
  
  columnNames[i] = gsub("-std$","Standard Deviation",columnNames[i])
  columnNames[i] = gsub("\\()","",columnNames[i])
  columnNames[i] = gsub("^(t)","time",columnNames[i])
  columnNames[i] = gsub("^(f)","freq",columnNames[i])
  columnNames[i] = gsub("BodyBody","Body",columnNames[i])
}

colnames(total_act) = columnNames   # set cleared column Names 


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

totalminusactID  = total_act[,names(total_act) != 'Act_ID']  # eleminate "ACT_ID"


# creating tidy data set with the means for each variable for each activity and each subject
tidyData <- aggregate(totalminusactID[,names(totalminusactID) != c("Activity Category","Subject_ID")],by=list("Activity Category"=totalminusactID$"Activity Category",Subject_ID = totalminusactID$Subject_ID),mean)



write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t') # Export the tidy data set 

}

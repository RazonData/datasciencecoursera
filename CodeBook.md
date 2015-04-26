#Code Book for run_anaysis.R

#Original Data

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For this case it is only used the train and test Subfolders and features.txt and activity_labels.txt

# Data Transformations

- For the x-Data-sets I used the entries of features.txt as Column Names in the given order.
- From the X - Data I discarded every column that has no "mean" or "std" included.
- I merged the activity_labels with the y-Data-Sets. For this we used the ID (column 1 in activity labels) and the existing column in the Y-Data sets
- I cbind the X, Y and subject Data for train and test together. 
- after that I rbind test and train to get the whole Dataset

# Tidy Dataset

The tidy Dataset includes the average of each variable for each activity and each subject

for the better readability follwing changes were made in the colum names:
- "mean" was replaced by "Mean"
- "-std$" was replaced by "Standard Deviation"
- "\\()" was eliminated
- "^(t)" was replaced by "time"
- "^(f)" was replaced by "freq"
- "BodyBody" was replaced by "Body"

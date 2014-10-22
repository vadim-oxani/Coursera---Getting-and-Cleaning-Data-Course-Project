## Download and extract the .zip file
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileURL, destfile = 'data_set.zip')
unzip('data_set.zip', exdir = 'data')
unlink('data_set.zip')

## Creating data.frames for all the records 
## Merges the training and the test sets to create one data set
setwd('data'); setwd(dir()[1])
X_train_test_merged <- rbind(read.table('./test/X_test.txt'), 
				read.table('./train/X_train.txt'))
subject_train_test_merged <- rbind(read.table('./test/subject_test.txt'), 
				read.table('./train/subject_train.txt'))
y_train_test_merged <- rbind(read.table('./test/y_test.txt'), 
				read.table('./train/y_train.txt'))

## Sub-setting the data on mean and std values of measurements 
## Extracts only the measurements on the mean and standard deviation 
## for each measurement
features <- read.table('features.txt')
index_mean <- grepl('mean()', as.character(features[,2]), fixed = TRUE)
index_std <- grepl('std()', as.character(features[,2]), fixed = TRUE)
X_train_test_merged_mean_std <- cbind(X_train_test_merged[, index_mean], 
				X_train_test_merged[, index_std]) 

## Naming activities in y_train_test_merged with labels from 
## activity_labels.txt. Uses descriptive activity names to name 
## the activities in the data set
activities <- read.table('activity_labels.txt')
for(i in as.numeric(activities[, 1])){
								y_train_test_merged[, 1] <- gsub(i, 
								activities[, 2][i], y_train_test_merged[, 1])
}

## Define column names {4.Appropriately labels the data set with descriptive 
## variable names.}
colnames(X_train_test_merged) <- as.character(read.table('features.txt')[, 2])
colnames(subject_train_test_merged) <- 'subject'
colnames(y_train_test_merged) <- 'activity'
agregated_data <- cbind(subject_train_test_merged, y_train_test_merged, 
				X_train_test_merged)

## Load data.table package and transform our data.frame into data.table. 
## Create a second, independent tidy data set with the average of each 
## variable for each activity and each subject.}
library(data.table)
agregated_data <- as.data.table(agregated_data)
final_data <- agregated_data[, lapply(.SD, mean), by = list(subject, activity), 
				.SDcols = 3:length(agregated_data)][order(subject,activity)]
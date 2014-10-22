---
title: "CookBook"
author: "Vadim Oxani"
date: "Wednesday, October 22, 2014"
output: html_document
---

##Data:

The data is collected from the accelerometers from the Samsung Galaxy S smartphone. The data can be found here <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data source link: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The zip file contains the README.txt file with the data description. The below snipped has been copied:

****
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:


* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

****

##Data processing

1. The zip file has been downloaded and extracted in a folder called 'data'. The zip archive is deleted immediately afterwards.

2. The training and the test sets has ben merged to create one data set.

3. Only the measurements on the mean and standard deviation for each measurement have ben extracted; the 'X_train_test_merged_mean_std' data.frame object is created: 

4. The activity records from 'X_train_test_merged_mean_std' have been labeled according to its meta-data from 'activity_labels.txt'

5. The data.frame object's columns has been labeled with the info from 'features.txt' and the data name of merged columns.

6. The data.frame object's data has been grouped in order to select the average of each variable for each activity and each subject.


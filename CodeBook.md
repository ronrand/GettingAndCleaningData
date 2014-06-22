Getting and Cleaning Data Course Project CodeBook
=================================================

##The original Data source

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while 
carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Source: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - UniversitÃ degli Studi di Genova, Genoa I-16145, Italy. activityrecognition '@' smartlab.ws www.smartlab.ws
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones     
* Raw data set download source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Transformation Steps
Merges the training and test sets and creates individual datasets
train/X_train.txt and test/X_test.txt – creates a 10299 x 561 data frame
train/subject_train.txt and test/subject_test.txt – creates a 10299 x 1 data frame with subject IDs train/y_train.txt and test/y_test.txt -- creates a 10299 x 1 data frame with activity IDs.
Reads file features.txt and extracts only the measurements on the mean and standard deviation of each observed measurement
This produces a 10299 x 66 data frame, with all measurements being floating point values.

Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
Laying
Walkingdownstairs
walkingupstairs
sitting
walking
standing
Script labels the data set with meaning full and descriptive names: all feature names (attributes) and activity names are converted to lower case, with underscores and parenthesis ‘()’ being removed are removed. Also merges the data frame containing features with data frames containing activity labels and subject IDs. The result is saved as tidy_data_1, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30. Names of the attributes are similar to the following:
tbodyacc-mean-x
tbodyacc-mean-y
tbodyacc-mean-z
tbodyacc-std-x
tbodyacc-std-y
tbodyacc-std-z
tgravityacc-mean-x
tgravityacc-mean-y
Lastly, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as tidy_data_2.txt, a 180x68 data frame. The first column contains subject IDs, the second column contains activity and then the averages for each of the 66 attributes are in columns 3 to 68. There are 30 subjects and 6 activities, totally180 rows in this data set with averages.


* The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in *trainData*, *trainLabel* and *trainSubject* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in *testData*, *testLabel* and *testsubject* variables respectively.  
 3. Concatenate *testData* to *trainData* to generate a 10299x561 data frame, *joinData*; concatenate *testLabel* to *trainLabel* to generate a 10299x1 data frame, *joinLabel*; concatenate *testSubject* to *trainSubject* to generate a 10299x1 data frame, *joinSubject*.  
 4. Read the features.txt file from the "/data" folder and store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of *joinData* with the 66 corresponding columns.  
 5. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.   
 6. Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called *activity*.  
 7. Clean the activity names in the second column of *activity*. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.  
 8. Transform the values of *joinLabel* according to the *activity* data frame.  
 9. Combine the *joinSubject*, *joinLabel* and *joinData* by column to get a new cleaned 10299x68 data frame, *cleanedData*. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.  
 10. Write the *cleanedData* out to "merged_data.txt" file in current working directory.  
 11. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the *result* data frame and performing the two for-loops, we get a 180x68 data frame.
 12. Write the *result* out to "data_with_means.txt" file in current working directory. 
 
 
 CodeBook for run_analysis.R
The original Data source

The Orginal data source is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (run_analysis.R) : 
 
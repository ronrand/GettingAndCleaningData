##Getting and Cleaning Data Course Project
========================================
###Processing Summary
This utility summarizes the raw data from smartphones by individual and activity.
* reads each input file,
* combines the training and test data,
* labels the variables, activities, and subjects
* aggregetes the data
* calulates the means
* A tidy dataset that contains 180 rows ( 30 volunteers * 6 activies), 
and 81 columns (subject, activity + only colunms that contained mean or std in the feature names).

###Running the Code
How **run_analysis.R** script works.
* Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Retain the original folder name **UCI HAR Dataset**.
* Make sure the folder **UCI HAR Dataset** and the **run_analysis.R** script are both in the current working directory.
* Use **source("run_analysis.R")** command in RStudio. 
* Two output files are generated in the current working directory:
  - **TidyDataSet.txt** : Contains a tab delimited file with a 10299*68 dimension. (average score by Subject and Activity)
  - **TidyDataWithMeans.txt** : Contains tab delimited file with a 180*68 dimension.(a summarized version by mean and SD parameters)
* Use **data <- read.table("TidyDataWithMeans.txt")** command in RStudio to read the file. 

###Input Data Files Used
* features.txt: names of the variables monitored
* X_train.txt: training data
* y_train.txt: activities
* subject_train.txt: subjects that performed the activity
* X_test.txt: testing data
* y_test.txt: activities
* subject_train.txt: subjects that performed the activity
Only the data files in the first level subdirectories (train and test folder) were used.
Data within the Inertial Data subdirectories was not used. 

The original variable names can be found in the file "features.txt". Column names were altered for better readability.
Parentheses and dashes were removed. "Mean" and "Std" were capitalized to maintain a title case naming convention.
The instances of "BodyBody" in the features.txt was changed to a single wording of "Body". Which I believe to be a typo.

It extracts the data from the text files using read.table
Then binds the train and test data together to form a unified data table
It labels the activities with the appropriate names
Adds the feature names to the data table columns

###Output Files
The tidy data set with labels for both training and test data is outputted as tab delimited text file to the work directory.
A second tidy data set is created with the mean of each feature for each activity for each subject.
The second file is outputted as tab delimited text file to the work directory as well.


###Background info about the Data
Human Activity Recognition Using Smartphones Dataset Version 1.0
Use of this dataset in publications must be acknowledged by referencing the following publication.

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For more information about this dataset contact: activityrecognition@smartlab.ws
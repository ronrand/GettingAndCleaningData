##Getting and Cleaning Data Course Project CodeBook


#The original Data source

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while 
carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Source: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - UniversitÃ degli Studi di Genova, Genoa I-16145, Italy. activityrecognition '@' smartlab.ws www.smartlab.ws
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones     
* Raw data set download source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Transformation Steps
Reads original data files and merges the training and test sets together
X_train.txt	 assign to: 	trainData
y_train.txt	 assign to: 	trainLabel
X_test.txt	 assign to: 	testData
y_test.txt	 assign to: 	testLabel
subject_test.txt	 assign to: 	subTest
subject_train.txt	 assign to: 	subTrain
trainData and testData merge into dataJoin
trainLabel and testLabel merge into labelJoin 
subTrain and subTest  merge into subJoin
Read features.txt and extracts only the measurements on the mean and standard deviation of each observed measurement


Reads activity_labels.txt and applies descriptive names to name the six activity numbers in the data set:
Laying
Walkingdownstairs
walkingupstairs
sitting
walking
standing

Descriptive names are given to measurement columns. Column names were altered for better readability.
Parentheses and dashes were removed. "Mean" and "Std" were capitalized to maintain a title case naming convention.
The instances of "BodyBody" in the features.txt was changed to a single wording of "Body". Which I believe to be a typo.
tbodyacc-mean-x
tbodyacc-mean-y
tbodyacc-mean-z
tbodyacc-std-x
tbodyacc-std-y
tbodyacc-std-z
tgravityacc-mean-x
tgravityacc-mean-y

#Output Files
The tidy data set with labels for both training and test data is outputted as tab delimited text file to the work directory.
A second tidy data set is created with the mean of each feature for each activity for each subject.
The second file is outputted as tab delimited text file to the work directory as well.

The first column contains subject identification number, the second contains activity labels. The columns 3 to 68 are the averages for each of the 66 attributes. There are 30 subjects and 6 activities totaling 180 rows with averages.



 
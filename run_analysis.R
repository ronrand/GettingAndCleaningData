#### The folder "UCI HAR Dataset" must be in your working directory. #####


## Merge the training and the test sets to create one dataset.

# Read Data
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE, stringsAsFactors=FALSE)
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE, stringsAsFactors=FALSE)
subTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE, stringsAsFactors=FALSE)
testData <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE, stringsAsFactors=FALSE)
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE, stringsAsFactors=FALSE) 
subTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE, stringsAsFactors=FALSE)

# Merge Data
dataJoin <- rbind(trainData, testData)
labelJoin <- rbind(trainLabel, testLabel)
subJoin <- rbind(subTrain, subTest)


## Extract only the measurements on the mean and standard deviation of each measurement.
features <- read.table("./UCI HAR Dataset/features.txt")
meanStdMeasurement <- grep("mean\\(\\)|std\\(\\)", features[, 2])
dataJoin <- dataJoin[, meanStdMeasurement]


## Use descriptive activity names to name the activities in the dataset
colnames(dataJoin) <- gsub("\\(\\)", "", features[meanStdMeasurement, 2]) # remove parentheses
colnames(dataJoin) <- gsub("mean", "Mean", colnames(dataJoin)) # capitalize M
colnames(dataJoin) <- gsub("std", "Std", colnames(dataJoin)) # capitalize S
colnames(dataJoin) <- gsub("-", "", colnames(dataJoin)) # remove dash in column names 
colnames(dataJoin) <- gsub("BodyBody", "Body", colnames(dataJoin)) # remove typo in column names 

# Read Data
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", " ", activity[, 2])) #  lowercase and remove underscore
substr(activity[2, 2], 9, 9) <- toupper(substr(activity[2, 2], 9, 9))
substr(activity[3, 2], 9, 9) <- toupper(substr(activity[3, 2], 9, 9))
substr(activity[1, 2], 1, 1) <- toupper(substr(activity[1, 2], 1, 1))
substr(activity[2, 2], 1, 1) <- toupper(substr(activity[2, 2], 1, 1))
substr(activity[3, 2], 1, 1) <- toupper(substr(activity[3, 2], 1, 1))
substr(activity[4, 2], 1, 1) <- toupper(substr(activity[4, 2], 1, 1))
substr(activity[5, 2], 1, 1) <- toupper(substr(activity[5, 2], 1, 1))
substr(activity[6, 2], 1, 1) <- toupper(substr(activity[6, 2], 1, 1))

# Label Data
activityLabel <- activity[labelJoin[, 1], 2]
labelJoin[, 1] <- activityLabel


## Appropriately label the dataset with descriptive activity  names. 
colnames(labelJoin) <- "activity"
colnames(subJoin) <- "subject"

# Merge Data
cleaned <- cbind(subJoin, labelJoin, dataJoin)


# write out the 1st dataset as tab delimited text file
write.table(cleaned, "TidyDataSet.txt", sep='\t', quote=FALSE, row.names=FALSE) 

## Create a second, independent tidy dataset with the average of each variable for each activity and each subject. 

subLength <- length(table(subJoin)) # 30
activityLen <- dim(activity)[1] # 6
columnLength <- dim(cleaned)[2] #68
result <- matrix(NA, nrow=subLength*activityLen, ncol=columnLength) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleaned)
dim(result)

## calculate mean
row <- 1
for(i in 1:subLength) {
    for(j in 1:activityLen) {
        result[row, 1] <- sort(unique(subJoin)[, 1])[i]
        result[row, 2] <- activity[j, 2]
        mtx1 <- i == cleaned$subject
        mtx2 <- activity[j, 2] == cleaned$activity
        result[row, 3:columnLength] <- colMeans(cleaned[mtx1&mtx2, 3:columnLength])
        row <- row + 1
    }
}
head(result)
colnames(result) <- gsub("subject" , "Subject" , colnames(result)) # capitalize S
colnames(result) <- gsub("activity", "Activity", colnames(result)) # capitalize A


# Write 2nd dataset as tab delimited text file
write.table(result, "TidyDataWithMeans.txt", sep='\t', quote=FALSE, row.names=FALSE) 

# Read file
data <- read.table("./TidyDataWithMeans.txt" ,sep='\t');data


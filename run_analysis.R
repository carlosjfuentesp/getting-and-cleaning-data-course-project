##
##   DOWNLOAD & UNZIP RAW DATA
##
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "fucihar.zip")
unzip("fucihar.zip")

##
##   JOIN TRAIN & TEST DATASETS
##
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

##
##   GET FEATURE DESCRIPTION
##
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
colnames(X) <- features[,2]

##
##   GET ACTIVITY DESCRIPTION
##
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(activity_labels) <- c("activity_id", "activity_description")
colnames(y) <- c("activity_id")

##
##   GET SUBJECT ID
##
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subject <- rbind(subject_train, subject_test)
colnames(subject) <- c("subject_id")
 
##
##   JOIN DATA WITH ACTIVITY DESCRIPTION AND SUBJECT ID
##
X_mean_std <- X[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543),]
Xy_subject <- cbind(subject, X_mean_std, y)
Xy_activity <- merge(Xy_subject, activity_labels, by = "activity_id")

##
##   SUMMARIZE DATA
##
Xy_avg <- aggregate(Xy_activity[,3:68], Xy_activity[,c(69, 2)], FUN=mean)

##
##   EXPORT DATA
##
write.table(Xy_activity, "HAR_tidy_data.csv", sep="\t", row.names=F)
write.table(Xy_avg, "HAR_averages.csv", sep="\t", row.names=F)

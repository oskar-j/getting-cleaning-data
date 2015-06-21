# setwd("C:/big data/coursera/clean-data/assignment")
setwd("UCI HAR Dataset/")
# 1.Merges the training and the test sets to create one data set.
dataset <- cbind(
   rbind(read.table("train/subject_train.txt"),
         read.table("test/subject_test.txt")),
   rbind(read.table("train/y_train.txt"),
         read.table("test/y_test.txt")),
   rbind(read.table("train/X_train.txt"),
         read.table("test/X_test.txt")))

# 2.Extracts only the measurements on the mean
#   and standard deviation for each measurement.
features <- read.table("features.txt")
colnames(features) <- c("id", "name")
is_mean <- grepl("-mean\\(", features$name)
is_std  <- grepl("-std\\(", features$name)
is_mean_or_std <- is_mean | is_std

measurements <- dataset[, c(TRUE, TRUE, is_mean_or_std)]

# 3.Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
names(measurements)[1] <- "subjectid"
names(measurements)[2] <- "activity"
measurements$activity <- as.factor(sapply(
   measurements$activity,
   function(x) activities[which(activities$V1==x), 2]))

# 4.Appropriately labels the data set with descriptive variable names.
newcolnames <- c("subjectid", "activity",
                 as.character(features[is_mean_or_std, c("name")]))
# remove every non-alphabetic character and convert to lowercase
newcolnames <- tolower(gsub("[^[:alpha:]]", "", newcolnames))
# finally apply them
colnames(measurements) <- newcolnames

# 5.From the data set in step 4, creates a second, independent tidy
# data set with the average of each variable for each activity
# and each subject.
aggr <- aggregate(measurements[, 3:ncol(measurements)],
                  by=list(subjectid = measurements$subjectid,
                          activity = measurements$activity),
                  mean)

# results
write.table(aggr, file="tidy_data.txt", row.names=F)

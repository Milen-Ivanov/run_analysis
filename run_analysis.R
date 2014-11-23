# GETTING AND CLEANING DATA - COURSE PROJECT

# This script uses packages "data.table" and "reshape2"

install.packages("data.table")
library(data.table)

install.packages("reshape2")
library(reshape2)

# 1. Merge the training and the test sets to create one data set.

## Import all source files
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")

y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

features_all <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## bind the rows

X<-rbind(X_test,X_train)
Y<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Get feature titles
feature_titles <- features_all[,2]

# set X (combined x_test and x_train) names to feature titles
names(X) <- feature_titles

# strip out all fields that are not mean or standard deviation
X <- X[,grepl("mean|std", feature_titles)]


# 3. Use descriptive activity names to name the activities in the data set

# Get activity titles
activity_titles <- activity_labels[,2]

# add a second column of activity titles based on the activity id
Y[,2]  <- activity_titles[Y[,1]]

# set activity names
names(Y)<-c("activity_id", "activity_title")


# 4. Merge the data, Appropriately label the data set with descriptive variable names nad save as txt file. 

names(subject) <- 'subject_id'

## Combine Final data into one data table
tidy_data_1 <- cbind(as.data.table(subject), X, Y)
write.table(tidy_data_1, "./tidy_data_1.txt",row.name=FALSE)

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
data_melt <- melt(tidy_data_1, id = c("subject_id", "activity_id", "activity_title"), measure.vars = names(X))
tidy_data_2 <- dcast(data_melt, subject_id + activity_title ~ variable, mean)

# Output tidy_data to a file.
write.table(tidy_data_2, file="tidy_data_2.txt",row.name=FALSE)












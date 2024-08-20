# Download the dataset
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(dataset_url, destfile = "dataset.zip")

# Unzip the dataset
unzip("dataset.zip")

# Load activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityId", "activityLabel"))

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("featureId", "featureName"))

# Load training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$featureName)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activityId")

# Load test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$featureName)

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activityId")

# Merge the training and test sets
subject_data <- rbind(subject_train, subject_test)

x_data <- rbind(x_train, x_test)

y_data <- rbind(y_train, y_test)

# Extract only the measurements on the mean and standard deviation
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

x_data <- x_data[, mean_std_features]

# Set the column names
names(x_data) <- features[mean_std_features, 2]

# Replace activity numbers with descriptive names
y_data[, 1] <- activity_labels[y_data[, 1], 2]

names(y_data) <- "Activity"

# Label the dataset with descriptive variable names
names(subject_data) <- "Subject"

merged_data <- cbind(subject_data, y_data, x_data)

# Step 7: Create a second, independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)

tidy_data <- merged_data %>% group_by(Subject, Activity) %>% summarise_all(mean)

# Write the tidy data set to a text file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
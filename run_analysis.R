library(plyr)

# 1. Merges the training and the test sets to create one data set.

# Read training and the test data sets.
x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

# Merge datasets.
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

#2 Extracts only the measurements on the mean and standard deviation for each measurement. 

# Read features.
features <- read.table("features.txt")

# Get columns with mean() or std() in their names.
cols_mean_std <- grep("-(mean|std)\\(\\)", features[,2])

# Subset the columns to mean() and std().
x_mean_std <- x_all[ , cols_mean_std]

# Extract corresponding column names.
colnames(x_mean_std) <- features[cols_mean_std,2]

# 3. Uses descriptive activity names to name the activities in the data set

# Read activity labels.
activities <- read.table("activity_labels.txt")

# Add activity names.
y_all[ , 1] <- activities[y_all[,1],2]

# 4. Appropriately labels the data set with descriptive variable names. 

# Add column name to activities column.
colnames(y_all) <- "Activity"

# Add column name to subjects column.
colnames(subject_all) <- "Subject"

# Bind all  data in a data set.
all <- cbind(y_all, subject_all, x_mean_std)

# 5 Average of each variable for each activity and each subject. 
# Column 1 and 2 correspond to Subject and Activity,
averages <- ddply(all, .(Subject, Activity), function(x) colMeans(x[, 3:68]))

# Export to file. 
write.table(averages, "averages.txt", row.name=FALSE)
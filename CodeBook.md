Getting and Cleaning Data Course Project CodeBook

This file describes variables, data, and transformations performed to clean up the data.

A full description of original data is available at where was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project is:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Introduction

The script `run_analysis.R` performs the 5 steps for course project.

1. Data of same type are merged using the `rbind()` function. 
2. Only those columns with mean and standard deviation measures are taken from the dataset. Then are given the correct names from `features.txt`.
3. The activity names ane taken from `activity_labels.txt` and they are added to the dataset.
4. The columns are named appropriately.
5. A new dataset is generated with the average measures for each subject and activity type. The output file is called `averages.txt`.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train`, and `subject_test` contain data from  downloaded files.
* `x_all`, `y_all` and `subject_all` merge the previous data sets.
* `features` contains the names for the `x_all` data set.
* `cols_mean_std` contains the columns with mean or std in their names, and are used to subset `x_all` and store the result in `x_mean_std`.
* `activities` contains the names of activities. A similar approach is taken with activity names through the `activities` variable.
* `all` merges `x_all`, `y_all` and `subject_all` in a single dataset.
* `averages` contains the averages for each activity and each subject. Which will be later stored in a `averages.txt` file. `ddply()` from the plyr package is used to apply `colMeans()`.

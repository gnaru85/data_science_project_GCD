# data_science_project_GCD
Peer-graded Assignment: Getting and Cleaning Data Course Project
# Getting and Cleaning Data: Course Project

This repository contains the R script and documentation for the course project of the "Getting and Cleaning Data" course on Coursera. The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset.

## Project Overview

The project involves working with the Human Activity Recognition Using Smartphones Dataset, specifically with the data collected from the accelerometers from the Samsung Galaxy S smartphone. The task is to clean and prepare the data for later analysis.

## Files in the Repository

- **`run_analysis.R`**: This is the R script that performs the data cleaning and processing steps. It merges the training and test sets, extracts measurements of mean and standard deviation, labels the dataset with descriptive variable names, and creates a tidy dataset with the average of each variable for each activity and each subject.

## Detailed Steps Performed in the Analysis

1. **Download and Unzip the Dataset**: The script first downloads the dataset from the provided URL and unzips it into the working directory.

2. **Load the Data**: The script loads the training and test datasets along with their associated labels, subjects, and features.

3. **Merge the Training and Test Sets**: The script merges the training and test sets to create one combined dataset.

4. **Extract Mean and Standard Deviation Measurements**: The script extracts only the measurements on the mean and standard deviation for each measurement.

5. **Use Descriptive Activity Names**: The script replaces the activity codes with descriptive activity names to make the dataset more readable.

6. **Label the Dataset with Descriptive Variable Names**: The script appropriately labels the dataset with descriptive variable names, based on the features provided in the dataset.

7. **Create a Second, Independent Tidy Data Set**: The script creates a second tidy dataset that contains the average of each variable for each activity and each subject. This tidy dataset is saved as `tidy_data.txt`.

## How to Use the Script

1. Clone this repository to your local machine.
2. Place the `run_analysis.R` script in your working directory.
3. Run the script in R or RStudio. The script will automatically download the dataset, process it, and output the tidy data file (`tidy_data.txt`) in your working directory.

## Dependencies

- R (version 3.6.0 or later)
- dplyr package (version 0.8.3 or later)

You can install the `dplyr` package by running `install.packages("dplyr")` in R.

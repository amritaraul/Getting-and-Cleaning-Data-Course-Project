# Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the site where the data was obtained : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data for the project : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repository is a Nunno Nugroho submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset.This repository contains the following files:

*	README.md, which provides an overview of the data set.
*	CodeBook.md, which describes the contents of the data set (data, variables and transformations).
*	run_analysis.R, the R script that was used to create the data set.
*	tidy.txt, which contains the final data set.

run_analysis.R does the following as required by the course project:
*	Merges the training and the test sets to create one data set.
*	Extracts only the measurements on the mean and standard deviation for each measurement.
*	Uses descriptive activity names to name the activities in the data set.
*	Appropriately labels the data set with descriptive variable names.
*	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

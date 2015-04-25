This R script(run_analysis.R) is for project assignment of 'Getting&Cleaning Data' held by JHU
Md Datetime: 2015.04.25 17:30

Overall Intro:
  
  The script contains five parts,corresponding to the five steps required in the project assignment
page.The five steps are as follows:
  1.Merges the training and the test sets to create one data set.
  2.Extracts only the measurements on the mean and standard deviation for each measurement. 
  3.Uses descriptive activity names to name the activities in the data set
  4.Appropriately labels the data set with descriptive variable names. 
  5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Downloading Data and Setting Working Directory:
  
  Before running the script, it requires some datasets to be ready on your computer. If you don't have the data,you may download it through the link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  When data are ready, it's better if you put this R script under the file 'UCI HAR Dataset',the script already done other setting wds for you.
  Detailed description about data can be found in this link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  The data are about detecting human movements with mobile devices.Our main task here focuses on merging the training and testing datasets together,and manipulating the resulting dataset to make it tider and more readable.

Code Book:
  
  See 'code_book.txt'
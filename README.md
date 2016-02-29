The purpose of this assignment is to demonstrate the skill of getting and cleaning data. 
This repo shows how different sets of data were acquired and processed. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Code was provided for each step
1. Merges the training and the test sets to create one data set.
    All data sets were downloaded from the website. 
2. Extracts only the measurements on the mean and standard deviation for each measurement.
    The features contains mean() and std() were selected. 
3. Uses descriptive activity names to name the activities in the data set
    Activity_Label.txt was used as a reference of the description. 
4. Appropriately labels the data set with descriptive variable names.
    Participates were labeled with "ID"
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and     each subject.
    The summary were created. 

REFERENCES

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

[2] David Hood,  Getting and Cleaning the Assignment , https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

rm(list = ls())
setwd("C:/Users/yttik/Dropbox/Coursera/Cleaning/UCI HAR Dataset")
getwd()
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("data.table")
library(plyr) # load plyr first, then dplyr 
library(data.table) # a prockage that handles dataframe better
library(dplyr) # for fancy data table manipulations and organization


ytrain <- read.table("./train/y_train.txt")
xtrain <- read.table("./train/X_train.txt")
subjectTrain <- read.table("./train/subject_train.txt")
features <- read.table("./features.txt")

xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")
#head(xtest)

names(xtrain)
names(ytest)
ncol(xtest)
ncol(xtrain)
nrow(xtrain)
nrow(xtest)
dataNames<-features[,2]
###combine test and train data
combined<-rbind(xtrain,xtest)
nrow(combined)
names(combined)<-dataNames
head(names(combined))
###extract only mean and standard deviation
##according to the feature_INFO.txt; just find the features with mean() and var()
meanVar <- grep("mean()", dataNames, value = FALSE, fixed = TRUE)
stdVar <- grep("std()", dataNames, value = FALSE,fixed=TRUE)
#meanSTD<-cbind(meanVar,stdVar)
#length(meanSTD)
dataMean<-combined[meanVar]
dataStd<-combined[stdVar]

Meancols<-combined[meanVar]
Stdcols<-combined[stdVar]
Features<-cbind(Meancols,Stdcols)
ncol(Features)
###activity lables; dependent variables
ActivityNum<-rbind(ytrain, ytest)
names(ActivityNum)<-"ActivityNum"
nrow(ActivityNum)
head(ActivityNum)
#ActivityNum<-as.character(ActivityNum)
## adding subject
Subject<-rbind(subjectTrain,subjectTest)
nrow(Subject)
Subject<-as.character(Subject)
### add subject and y get completed data
tidyData1<-cbind(Features,ActivityNum,Subject)
dim(tidyData1)
head(tidyData1$ActivityNum)

write.table(tidyData1, "./mydata0.txt", sep="\t")
####labels of activity
actLabel<-read.table("./activity_labels.txt")
head(actLabel)

names(actLabel)[1] <- "Label"
names(actLabel)[2] <- "Activity"

tidyData1$ActivityNum <- as.character(tidyData1$ActivityNum)
tidyData1$ActivityNum[tidyData1$ActivityNum == 1] <- "WALKING"
tidyData1$ActivityNum[tidyData1$ActivityNum == 2] <- "WALKING_UPSTAIR"
tidyData1$ActivityNum[tidyData1$ActivityNum == 3] <- "WALKING_DOWNSTAIR"
tidyData1$ActivityNum[tidyData1$ActivityNum == 4] <- "SITTING"
tidyData1$ActivityNum[tidyData1$ActivityNum == 5] <- "STANDING"
tidyData1$ActivityNum[tidyData1$ActivityNum == 6] <- "LAYING"
tidyData1$ActivityNum <- as.factor(tidyData1$ActivityNum)
tidyData1$Subject<-as.factor(tidyData1$Subject)
write.table(tidyData1, "./mydata.txt", sep="\t")

tidyData2 <- tidyData1[,lapply(.SD, mean), by = 'Subject,ActivityNum']
run_analysis<- (tidyData1%>%
                        group_by(Subject,ActivityNum) %>%
                        summarise_each(funs( mean)))

print(run_analysis)

write.table(tidyData2, "./mydata2.txt", sep="\t")


library(data.table)
dataDT <- data.table(tidyData2)
Result<- dataDT[, lapply(.SD, mean), by=c("Subject", "ActivityNum")]
write.table(Result, "Result.txt")

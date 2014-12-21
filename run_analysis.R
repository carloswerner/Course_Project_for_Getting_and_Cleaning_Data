download<-function() {
  
  ## Download files to Course_Project directory
  if (!file.exists("Course_Project")) {
    dir.create("Course_Project")
  }
  setwd("./Course_Project")
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile="dataset.zip")
  dateDownloaded<-date()
  unzip("dataset.zip")
}

run_analysis<-function() {
  
  #Read and merge files
  features<-read.table("UCI HAR Dataset/features.txt")
  activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",header = FALSE,sep ="",col.names=c("activity_labels","activity"))
  
  subject<-read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep ="",col.names="subject")
  labels<-read.table("UCI HAR Dataset/train/y_train.txt",header = FALSE,sep ="",col.names="activity_labels")
  data<-read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE,sep ="", col.names=features$V2)
  train<-cbind(subject,labels,data)
  train<-merge(activity_labels, train)
  
  subject<-read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep ="",col.names="subject")
  labels<-read.table("UCI HAR Dataset/test/y_test.txt",header = FALSE,sep ="",col.names="activity_labels")
  data<-read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE,sep ="", col.names=features$V2)
  test<-cbind(subject,labels,data)
  test<-merge(activity_labels, test)
  
  train_test<-rbind(train,test)
  train_test$activity_labels<-NULL
  rm(subject, labels, data, activity_labels)
  
  ## Extract measurements on the mean and standard deviation
  features_ms<-c(1,2,(grep("-mean()",features$V2, fixed=TRUE)+2),(grep("-std()",features$V2, fixed=TRUE)+2))
  train_test<-train_test[,features_ms]
  write.table(train_test,file="train_test.txt",row.name=FALSE)
  rm(features,features_ms)
  
  ##Melt the data.frame and calculate means
  library(reshape2)
  tt_melt<-melt(train_test,id=c("activity","subject"),measure.vars=3:68)
  tt_means<-dcast(tt_melt, activity + subject ~ variable, mean)
  write.table(tt_means,file="tt_means.txt",row.name=FALSE)
}
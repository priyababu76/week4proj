
  # Downloading and unzipping url

  if (!file.exists('/home/priya/priya/DataScience- Courseera/workstation/activity/'))
  { dir.create('/home/priya/priya/DataScience- Courseera/workstation/activity/')}
  
  fileurl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  
  destfile<-'/home/priya/priya/DataScience- Courseera/workstation/activity/activity.zip'
  
  if(!file.exists('/home/priya/priya/DataScience- Courseera/workstation/activity/activity.zip'))
  {
  download.file(fileurl,destfile)
  unzip(zipfile='/home/priya/priya/DataScience- Courseera/workstation/activity/activity.zip', exdir = '/home/priya/priya/DataScience- Courseera/workstation/activity/')
  }
  
  # Reading from the training and testing tables
  
  x_train <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/train/subject_train.txt")
  
  x_test <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/test/subject_test.txt")
  
  features <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/features.txt")
  activityLabels <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/activity_labels.txt")
  
  # Assigning the column names
  colnames(x_train)<-features[,2]
  colnames(y_train)<-"activityId"
  colnames(subject_train)<-"subjectId"
  
  colnames(x_test)<-features[,2]
  colnames(y_test)<-"activityId"
  colnames(subject_test)<-"subjectId"

  colnames(activityLabels)<-c("activityId","activityType")
  
 #Merging Data
  all_train<-cbind(y_train,subject_train,x_train)
  all_test<-cbind(y_test,subject_test,x_test)
  mergall<-rbind(all_train,all_test)

  # Reading Column Names
  colNames<-colnames(mergall)
  
  mean_and_sd<-(grepl("activityId",colNames)|
                grepl("subjectId",colNames)|
                grepl("mean..",colNames) |
                grepl("std..",colNames)  
                )
  #Subsetting from mergall
  
  get_mean_sd<-mergall[,mean_and_sd==TRUE]
  
  # Naming Activity Names in the data set
  
  setactivitynames<-merge(get_mean_sd,activityLabels, by="activityId",all.x = TRUE)
  
  # Tidying the second and independent data set
  
  tidyset<-aggregate(. ~subjectId+activityId, setactivitynames,mean)
  tidyset<-tidyset[order(tidyset$subjectId,tidyset$activityId),]
  
  # writing second tidy set to txt file
  write.table(tidyset,"tidyset.txt",row.name=FALSE)
  
  
  
  
 
  
  
  
  
  
  
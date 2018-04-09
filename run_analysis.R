
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
  
  X_train <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/train/X_train.txt")
  Y_train <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/train/y_train.txt")
  Subject_train <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/train/subject_train.txt")
  
  X_test <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/test/X_test.txt")
  Y_test <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/test/y_test.txt")
  Subject_test <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/test/subject_test.txt")
  
  features <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/features.txt")
  activityLabels <- read.table("/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/activity_labels.txt")
  
  # 1. Merges the training and the test sets to create one data set.
  
  X_total <- rbind(X_train, X_test)
  Y_total <- rbind(Y_train, Y_test)
  Sub_total <- rbind(Subject_train, Subject_test)

  
  
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
  X_total <- X_total[,selected_var[,1]]
  
  
  # 3. Uses descriptive activity names to name the activities in the data set
  
  colnames(Y_total) <- "activity"
  Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activityLabels[,2]))
  activitylabel <- Y_total[,-1]
  
  # 4. Appropriately labels the data set with descriptive variable names.
  
  colnames(X_total) <- features[selected_var[,1],2]
  
  
  # 5. From the data set in step 4, creates a second, independent tidy data set with the average
  # of each variable for each activity and each subject.
  
  colnames(Sub_total) <- "subject"
  total <- cbind(X_total, activitylabel, Sub_total)
  total_mean <- total %>% group_by(activitylabel, subject) %>% summarise_all(funs(mean))
  write.table(total_mean, file = "/home/priya/priya/DataScience- Courseera/workstation/activity/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
  
  
  
 
  
  
  
  
  
  
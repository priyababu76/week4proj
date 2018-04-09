pollutantmean<-function(directory,pollutant,id){ 
   
 curr_dir<- getwd()
 
 my_files<- list.files("specdata")
  my_files
 
  for (i in id) {
    new_path<-paste(curr_dir,"/",directory,"/",my_files[i],sep="")
    my_csv<- read.csv(new_path,header=TRUE,sep=",")
    # csv_path<-paste("/home/priya/priya/DataScience- Corseera/workstation",directory,my_files,sep="")
    # first <-my_files[csv_path]
    # 
    # second<-my_files[i+1]
    # read.csv("first")
  }
  new_path
  my_csv
 pollu_data<-my_csv[pollutant]
 pollu_na<-is.na(pollu_data)
 pollu_new<-pollu_data[!pollu_na]
 pollu_mean<-mean(pollu_new)
 pollu_mean
 
}


complete<-function(directory,id)
{
  curr_dir<- getwd()
  my_files<- list.files("specdata")
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  for (i in id) {
    
    new_path<-paste(curr_dir,"/",directory,"/",my_files[i],sep="")
    my_csv<- read.csv(new_path,header=TRUE,sep=",")
    my_data<- my_csv[complete.cases(my_csv),]
    nobs<-nrow(my_data)
    results<-rbind(results,data.frame(id=i,nobs=no\))
   
  }
  # a<-my_data[complete.cases(my_data)]
  
   
  
}
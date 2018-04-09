corr<-function(directory,threshold)
{
  curr_dir<- getwd()
  my_files<- list.files("specdata")
  
  for (i in id) {
    
    new_path<-paste(curr_dir,"/",directory,"/",my_files[i],sep="")
    my_csv<- read.csv(new_path,header=TRUE,sep=",")
    my_data<-data.frame(i,my_csv)
    
  }
  # a<-my_data[complete.cases(my_data)]
   comp_case<- my_csv[complete.cases(my_csv),]
   
   sulp<-comp_case["sulfate"]
   sulp
   
    nitr<-comp_case["nitrate"]
    my_corr<-cor(data.frame(sulp,nitr))
    v_corr<-as.vector(my_corr) 
    corr_length<-length(v_corr)
    i=1
    
    
   
      if (any(threshold<v_corr))
    {
      v_corr
    }
      
      
      
      
      
   
    
  
  
  
  
  
  
}
  
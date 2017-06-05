setwd('/Users/treny/Dropbox/_projects/googleTrends/polling')
files <- list.files()
variables <- c('Trump','Clinton','Other','Undecided',
               'start_date','end_date','observations')
master <- data.frame(NULL)
for(i in 1:length(files)){
  df <- read_delim(files[i],delim='\t')
  df <- df[,variables]
  state <- gsub('_poll_response.tsv','',files[i])
  df$state <- state
  master <- rbind(master,df)
}

write.csv(master,row.names=F,'all_polling_data_by_state.csv')

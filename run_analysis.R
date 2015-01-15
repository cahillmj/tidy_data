library(data.table)
library(dplyr)


#get list of training subjects and test subjects and concatenate them
train_subj <- read.csv('train/subject_train.txt', header = FALSE)[[1]]
test_subj <- read.csv('test/subject_test.txt', header = FALSE)[[1]]
all_subj <- c(train_subj, test_subj)

#get list of training activities and test activities and concatenate them
train_dat <- read.table('train/x_train.txt')
test_dat <- read.table('test/X_test.txt')
all_dat <- rbind(train_dat, test_dat)

#get training data and test data and combine them
train_activity <- read.csv('train/y_train.txt', header = FALSE)
test_activity <- read.csv('test/y_test.txt', header = FALSE)
all_activity <- rbind(train_activity,test_activity)

#combine id list, activity list, and data into one data frame
all_dat <- cbind(all_subj, all_activity, all_dat)

#retrieve variable names and set column names of data frame
variable_names <- read.csv('features.txt', sep = ' ',header = FALSE)[[2]]
names(all_dat) <- c('Subject','Activity',as.character(variable_names))

#get indices of data frame names with 'mean()' or 'std()' and subset columns with these indices
#end up with dataframe containing only mean and std variables
keep_cols <- grep('mean\\(\\)|std\\(\\)', names(all_dat))
all_dat <- all_dat[,c(1:2,keep_cols)]

#substitute activity names for the activity numbers in the dataset
activity_names = c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')
for (i in 1:length(all_dat$Activity)){
  all_dat$Activity <- gsub(i,activity_names[i],all_dat$Activity)
}

#vectors containing patterns to be changed in variable names and replacement values
old_var_name_components <- c('^t','^f','Acc','Gyro','Mag','-mean\\(\\)','-std\\(\\)','-')
new_var_name_components <- c('time','freq','Accel','Gyroscope','Magnitude','Mean','StDev','')

#update variable names with replacement values to increase clarity
for (j in 1:length(old_var_name_components)){
  names(all_dat) <- gsub(old_var_name_components[j],new_var_name_components[j],names(all_dat))
}

#group data by subject and activity and get means of all variables by grouping
summary_dat <- all_dat %>% 
  group_by(Subject,Activity) %>%
  summarise_each(funs(mean))

write.table(summary_dat, 'tidy_UCI_HAR.txt', row.names = FALSE)

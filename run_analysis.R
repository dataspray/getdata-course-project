# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

tblSubject <- bind_rows(read.table("UCI HAR Dataset/train/subject_train.txt",col.names="SubjectId"),
                        read.table("UCI HAR Dataset/test/subject_test.txt",col.names="SubjectId"))

tblActivity <- bind_rows(read.table("UCI HAR Dataset/train/y_train.txt",col.names="ActivityId"),
                         read.table("UCI HAR Dataset/test/y_test.txt",col.names="ActivityId")) %>%
               inner_join(read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("ActivityId","Activity")), by = "ActivityId")
  
dataColNames <- make.names(select(read.table("UCI HAR Dataset/features.txt"), V2)[[1]], unique = TRUE)  # all the names (column V2) in features.txt as a vector
dataColNames <- gsub("_+$", "", gsub("\\.+", "_", dataColNames))                                        # strings of 1 or more periods become 1 underscore ... but none at the end
tblData <- bind_rows(tbl_df(read.table("UCI HAR Dataset/train/X_train.txt",col.names=dataColNames)),
                     tbl_df(read.table("UCI HAR Dataset/test/X_test.txt",col.names=dataColNames)))

tbl <- bind_cols(tblSubject, tblActivity, tblData) %>%                                  # Join columns from all data sets arriving at our "one data set"
       select(SubjectId, Activity, matches("mean|std", ignore.case = TRUE)) %>%
       group_by(SubjectId, Activity) %>% summarise_each(funs(mean))

write.table(tbl, "TidyData.txt", row.name=FALSE)

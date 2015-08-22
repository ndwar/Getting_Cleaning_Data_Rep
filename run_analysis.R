library(reshape2)
trainx<-read.table("train/X_train.txt")
trainy<-read.table("train/Y_train.txt")
testx<-read.table("test/X_test.txt")
testy<-read.table("test/Y_test.txt")

#Combining X train and test into single dataset
xdata<-rbind(trainx, testx)

#Combining Y train and test into single dataset
ydata<-rbind(trainy, testy)

#Reading features data
features<-read.table("features.txt")

#stripping only columns with mean or std in their names
mean_std<-grep("-(mean|std)\\(\\)", features[,2])

#subsetting required columns from X dataset
xdata<-xdata[, mean_std]

#changing the column names
names(xdata)<-features[mean_std,2]

#subsetting required columns from Y dataset
ydata<-ydata[,mean_std]

#translating Y dataset labels to activities
activity<-read.table("activity_labels.txt")
head(activity)
ydata[,1]<-activity[ydata[,1],2]

#changing column name
names(ydata)<-"Activity"

#reading and combining subject data
trainsubject<-read.table("train/subject_train.txt")
testsubject<-read.table("test/subject_test.txt")
subject<-rbind(trainsubject,testsubject)
names(subject)<-"Subject"
head(subject)

#Merging to create final dataset
final<-cbind(xdata, ydata, subject)
str(final)

#Melting and Dcasting to aggregate averages by Subject and Activity
finalmelt<-melt(final, id = c ("Subject", "Activity"))
finalmean<-dcast(finalmelt, Subject + Activity ~ variable, mean)

#Saving the file
write.table(finalmean, "averages_final.txt", row.name = FALSE)







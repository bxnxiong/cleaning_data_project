##task no.1
#assuming our working directroy is right before the test/train file we're further researching later
activity <- read.table('activity_labels.txt')
features <- read.table('features.txt')
#first choose to combine test set because of smaller files
setwd('./test')
test_x <- read.table('X_test.txt')
test_y <- read.table('y_test.txt')
test_subject <- read.table('subject_test.txt')
test <- cbind(test_subject,test_y,test_x)
names(test) <- c('subject','activity',as.character(features[,2]))
#release some memories
rm(test_x,test_y,test_subject)

#head for larger training set
setwd('..')
setwd('./train')
train_x <- read.table('X_train.txt')
train_y <- read.table('y_train.txt')
train_subject <- read.table('subject_train.txt')
train <- cbind(train_subject,train_y,train_x)
names(train) <- c('subject','activity',as.character(features[,2]))
#finally merge train and test datasets together,using rbind() method
data <- rbind(test,train)
rm(train_x,train_y,train_subject,test,train)
##task no.2
#first we need to get col indexes of mean&std features,using grep()
l <- c(1,2,grep('mean|std',names(data)))
filtered <- data[,l]
rm(data,l)
##task no.3
data <- merge(filtered,activity,by.x = 'activity',by.y = 'V1',sort = F)
#since after merging our new activity description is at the very end of the 82 variables,and
#we want to drop the indexing activity variable, we pick up the 82nd and drop our 1st variable
data <- data[,c(2,82,3:81)]
names(data)[2] <- 'activity'
rm(filtered)
#just to check if we missed out the first test subject
table(grepl('^1$',data$subject))
#the result for TRUE is not zero. So yeah,we're on the right track
##task no.4
#seems we've already done that in task no.1
##task no.5
library(dplyr)
by_group <- group_by(data,subject,activity,add = T)
group_mean <- summarise_each(by_group,funs(mean))
rm(by_group)
#group_mean is what we desired
setwd('..')
write.table(group_mean,file = 'tidy_data.txt',row.names = F)
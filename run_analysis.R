
#step(-1): downloading the file

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./Getting_cleaning_data_PA/data.zip")
unzip( "./Getting_cleaning_data_PA/data.zip", exdir="./Getting_cleaning_data_PA")

#step0: reading the multiple files

X_train <-read.table("./Getting_cleaning_data_PA/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./Getting_cleaning_data_PA/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./Getting_cleaning_data_PA/UCI HAR Dataset/train/subject_train.txt")

X_test <-read.table("./Getting_cleaning_data_PA/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./Getting_cleaning_data_PA/UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./Getting_cleaning_data_PA/UCI HAR Dataset/test/subject_test.txt")

activity_labels <- read.table("./Getting_cleaning_data_PA/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./Getting_cleaning_data_PA/UCI HAR Dataset/features.txt")

#step2: combining the files

##attributing column names

colnames(X_train) <- features[,2]  #covers step 4
colnames(Y_train) <-"activityId"
colnames(subject_train) <- "subjectId" 

colnames(X_test) <- features[,2]  #covers step 4
colnames(Y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

##merging train and test data base informations

mrg_train <- cbind(Y_train, subject_train, X_train) #covers step 4
mrg_test <- cbind(Y_test, subject_test, X_test)  #covers step 4

totalData <- rbind(mrg_train, mrg_test)

## merging test and train data bases


#step3: subsetting with variables containing mean or std in their expressions

mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

subData <- totalData[, mean_and_std_features]

#step4: giving descriptive names to variables has been covered in step 2 mostly


#step5: generating an writing a tidy databases of averages

averages_data  <-aggregate(. ~subjectId + activityId, totalData, mean)
write.table(averages_data, "./Getting_cleaning_data_PA/averages.txt", row.name=FALSE)






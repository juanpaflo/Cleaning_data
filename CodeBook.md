# Code Book

## Description
There is data coming from two sets, train and test, and there are some other files that contains related information like the activity performed, the name of the person, among other things.

First the data is formatted with for test and train separately, then both files are merged. This is done first with cbind in order to add the activity type (ID) and the subject information (subject ID) to each file, then with rbind both files train and test are merged.

Secondly, the colum names are extracted, then getting the columns that contains the mean or standard deviation data, merging the data by the activity ID.

Finally, the tidy data is saved in a text file.

## Variables and files

activity_labels.txt
features.txt
X_test.txt
Y_test.txt
subject_test.txt
X_train.txt
Y_train.txt
subject_train.txt


activitylabels
features
test
testlabels
subjecttest
train
trainlabels
subjecttrain
colnames
mergedtest
mergedtrain
testandtrain
allcolumnnames
collumnnamesmeanstd
meanandstd
meanandstdwithlabels
meandata
finalmeandata
 

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `features` and `activity_labels` contains the names for the variables and types of activities in the x_test and x_train sets.

# Manipluation and analysis

* the files are read into R objects.
* The files are combined to introduce the correct names, the subject ID and the activity label to the test and train bases susccessively
* The train and test databases are combined into a total database labeles `totalData`
* A subset of only column names containing the terms mean or std is created.
* A tidy database called `averages_data` of averages is created by aggregating information from the total data base.

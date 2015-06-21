# getting-cleaning-data

### R script *(run_analysis.R)* used to transform raw data into a clean dataset
#### Step no. 1
##### I loaded multiple (txt) raw data files (with the read.table instruction), train and test datasets (which were separated) where *rbinded* (row-binded), finally I *cbinded* (column-binded) the data into one dataframe object called "dataset".
#### Step no. 2
##### I loaded the *features.txt* dataset and then regexed columns for *means* and *stds (standard deviations)* only. This vector (which was a result of two *greps*) was used to subset the main dataset by columns.
#### Step no. 3
##### After loading the "activities labels" dataset, In the main dataset I substitute activities ids with their proper name
#### Step no. 4
##### I normalize the column names with a help of regex. Non-alphabetic chars (e.g. dashes) were removed and all was changed to lowercase.
#### Step no. 5
##### I aggregate the dataset by *subjectid* and *activity* columns,
##### Data is finally exported into *tidy_data.txt*, with the average of each variable for each activity and each subject.

### tidy_data.txt - holds the result tidy dataset

### CodeBook.md - holds the data "codebook"
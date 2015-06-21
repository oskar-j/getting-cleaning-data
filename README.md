# getting-cleaning-data

### R script - used to transform raw data into clean dataset
#### Step 1
##### I load txt raw data with instruction read.table and later rbind the data
#### Step 2
##### I load the "features" dataset and then regex for means and std's only
#### Step 3
##### After loading the "activities labels" dataset, In the main dataset I substitute activities ids with their proper name
#### Step 4
##### I normalize the col names with help of regex
#### Step 5
##### I aggregate the dataset by subjectid and activity
##### Data is finally exported into tidy_data.txt

### tidy_data.txt - holds the result tidy dataset

### CodeBook.md - holds the data "codebook"
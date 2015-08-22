# Getting_Cleaning_Data_Rep
Coursera

Once the datasets have been downloaded and the working directory has been set to the downloaded data - 
The R script "run_analysis.R" executes the following steps

1. Reads the 'train' and 'test' datasets and combines them for X and Y separately
2. Reads the 'features' dataset and strips out all relevant columns
3. Subsets the required columns from the X & Y datasets
4. Renames the column heads based on the "Features" and "Activities" tables
5. Reads the train and test 'subject' files and combines them into a single dataset
6. Merges all the datasets
7. Groups the data set by 'Subject' and 'Activity'
8. Calculates the Column Means for every 'Subject' and 'Activity'
9. Saves the output in a txt file "averages_final.txt"

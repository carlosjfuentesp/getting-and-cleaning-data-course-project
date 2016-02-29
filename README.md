# Getting and cleaning data course project
How to get and clean a sample data set (FUCI HAR data)

Within this repository is an R script (run_analysis.R) that downloads and process the FUCI HAR dataset shared here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analisys.R does:
- Downloads the FUCI HAR data from the course project site
(From the downloaded data, the script:)
- Reads the train and test data sets and merge them in one single data set
- Reads the descriptions of the data set features and target
- Reads the subjects Id that corresponds to each row in the dataset
(And then, the script:)
- Merges into a first data frame the subject ids, selected columns of the train & test data, and the target activity description
- Creates a second data frame with the average of each column of the first data set grouped by activity and subject.
- Exports the first and second data frame into csv files





##Set working directory
setwd("C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset")


directo <- c("C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset/train/Inertial Signals")
##Save the index into a vector
index <- dir(path = directo, pattern = ".txt")
internal_sig_train <- lapply(index, read.table)



##Read the activity labels file
activity_labels <- read.table("activity_labels.txt")

##Read the features file
features <- read.table("features.txt")
features_test <- separate(features, V2, c("variable", "func", "xyz"), sep = "-")
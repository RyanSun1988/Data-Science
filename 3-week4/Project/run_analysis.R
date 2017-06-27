library(readr)
library(dplyr)
library(tidyr)

##Read the activity labels file
##Set working directory
setwd("C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset")
activity_labels <- read.table("activity_labels.txt")

##Read the features file
features <- read.table("features.txt")
features_test <- separate(features, V2, c("variable", "func", "xyz"), sep = "-")

##Read the training dataset
##Reset working directory
setwd("C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset/train")
subject_train <- read.table("subject_train.txt")
names(subject_train) <- c("subject_train")
train_set <- read.table("X_train.txt")
train_label <- read.table("y_train.txt")
names(train_label) <- c("train_label")
train_noname <- cbind(train_label, train_set, subject_train)
train <- train_noname %>% 
        mutate(activity_name = train_label)
for(i in 1:6){
        train$activity_name <- sub(pattern = i, replacement = activity_labels[i, 2], x = train$activity_name)
}
train <- train[, c(1, 564,563, 2:562)]
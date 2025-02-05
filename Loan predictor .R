# Load required libraries
install.packages("caTools")

library(caTools)
library(class)
library(e1071)
install.packages("caret")
library(caret)
library(rpart)
library(rpart.plot)
View(data)
str(data)
summary(data)
# Load the dataset
data <- read.csv(file.choose())

# Apply complete cases method to remove rows with missing values
data_clean <- data[complete.cases(data), ]

# Display the number of rows removed due to missing values
cat("Number of rows removed due to missing values:", nrow(data) - nrow(data_clean), "\n")

# Convert categorical variables to factors
data_clean$person_home_ownership <- as.factor(data_clean$person_home_ownership)
data_clean$loan_intent <- as.factor(data_clean$loan_intent)
data_clean$loan_grade <- as.factor(data_clean$loan_grade)
data_clean$cb_person_default_on_file <- as.factor(data_clean$cb_person_default_on_file)
data_clean$loan_status <- as.factor(data_clean$loan_status)  # Target variable

# Split the data into training and test sets
set.seed(123)
split <- sample.split(data_clean$loan_status, SplitRatio = 0.7)
train_data <- subset(data_clean, split == TRUE)
test_data <- subset(data_clean, split == FALSE)

# KNN Model
# Identify numeric columns for scaling
numeric_columns <- sapply(train_data, is.numeric)

# Scale numeric columns in training and testing datasets
train_knn <- train_data
test_knn <- test_data
train_knn[, numeric_columns] <- scale(train_knn[, numeric_columns])
test_knn[, numeric_columns] <- scale(test_knn[, numeric_columns])

# Convert target variable to numeric for KNN
train_knn$loan_status <- as.numeric(train_knn$loan_status)
test_knn$loan_status <- as.numeric(test_knn$loan_status)

# Apply KNN
k <- 5
knn_pred <- knn(train = train_knn[, numeric_columns], test = test_knn[, numeric_columns],
                cl = train_knn$loan_status, k = k)

# Confusion Matrix and Accuracy for KNN
knn_cm <- table(test_knn$loan_status, knn_pred)
cat("KNN Confusion Matrix:\n")
print(knn_cm)
knn_accuracy <- sum(diag(knn_cm)) / sum(knn_cm)
cat("KNN Accuracy:", knn_accuracy, "\n")


tab1 = knn_cm
error  = 1 -  sum(diag(tab1)) / sum(tab1)
error

precision = tab1[1]/(tab1[1] + tab1[2])
precision
recall = tab1[1]/ (tab1[1]+tab1[3])
recall
f1 = (2 * precision * recall) / (precision + recall)
f1



# Naive Bayes Model
nb_model <- naiveBayes(loan_status ~ ., data = train_data)
nb_pred <- predict(nb_model, test_data)

# Confusion Matrix and Accuracy for Naive Bayes
nb_cm <- table(test_data$loan_status, nb_pred)
cat("Naive Bayes Confusion Matrix:\n")
print(nb_cm)
nb_accuracy <- sum(diag(nb_cm)) / sum(nb_cm)
cat("Naive Bayes Accuracy:", nb_accuracy, "\n")


tab1 = nb_cm
error  = 1 -  sum(diag(tab1)) / sum(tab1)
error
##3
precision = tab1[1]/(tab1[1] + tab1[2])
precision
recall = tab1[1]/ (tab1[1]+tab1[3])
recall
f1 = (2 * precision * recall) / (precision + recall)
f1

# Decision Tree Model
tree_model <- rpart(loan_status ~ ., data = train_data, method = "class")
rpart.plot(tree_model)
tree_pred <- predict(tree_model, test_data, type = "class")

# Confusion Matrix and Accuracy for Decision Tree
tree_cm <- table(test_data$loan_status, tree_pred)
cat("Decision Tree Confusion Matrix:\n")
print(tree_cm)
tree_accuracy <- sum(diag(tree_cm)) / sum(tree_cm)
cat("Decision Tree Accuracy:", tree_accuracy, "\n")

tab1 = tree_cm
error  = 1 -  sum(diag(tab1)) / sum(tab1)
error
####################3
precision = tab1[1]/(tab1[1] + tab1[2])
precision
recall = tab1[1]/ (tab1[1]+tab1[3])
recall
f1 = (2 * precision * recall) / (precision + recall)
f1
################################

# SVM Model
svm_model <- svm(loan_status ~ ., data = train_data, type = 'C-classification', kernel = 'linear')

# Predict using the trained SVM model on the test set
svm_pred <- predict(svm_model, newdata = test_data)

# Confusion Matrix and Accuracy for SVM
svm_cm <- table(test_data$loan_status, svm_pred)
cat("SVM Confusion Matrix:\n")
print(svm_cm)
svm_accuracy <- sum(diag(svm_cm)) / sum(svm_cm)
cat("SVM Accuracy:", svm_accuracy, "\n")

plot(svm_model, train_data, loan_amnt ~ person_income, slice = list(person_home_ownership = 1, loan_grade = 1))

# Plotting the decision boundary for the test set
plot(svm_model, test_data, loan_amnt ~ person_income, slice = list(person_home_ownership = 1, loan_grade = 1))


tab1 = tree_cm
error  = 1 -  sum(diag(tab1)) / sum(tab1)
error

precision = tab1[1]/(tab1[1] + tab1[2])
precision
recall = tab1[1]/ (tab1[1]+tab1[3])
recall
f1 = (2 * precision * recall) / (precision + recall)
f1


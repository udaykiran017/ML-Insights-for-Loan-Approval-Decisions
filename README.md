

# 📊 **Loan Status Prediction using Machine Learning in R** 🚀  

This project predicts whether a loan application will be **approved or rejected** using various **machine learning models**. The dataset contains applicant details, financial status, and loan-related attributes.  

## 📂 **Technologies Used**  
- **R**: Programming Language  
- **Libraries**:  
  - `caTools`: Data partitioning  
  - `caret`: ML utilities  
  - `e1071`: SVM implementation  
  - `rpart & rpart.plot`: Decision Trees  
  - `class`: K-Nearest Neighbors (KNN)  

## 🔍 **Features**  
1. **Data Preprocessing**:  
   - Handling missing values  
   - Converting categorical variables to factors  
   - Data normalization for numeric features  
2. **Model Implementation**:  
   - **K-Nearest Neighbors (KNN)**  
   - **Naive Bayes**  
   - **Decision Tree**  
   - **Support Vector Machine (SVM)**  
3. **Evaluation Metrics**:  
   - **Accuracy**  
   - **Error Rate**  
   - **Precision, Recall, F1-Score**  
4. **Visualization**:  
   - **Decision Tree Plot**  
   - **SVM Decision Boundary Plot**  

## 🚀 **Project Workflow**  
1. **Load and Clean Data**:  
   - Reads a CSV file using `file.choose()`  
   - Removes rows with missing values  
   - Converts categorical variables into factors  

2. **Data Splitting**:  
   - **70% Training Set**  
   - **30% Test Set**  

3. **Machine Learning Models**:  
   - **KNN**: Distance-based classification  
   - **Naive Bayes**: Probabilistic classifier  
   - **Decision Tree**: Rule-based classification  
   - **SVM**: Separating hyperplane for classification  

4. **Performance Evaluation**:  
   - **Confusion Matrix**  
   - **Accuracy Calculation**  
   - **Precision, Recall, and F1 Score Calculation**  

## 📈 **Model Performance Comparison**  

| Model | Accuracy | Error Rate | Precision | Recall | F1-Score |  
|--------|---------|-----------|-----------|--------|----------|  
| **KNN** | _X%_ | _X%_ | _X%_ | _X%_ | _X%_ |  
| **Naive Bayes** | _X%_ | _X%_ | _X%_ | _X%_ | _X%_ |  
| **Decision Tree** | _X%_ | _X%_ | _X%_ | _X%_ | _X%_ |  
| **SVM** | _X%_ | _X%_ | _X%_ | _X%_ | _X%_ |  

(_Replace "X%" with actual results after running the script._)  

## 🔨 **How to Run the Project**  

1. **Install required libraries** (if not installed):  
   ```r
   install.packages(c("caTools", "caret", "e1071", "rpart", "rpart.plot", "class"))
   ```
2. **Run the script in RStudio**.  
3. **Select a CSV file** when prompted.  
4. **View performance metrics** in the console.  
5. **Check decision tree and SVM plots** for visualization.  


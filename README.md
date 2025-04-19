# Structured Data Preprocessing Using SQL for Machine Learning

This project demonstrates how SQL can be used to preprocess structured data before applying machine learning models. It combines SQL-based data transformation with Python-based model training, making it easy to handle real-world datasets stored in relational databases.


## Dataset

- Name: Heart Disease Dataset  
- Source: [Kaggle](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction)  
- Format: CSV  
- Fields: Age, Sex, ChestPainType, RestingBP, Cholesterol, FastingBS, MaxHR, Oldpeak, ExerciseAngina, and HeartDisease

## Tools Used

| Tool | Purpose |
|------|---------|
| MySQL | Data cleaning, encoding, and transformation |
| Python | Model training and evaluation |
| Pandas | Data manipulation |
| Scikit-learn | ML model: Logistic Regression |
| Google Colab | Development environment |


## SQL Preprocessing Steps

1. Null Handling – Removed rows with missing values
2. Age Grouping – Binned Age into Young, Middle-aged, and Senior
3. Categorical Encoding – Converted string labels into numeric form:
    - Sex → `SexEncoded`
    - ChestPainType → `ChestPainEncoded`
    - ExerciseAngina → `ExerciseAnginaEncoded`
4. Exported the preprocessed data from MySQL to a CSV

 All SQL queries are in [`sql_queries.sql`]

##  Machine Learning Model

- Model Used: Logistic Regression
- Training Split: 80% training, 20% testing
- Target Variable: `Heart_Disease`
- Features Used: Numeric columns after preprocessing

## Results

| Metric        | Value |
|---------------|-------|
| Accuracy      | 0.79  |
| Precision     | 0.80  |
| Recall        | 0.79  |
| F1 Score      | 0.79  |


## Learnings

- How to use SQL for structured data preprocessing
- Importance of data encoding and cleaning
- Basic model training and evaluation in scikit-learn


## How to Run

1. Import `final_data.csv` into your project
2. Run the Colab: `heart_disease_model.ipynb`
3. OR run the Python script:
    ```bash
    pip install -r requirements.txt
    python heart_disease_model.py
    ```

##  Project Structure

Structured-SQL-ML-Preprocessing/
│
├── final_data.csv                   ← Preprocessed dataset
├── heart_disease_model.ipynb        ← Jupyter notebook (or .py script)
├── sql_queries.sql                  ← Optional: your SQL queries
├── README.md                        ← Full project description
└── requirements.txt                 ← (Optional) packages used


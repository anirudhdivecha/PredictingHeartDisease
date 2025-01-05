# Heart Disease Prediction Project

This repository contains the final project for predicting heart disease using machine learning models. The project focuses on analyzing patient data, identifying significant predictors, and building interpretable models.

---

## Table of Contents
1. [Project Overview](#project-overview)
2. [Dataset Information](#dataset-information)
3. [Key Features](#key-features)
4. [Technologies Used](#technologies-used)
5. [Usage](#usage)
6. [Results](#results)
7. [Future Improvements](#future-improvements)

---

## Project Overview

This project applies statistical and machine learning methods to predict heart disease presence in patients based on clinical features. Key objectives include:
- Evaluating differences in predictor variables between men and women.
- Building and comparing logistic regression and k-Nearest Neighbors (kNN) models.
- Identifying key predictors and discussing their implications for long-term prevention strategies.

---

## Dataset Information

The dataset contains clinical records of 300 patients, including features like cholesterol, blood pressure, and chest pain type. Target variable `num` indicates heart disease presence. 

### Data Preprocessing:
- Utilized Python pandas for data cleaning.
- Removed irrelevant or overly medical variables.
- Converted categorical variables to numeric codes.
- Transformed the `num` attribute into a binary classification target.

---

## Key Features

- **Exploratory Data Analysis (EDA):** KDE graphs to compare men and women on continuous predictors.
- **Model Building:** Logistic regression and kNN models implemented.

---

## Technologies Used

- **Programming Languages:** R, Markdown, C, Python (pandas)
- **Visualization Tools:** ggplot2, base R plotting
- **Statistical Models:** Logistic Regression, k-Nearest Neighbors (kNN)

---

## Usage

### Clone Repository:
```bash
git clone https://github.com/anirudhdivecha/heart-disease-prediction.git
```

### Run Analysis:
1. Open the `stats202_final_project.R` file in RStudio.
2. Make sure `hw3.c` and `cleaned_heart.csv` file is located in same directory as `stats202_final_project.R` file.
3. Run R file for graphs and analysis.

---

## Results

- Logistic regression achieved **higher accuracy** than kNN.
- Key predictors identified are largely out of patient control, emphasizing the need for prevention strategies focused on modifiable factors.

---

## Future Improvements

1. Include more patient records to enhance model generalizability.
2. Incorporate domain expertise to retain meaningful predictors.
3. Experiment with advanced models like Random Forests for better performance.

---

### Author
Anirudh Divecha  
Graduate Student, University of California, Los Angeles (UCLA)  
Email: anirudhdivecha@gmail.com

---

Feel free to explore the code and contribute!


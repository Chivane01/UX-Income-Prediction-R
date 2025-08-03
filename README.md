# 🎯 UX Funnel & Income Prediction using R

This project simulates user behavior across a digital product funnel and applies statistical analysis and machine learning to predict income categories. It is designed to demonstrate real-world skills in data wrangling, EDA, hypothesis testing, and modeling — aligned with UX and funnel analytics roles.

---

## 📘 Project Objectives

- Analyze user age, education, and behavioral patterns
- Simulate funnel stages (Landing → Purchase) and evaluate drop-offs
- Predict income class (>50K vs <=50K) using logistic regression
- Visualize user patterns and relationships using R

---

## 🛠️ Tools & Technologies

- **R v4.4.1**
- `dplyr`, `ggplot2`, `pROC`, `corrplot`
- Synthetic dataset (generated using base R)
- Plots and models created entirely in R

---

## 🧪 Key Analyses Performed

### 🔍 Exploratory Data Analysis (EDA)
- Distribution of Age, Education, and Hours Worked
- Categorical breakdown: Work Class, Marital Status, Gender
- Funnel stage simulation and visualization
- Correlation analysis of numeric features

### 📊 Hypothesis Testing
- 1-sample t-tests on Age and Hours
- 2-sample t-tests by income and gender
- ANOVA on Age & Capital Gain across categorical groups

### 🔢 Logistic Regression
- Predicting income using: Age, Education-num, Hours-per-week, Capital Gain
- ROC Curve and AUC for model evaluation

---

## 📈 Sample Visualizations

📌 Note: Add these using `ggsave()` in R. Save plots as `.png` and drag them into your GitHub repo folder.

- `age_distribution.png`
- `funnel_stages.png`
- `income_vs_education.png`
- `correlation_matrix.png`
- `roc_curve.png`

You can use this code to save them:

```r
ggsave("age_distribution.png", width = 6, height = 4)

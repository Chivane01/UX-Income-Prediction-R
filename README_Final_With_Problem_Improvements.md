# 🎯 UX Funnel & Income Prediction using R

This project simulates user behavior across a digital product funnel and applies statistical analysis and logistic regression to predict income categories. It demonstrates core data skills including exploratory data analysis, hypothesis testing, visualization, and modeling — tailored for UX and product analytics roles.

---

## 📘 Project Objectives

- Analyze user age, education, and behavioral patterns
- Simulate funnel stages (Landing → Purchase) and evaluate drop-offs
- Predict income class (>50K vs <=50K) using logistic regression
- Visualize user behavior and deliver product-facing insights

---

## 🛠️ Tools & Technologies

- **R v4.4.1**
- `dplyr`, `ggplot2`, `corrplot`, `pROC`
- Synthetic dataset (generated within R)
- Visual outputs saved using `ggsave()`

---

## 📊 Key Analyses

### 🔍 Exploratory Data Analysis (EDA)
- Distribution analysis for `Age`, `Education_num`, `hours_per_week`
- Funnel stage behavior visualized across 5 key journey points
- Income distribution across demographic and behavioral features
- Correlation analysis across numeric predictors

### 📈 Hypothesis Testing
- 1-sample t-tests (Age vs 40, Hours-per-week vs 35)
- 2-sample t-tests (Hours by income, Education by gender)
- ANOVA tests (Age vs Work Class, Capital Gain vs Marital Status)

### 🔢 Logistic Regression
- Target: `income_binary` (1 = >50K, 0 = <=50K)
- Features: Age, Education_num, Hours-per-week, Capital Gain
- ROC Curve & AUC to evaluate predictive power

---

## 🖼️ Sample Visualizations

These are stored in the `Visuals/` folder:

- `age_distribution.png`
- `funnel_stages.png`
- `roc_curve.png`
- `correlation_matrix.png`

---

## 📁 Dataset

- Simulated dataset: [`simulated_ux_income_dataset.csv`](data/simulated_ux_income_dataset.csv)
- Created using `data.frame()` and standard distributions
- No external dependencies — reproducible from R code

---

## 📌 Final Outcomes & Takeaways

| Metric                | Finding                                              |
|-----------------------|-------------------------------------------------------|
| Age distribution      | Majority of users are 25–45 years old                |
| Education & income    | Education_num > 10 is strongly linked to >50K income |
| Capital gain & income | >300 capital gain is a strong predictor              |
| Model performance     | Logistic regression AUC = 0.979                      |
| Funnel drop-offs      | Highest at 'Browse' and 'AddToCart' stages           |

### 🔍 Additional Insights

- Gender differences in education level were not statistically significant
- Work class had minimal influence on age or income in ANOVA
- Most users earn <=50K, indicating class imbalance — important for modeling

---

## 🧭 Improvement Opportunities (Problem-Side)

- Reduce mid-funnel drop-offs (especially at 'Browse' and 'AddToCart') through clearer UI, trust signals, and faster load times
- Optimize content on product detail pages to better engage users transitioning from 'Signup'
- Personalize user experience based on age and education-level segments to guide higher-propensity users
- Introduce behavioral nudges like limited-time offers or social proof to influence conversion at 'AddToCart'
- Implement real-time income prediction to dynamically adjust recommendations or offers

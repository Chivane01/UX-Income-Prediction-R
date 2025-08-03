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

### 🔍 Key Findings:
- The majority of users are aged **25–45** — prime product engagement group.
- Users with **education_num > 10** and **capital_gain > 300** are strongly associated with income >50K.
- **Logistic regression AUC = 0.979**, indicating very strong predictive performance.
- **Funnel stage drop-off** is highest at **Browse** and **AddToCart** — clear UX friction points.

### 🎯 Actionable Recommendations:
- Prioritize **UX design improvements** at mid-funnel to reduce drop-off.
- Target **high-probability segments** (age 35+, highly educated) for conversion optimization.
- Extend analysis with real behavioral logs or A/B test data when available.

---

## 🧠 What This Project Demonstrates

✅ Strong command of R for statistical and behavioral analysis  
✅ UX funnel mindset with actionable business insight  
✅ Structured, well-documented code and visual reporting  
✅ Fully reproducible dataset and outputs

---

## 📎 Repository Structure

```
UX-Income-Prediction-R/
├── UX_Funnel_Income_Analysis.R
├── README.md
├── .gitignore
├── data/
│   └── simulated_ux_income_dataset.csv
├── Visuals/
│   ├── age_distribution.png
│   ├── funnel_stages.png
│   ├── roc_curve.png
```

---

## 🏁 Next Steps

- Extend with time-series engagement data or real product logs
- Port analysis to Tableau or Power BI for dashboarding
- Apply logistic regression to conversion-based outcomes

---

## 🧷 Author

**Aanchal B**  
[GitHub Profile](https://github.com/Chivane01)

---

## 📜 License

MIT License (add if needed)

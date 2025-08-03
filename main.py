# main.py
# UX Funnel & Income Prediction (Python Version)
# This script simulates user data and performs EDA and logistic regression analysis

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import roc_auc_score, roc_curve
from sklearn.model_selection import train_test_split

# -----------------------------
# 1. Simulate Dataset
# -----------------------------
np.random.seed(123)
n = 1000

data = pd.DataFrame({
    'user_id': range(1, n + 1),
    'Age': np.random.randint(18, 66, size=n),
    'Education_num': np.random.randint(1, 17, size=n),
    'hours_per_week': np.round(np.random.normal(40, 10, n), 1),
    'capital_gain': np.random.poisson(500, size=n),
    'WorkClass': np.random.choice(['Private', 'Self-emp', 'Govt', 'Unemployed'], size=n),
    'marital_status': np.random.choice(['Never-married', 'Married', 'Divorced', 'Widowed'], size=n),
    'sex': np.random.choice(['Male', 'Female'], size=n),
    'stage': np.random.choice(['Landing', 'Signup', 'Browse', 'AddToCart', 'Purchase'], size=n, 
                              p=[0.25, 0.25, 0.2, 0.15, 0.15])
})

data['income_binary'] = np.where((data['Age'] > 35) & (data['Education_num'] > 10) & 
                                 (data['capital_gain'] > 300), 1, 0)
data['IncomeLabel'] = data['income_binary'].map({1: '>50K', 0: '<=50K'})

# -----------------------------
# 2. Exploratory Data Analysis
# -----------------------------
# Age Distribution
sns.histplot(data['Age'], bins=10, kde=False)
plt.title('Age Distribution')
plt.xlabel('Age')
plt.ylabel('Count')
plt.savefig('age_distribution_py.png')
plt.close()

# Education vs Hours by Income
sns.scatterplot(data=data, x='Education_num', y='hours_per_week', hue='IncomeLabel')
plt.title('Education vs Work Hours by Income')
plt.savefig('education_hours_income_py.png')
plt.close()

# -----------------------------
# 3. Logistic Regression Model
# -----------------------------
X = data[['Age', 'Education_num', 'hours_per_week', 'capital_gain']]
y = data['income_binary']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

model = LogisticRegression()
model.fit(X_train, y_train)
pred_probs = model.predict_proba(X_test)[:, 1]

auc_score = roc_auc_score(y_test, pred_probs)
print(f'AUC Score: {auc_score:.3f}')

# ROC Curve
fpr, tpr, _ = roc_curve(y_test, pred_probs)
plt.plot(fpr, tpr, label=f'AUC = {auc_score:.2f}')
plt.plot([0, 1], [0, 1], 'k--')
plt.title('ROC Curve')
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.legend()
plt.savefig('roc_curve_py.png')
plt.close()

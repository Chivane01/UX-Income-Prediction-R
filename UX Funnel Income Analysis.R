# Load necessary libraries
library(dplyr)
library(ggplot2)
library(caret)

# Load the dataset
data <- read_xlsx("Downloads/adult.xlsx")  # Replace with your file path

# 1. Exploratory Data Analysis
## a) Summary Statistics
summary(data)

## b) Distribution of age
ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Age Distribution", x = "Age", y = "Frequency")

## c) Count of individuals by income category
table(data$`>50K, <=50K.`)

## d) Relationship between education-num and hours-per-week
ggplot(data, aes(x = `Education-num`, y = `hours-per-week`, color = `>50K, <=50K.`)) +
  geom_point() +
  labs(title = "Education Level vs Hours-per-week", x = "Education Level", y = "Hours per Week")
## e) Check for Missing Values
colSums(is.na(data)) # Check for NA values in each column
## f) Categorical Variable Analysis
# Let's examine some categorical variables like WorkClass, Education, and marital-status

table(data$WorkClass)        # Frequency of each WorkClass category
table(data$Education)        # Frequency of each Education level
table(data$`marital-status`) # Frequency of each marital status category
## g). Numerical Variable Analysis
# Histograms for numerical variables like Age, Education-num, hours-per-week, etc.

ggplot(data, aes(x = Age)) + 
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") + 
  ggtitle("Age Distribution") +
  theme_minimal()

ggplot(data, aes(x = `Education-num`)) + 
  geom_histogram(binwidth = 1, fill = "coral", color = "black") + 
  ggtitle("Education-num Distribution") +
  theme_minimal()

ggplot(data, aes(x = `hours-per-week`)) + 
  geom_histogram(binwidth = 5, fill = "lightgreen", color = "black") + 
  ggtitle("Hours-per-week Distribution") +
  theme_minimal()
## h) Relationships Between Variables
# Scatter plot between Age and hours-per-week to explore relationships

ggplot(data, aes(x = Age, y = `hours-per-week`)) + 
  geom_point(alpha = 0.3) + 
  ggtitle("Age vs Hours-per-week") +
  theme_minimal()

# Box plot for Income_numeric (assuming the conversion has been done as shown earlier)
data$Income_numeric <- ifelse(data$`>50K, <=50K.` == ">50K", 1, 0)

ggplot(data, aes(x = as.factor(Income_numeric), y = Age)) + 
  geom_boxplot(fill = "lightblue") +
  ggtitle("Income Level vs Age") +
  xlab("Income Level (0 = <=50K, 1 = >50K)") +
  theme_minimal()
## i) Correlation Analysis
# Select only numeric columns for correlation analysis

numeric_data <- data %>% select(where(is.numeric))
cor_matrix <- cor(numeric_data, use = "complete.obs")

# Visualize the correlation matrix
corrplot(cor_matrix, method = "circle", type = "upper", tl.cex = 0.8, number.cex = 0.7)

# Additional EDA can be done depending on findings in initial steps

# 2. 1-sample Hypothesis Testing
## a) Test if the mean age is significantly different from 40
t.test(data$Age, mu = 40)

## b) Test if the mean hours-per-week is significantly different from 35
t.test(data$`hours-per-week`, mu = 35)

# 3. 2-sample Hypothesis Testing
## a) Test if mean hours-per-week differ by income category
t.test(`hours-per-week` ~ `>50K, <=50K.`, data = data)

## b) Test if education-num differs by gender
t.test(`Education-num` ~ sex, data = data)

# 4. 3-sample Hypothesis Testing
## a) ANOVA test for capital-gain across marital statuses
anova_result <- aov(`capital-gain` ~ `marital-status`, data = data)
summary(anova_result)

## b) ANOVA test for age across work classes
anova_result2 <- aov(Age ~ WorkClass, data = data)
summary(anova_result2)

# 5. Regression Analysis
## a) Simple Regression: Predict capital-gain using education-num
simple_regression <- lm(`capital-gain` ~ `Education-num`, data = data)
summary(simple_regression)

## b) Multiple Regression: Predict income (binary: >50K) using Age, Education-num, hours-per-week, and capital-gain
# Convert income to a binary variable
data$income_binary <- ifelse(data$`>50K, <=50K.` == ">50K", 1, 0)

multiple_regression <- glm(income_binary ~ Age + `Education-num` + `hours-per-week` + `capital-gain`,
                           data = data, family = "binomial")
summary(multiple_regression)

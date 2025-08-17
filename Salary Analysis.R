df <- read.csv("C:/Users/tcaal/Desktop/Consulting/FINAL/Salary_Table.csv")
#-----------------------------------------------------------------------
#Required packages
library(glmnet)
library(ggplot2)
library(nortest)
#-----------------------------------------------------------------------
#General description of data frame
head(df)
dim(df)
str(df[,-3])
#-----------------------------------------------------------------------
#Converting categorical variables from characters to factors
df$Gender <- as.factor(df$Gender)
df$Education.Level <- as.factor(df$Education.Level)
df$Job.Title <- as.factor(df$Job.Title)
df$Country <- as.factor(df$Country)
df$Race <- as.factor(df$Race)
df$Senior <- as.factor(df$Senior)
#-----------------------------------------------------------------------
#Multiple linear regression model
ylm <- lm(Salary ~ Age + Years.of.Experience, df)
#variance influence factor 
vif <- car::vif(ylm)
vif
#Anderson-Darling test
ad.test(df$Age)
ad.test(df$Years.of.Experience)
#Spearman rank
cor(df$Age, df$Years.of.Experience, method = "spearman")
#scatterplot for relationship between age and years of experience
df |>
  ggplot(aes(x = Age, y = Years.of.Experience)) +
  geom_point(colour = 'blue') +
  ggtitle("Age to Years of Experience: Salary Data Set")
#-----------------------------------------------------------------------
#Splitting data set
df2 <- as.data.frame(cbind(df$Salary, df$Age, df$Years.of.Experience))
colnames(df2) <- c("Salary", "Age", "Years.of.Experience")

sample <- sample(c(TRUE, FALSE), nrow(df2), replace=TRUE, prob=c(0.7,0.3))
train  <- df2[sample, ]
test   <- df2[!sample, ]

y <- train$Salary
x <- data.matrix(train[,c('Age', 'Years.of.Experience')])
x
y

#Ridge regression model development
cv_model <- cv.glmnet(x,y, alpha = 0)
best_lambda <- cv_model$lambda.min
best_lambda
plot(cv_model)
#applying optimal lambda
best_model <- glmnet(x, y, alpha = 0, lambda = best_lambda)
coef(best_model)

#Using improved model to predict data
y_predicted <- predict(best_model, s = best_lambda, newx = x)

#find SST and SSE
sst <- sum((y - mean(y))^2)
sse <- sum((y_predicted - y)^2)

#find R-Squared
rsq <- 1 - sse/sst
rsq

#Applying test data set to trained model

y2 <- test$Salary
x2 <- data.matrix(test[,c('Age', 'Years.of.Experience')])

y_predicted <- predict(best_model, s = best_lambda, newx = x2)

sst <- sum((y2 - mean(y2))^2)
sse <- sum((y_predicted - y2)^2)

rsq <- 1 - sse/sst
rsq

model <- glmnet(x, y, alpha = 0)
summary(model)
plot(model, xvar = "lambda")

#----------------------------------------------------------------------
#Boxplot to visualize education and race
df |>
  ggplot(aes(x = Education.Level, y = Salary, fill = Education.Level)) +
  geom_boxplot()

df |>
  ggplot(aes(x = Race, y = Salary, fill = Race)) +
  geom_boxplot()
#ANOVA model
ylm_Race <- lm(Salary ~ Race, df)
summary(ylm_Race)
#Q-Q plot for race and Anderson-Darling test
qqnorm(ylm_Race$residuals)
qqline(ylm_Race$residuals)
ad.test(ylm_Race$residuals)
plot(ylm_Race, which = 1)
#Boxplot for country
df |>
  ggplot(aes(x = Country, y = Salary, fill = Country)) +
  geom_boxplot()
#ANOVA model, Q-Q plot, and Anderson-Darling
ylm_Country <- lm(Salary ~ Country, df)
summary(ylm_Country)
qqnorm(ylm_Country$residuals)
qqline(ylm_Country$residuals)
ad.test(ylm_Country$residuals)
plot(ylm_Country, which = 1)
#-----------------------------------------------------------------------
#Kruskal-Wallis tests for education, race, and country

kruskal.test(Salary ~ Education.Level, df)
kruskal.test(Salary ~ Race, df)
kruskal.test(Salary ~ Country, df)

#Histogram for gender followed by Mann Whitney U test and two sample t test
df |>
  ggplot() +
  geom_histogram(aes(x = Salary, fill = Gender)) +
  facet_wrap(~Gender)

M <- df |> filter(Gender == "Male")
F <- df |> filter(Gender == "Female")
wilcox.test(M$Salary, F$Salary, paired = FALSE)


#Histogram for senior variable followed by Mann Whitney U test and t test

df |>
  ggplot() +
  geom_histogram(aes(x = Salary, fill = Senior)) +
  facet_wrap(~Senior)

Syes <- df |> filter(Senior == 1)
Sno <- df |> filter(Senior == 0)
wilcox.test(Syes$Salary, Sno$Salary, paired = FALSE)
#-----------------------------------------------------------------------

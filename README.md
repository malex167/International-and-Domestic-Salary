# Executive Summary

  The results from the statistical analysis on salary earnings, conducted via R Studio, Excel, and Power BI, for individuals across various countries concluded that age and years of experience moderately served to predict salary via a ridge regression model. Additionally, education, gender, and senior position holding proved statistically significant when predicting salary and differentiating between groups while race and country did not. Future work would aid in deducing how groups differ from one and other and could also be utilized in investigating an alternatively superior model to the presented ridge regression.

## Problem

  Through a robust analysis of annual salary and contributing variables, a refined understanding of key attributes associated with higher economic earnings can be studied. While there are limitations to the influence an individual can have over specific variables, control over things like education and career field can serve to further an individual’s annual salary. The aim of the following analysis targets determining the influence controllable, and intrinsic, characteristics have towards making educated decisions while pursuing economic growth. The primary objectives will be to address various questions, such as: what are the largest achievable factors that an individual can do for economic mobility, are there contributing factors that potentially influence salary but are marginal in their effects and how influential are uncontrollable factors? From a sense of reflection, applying said analysis towards annual salary serves to provide myself and others with a proactive approach in potential life decisions and mitigate unnecessary choices that might not be beneficial nor provide personal gain.

## Methodology

  Statistical analysis was conducted within the R Studio environment in various applications towards cleaning the data, performing testing, and producing figures for visualization while Excel and Power BI aided in producing tables and dashboards. A multitude of visual and statistical applications were utilized including pie charts, histograms, and boxplots to easily visualize simple trends and relationships between variables. Anderson-Darling tests and Q-Q plots served as 2 supporting methods to determine if data was normally distributed which is a requirement for some statistical tests.
  To analyze the relationship between salary and other variables, various regression models were assessed. Due to strong theoretical support, the continuous variables age and years of experience were tested for multicollinearity; an assessment that would indicate that these independent variables being used to predict salary are dependent on one and other. This was done through a Spearman correlation and variance inflation factor (VIF) to determine how strongly they were related. This was followed by a ridge regression model using age and years of experience to predict salary.
  To address the remaining data types, these categorical variables were approached using an Analysis of Variance (ANOVA) test which assesses if there is a statistically significant difference between groups. ANOVA requires certain assumptions, as elaborated below, and for those that fail these assumptions alternative testing is required. In these cases, Kruskal-Wallis tests were utilized as a non-parametric alternative to perform similar testing to ANOVA, and that of comparing groups, without violating underlying requirements of the testing. For the dichotomous variables gender and senior, a test for normality assessed whether a t-test or a Mann-Whitney U test was utilized in which both methods determine statistical differences between groups although differ in underlying assumptions and requirements of the data being assessed.

## Skills

1. R Studio
2. Microsoft Excel
3. Power BI
4. Ridge Regression
5. Analysis of Variance (ANOVA)
7. Machine Learning
8. Exploratory Data Analysis (EDA)
9. Data Visualization/Dashboards
10. Hypothesis Testing
11. Non-Parametric Testing

## Results and Recommendations

  From an analysis of the annual salary based on the position held, Figure 1 below demonstrates the top 10 of the 128 job titles presented for earnings via a dashboard produced in Power BI. While an analysis on job position earnings can pose as a daunting challenge, general observations can be observed to understand potential characteristics that contribute to higher earning positions. For instance all 10 of the positions hold the key words chief, director, or VP. This is indictive of upper management positions carrying greater earning potential.

<img width="1180" height="660" alt="image" src="https://github.com/user-attachments/assets/80825779-0606-4985-ac0a-62b7ad3b34f5" />

**Figure 1: Dashboard displaying average salary by position with a filter changing whether the job is a senior position or not along with a pie chart for the percentage by gender.**

  Additional work conducted in analyzing general associations between annual salary, education level, and country yields visual aids presented in Figure 2 below in which average earnings between countries appears fairly consistent although higher education level appears to definitively provide greater annual earnings.

<img width="1181" height="658" alt="image" src="https://github.com/user-attachments/assets/7671b854-b888-48d3-9f28-f44ae919c4d5" />


**Figure 2: Dashboard displaying average salary by education level along with average salary by country with a map and filter option.**

  To assess the potential of multicollinearity, first, Anderson-Darling tests were applied to both the age and years of experience variables. These yielded p-values less than 2.2e-16 rejecting the null hypothesis concluding non normal data. Accordingly, the Spearman rank correlation was applied between said variables resulting in a correlation of 0.9460367 serving as a potential indicator of multicollinearity. This was also confirmed through a variance inflation factor (VIF) of 8.272077, which is likely to carry high inflation for the standard error and unreliable coefficients.
  From the supporting evidence surrounding multicollinearity, a subset of the data frame was utilized through a matrix of salary, age, and years of experience. The subset of data was divided using a 70:30 split with 70% corresponding to a training set and 30% for a testing set. A ridge regression model was fitted to the training data set; optimized and then assessed through the R-squared value which was determined for the training data set to be 0.6464358. The optimized model was able to explain 64.64% of variation in the training data. From the test data, the corresponding R-squared value is 0.6497574 indicating the optimized model was able to explain 64.98% of variation in the test data. Accordingly, the model was moderately able to predict salary from age and years of experience through an approach that mitigated the influence of multicollinearity, the model was highly consistent in R-squared values between training and testing data sets too.
  Analyzing the relation between various categorical variables with respect to predicting salary demonstrated that education level had unequal variance between groups and a Kruskal-Wallis test to support a statistically significant difference in central tendency between education levels. A post-hoc analysis could utilize Dunn’s test to more aptly investigate differences in groups. For both race and country, boxplots visually displayed approximately equal variances followed by ANOVA models demonstrating no statistical contribution; neither race nor country predicted salary from their respective coefficients along with no statistically significant difference in the means of race and countries via the global F-statistic. While assessing the assumption of normality, both models failed Anderson-Darling tests and visually didn’t fit well for Q-Q plots. From these findings, Kruskal-Wallis tests were utilized although these findings aligned with the ANOVA models’ predictions towards no statistical difference between groups. An example of preliminary analysis towards assessing variance via box plots is shown in Figure 3 below along with post analysis concerning normality within residuals shown in Figure 4's Q-Q plot.

<img width="1299" height="657" alt="image" src="https://github.com/user-attachments/assets/82f783cc-eab3-4fe3-ba2e-cfc52420571a" />

**Figure 3: Boxplot demonstrating the relationship between salary and race.**

<img width="894" height="763" alt="image" src="https://github.com/user-attachments/assets/657628dd-d38b-4713-8f29-a0b33f852d12" />

**Figure 4: Q-Q Plot for theoretical and experimental quantiles from one-way ANOVA between race and salary.**

  For the dichotomous variables gender and senior, the resulting histograms, as shown in Figure 5 below, demonstrated non normally distributed data. Accordingly, Mann Whitney U tests were applied to assess differences in groups. For both gender and senior, there was a statistically significant difference in salary earnings. 

<img width="896" height="758" alt="image" src="https://github.com/user-attachments/assets/aa9fc8f8-adac-441f-a306-929a61af3ce9" />

**Figure 5: Histogram example of salary by gender.**

  From the analysis conducted, the ridge regression model served to moderately predict salary via age and years of experience, education level, gender, and senior position holding proved to hold a statistically significant difference from one and other while country and race did not. Additionally, leadership and higher end corporate positions yielded higher annual servings. From these findings, greater education, with a persuit in senior positions along with leadership and managerial roles are the strongest controllable factors when attempting to pursue economic growth.

## Next Steps

  Overall, a lack of normality was present throughout a multitude of variables within the data set. While certain tests are robust in producing accurate results despite violations, stronger practice is observed in ensuring assumptions are held. Accordingly, limitations occurred likely in sampling practices not mentioned from the data set. A stronger approach, and a greater representation and investigation for future work, would be to utilize the principles of the Central Limit Theorem (CLT) averaging a multitude of samples and modeling the distribution of means to produce normally distributed data that could be applied to parametric testing methodologies such as ANOVA and t-tests. With respect to the scope of the analysis, the ridge regression model moderately serves to predict salary depending on an individual’s age and years of service in a position. Future work could serve to refine the model with additional training on more data or developing alternative models for mitigating multicollinearity. When isolating categorical variables, both race and country held no significance towards predicting salary. For education level, gender, and senior positions, there was evidence to support this influencing salary. Based on this analysis, and the scope of the data, gender will be associated with an intrinsic variable that cannot be pursued to develop one’s salary. Alternatively, a senior position is a tangible objective an individual can pursue towards gaining a higher salary. Future work would likely benefit from a further investigation between years of service and a senior position as well along with an investigation into how variables may interact with one and other. Finally, education level provided strong statistical evidence to support higher education correlating to greater earning potential. From an application perspective, this aligned with a primary objective of the research and demonstrated that the variable “education level” influenced annual salary and serves as a potential goal one might consider when looking for economic growth. To the extent of addressing variables with marginal effects on salary, all statistical testing (within the scope of the data set) concluded somewhat equal statistical contribution for all categories deemed significant concluding that country and race were not an influence factor, but education, senior position, and gender were influential factors. Expanding on these variables through future work would aid in better understanding more complex intricacies surrounding their influence and serve to reinforce any relations.

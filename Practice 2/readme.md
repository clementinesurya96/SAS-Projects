# Practice 2 - Create and Manipulate Numeric Variables

## Introduction:
This SAS programming practice focuses on utilizing the HEART dataset from the SASHELP library to perform various tasks. 

## Task:

a. Viewing the Contents of the HEART Dataset:

Write a PROC step to view the contents of the HEART dataset. 
Ensure the variables are sorted in the order in which they appear in the table. 

b. Viewing the First 10 Rows of Specific Variables:

Write a SAS step to view the first 10 rows of the HEART dataset, displaying only the status, sex, age at start, 
and smoking variables. 

c. Calculating BMI for Participants:

Write a SAS step to calculate the BMI (Body Mass Index) for the participants in the HEART dataset. 
Since weight and height are in imperial measurements, you need to apply the following formula:
BMI = (weight (lbs) / height (in)^2) * 703

Create a new dataset containing the BMI of all participants. 

d. Converting Weight and Height to Metric Measurements:

Write a SAS step to create two new variables containing the weight in kilograms (kgs) and the height in centimeters (cms). 

e. Recalculating BMI in Metric Measurements:

Write a SAS step to calculate the BMI for participants using the weight in kilograms and height in centimeters. 
Use the following formula:
BMI = (weight (kgs) / height (cms)^2) * 10,000

Create a new dataset containing the metric-evaluated BMI of all participants. Comment your code to explain the calculation.

f. Calculating Absolute Difference between BMI Calculations:

Using the round() function, create a new variable that represents the absolute value of the difference between the two BMI calculations, rounded to one decimal place. Comment your code to clarify the process.

g. Printing a Report of Participants with a Significant Difference in BMI:

Print a report containing only those participants with a difference between the two BMI measures greater than 0. 
Ideally, this table should have no entries if both formulas above work as they should! 

h. Categorizing Participants by Age:
Create a new variable that records if participants are young (< 32), middle-aged (between 32 and 48 inclusive), or old (> 48). 
Use appropriate cutoffs for these categories. 

Enjoy practicing your SAS programming skills and feel free to modify or expand upon these tasks based on your learning goals. 
Happy coding!

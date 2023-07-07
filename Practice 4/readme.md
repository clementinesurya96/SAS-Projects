# Introduction
This repository contains the SAS programming code for completing two tasks. 
The tasks involve manipulating datasets using the SAS programming language. 
The details of each task and the steps to accomplish them are described below.

## Task 1: HEART Dataset Manipulation
For this task, the HEART dataset from the SASHELP library is used. 
The goal is to perform various operations on the dataset and create new datasets based on specific criteria. 


a. Create a new dataset (heart1) containing only the Status, Sex, Age at Start, Age
at Death, Height, and Weight variables.


b. Create a new dataset (heart2) containing only those participants from heart1 who
were female or with a height greater than 70.


c. Create a new dataset (heart3) containing only those participants from heart2 who
have an age at death of less than 56.


d. Print the first 5 rows of heart3. What is the status for the third person? What
was their age at death? 

## Task 2 - Create Function in SAS
Create functions to answer the following questions, and test each of them on the
Baseball dataset. Save them in the ‘functions’ table of the S40840 library, in a package
called ‘myfunctions’. 

a. Create a function ‘firstletter’ which takes a character variable called ‘Division’
and returns the first letter of that variable in a new character variable.


b. Create a function called ‘namelength’ which takes a character variable called
‘Name’ and finds the length of the string in each entry, after removing all spaces
and commas. Store this length in a new numeric variable.


c. Create a function called ‘nbrmisses’, which finds the number of misses by taking
the difference between two numeric variables nAtBat and nHits, and finds and
stores the difference of these two in a new variable.

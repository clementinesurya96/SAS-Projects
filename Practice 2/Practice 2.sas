/* Tutorial 4 */

/* 1. Use the HEART dataset from SASHELP 
library. Write steps for these, rather
than using point-and-click routines. 
Remember to comment your code clearly. 
Create and save a new dataset when answering
the following. Use a new SAS programme to:*/

/*a. Write a PROC step to view the contents
of the HEART dataset. Ensure the variables are 
sorted in the order in which they appear in the table*/
PROC contents data=SASHELP.HEART varnum;
run;

/*b. Write a step to view the first 10 rows of the table,
showing only the status, sex, age at start, 
and smoking variable*/
PROC print data=SASHELP.HEART(obs = 10);
	var  Status Sex AgeAtStart Smoking;
run;

/*c. Create a new dataset containing the BMI
of all participants in lbs and inches.*/
DATA S40840.HEART;
	set SASHELP.HEART;
		BMI = weight / height**2 * 703; 
run;

/*d. Create two new variables containing the 
weight in kgs and the height in cms.*/
DATA S40840.HEART1;
	set S40840.HEART;
		weight_kg = weight * 0.453592;
		height_cm = height * 2.54;
run;

/*e. Create a new dataset containing the metric-evaluated
BMI of all participants */
DATA S40840.HEART1;
	set S40840.HEART1;
		BMI_metric = weight_kg / height_cm**2 * 10000; 
run;

/*f. Using the round() function, create a new variable
of the absolute value of the difference between two BMI calculations,
rounded to 1 decimal place*/
DATA S40840.HEART1;
	set S40840.HEART1;
		abs_diff_BMI = abs(BMI_metric - BMI);
		abs_diff_BMI_round = round(abs_diff_BMI, 0.1);
run;

/*g. Print a report containing only those participants
with a difference between the two BMI measures
of greater than 0. Ideally this table should have no 
entries if both formula above work as they should.*/
PROC print data=S40840.HEART1;
	where abs_diff_BMI_round > 0;
run;

/*h. Create a new variable recording if participants
are young (<32), middle (between 32 and 48 inclusive)
or old (> 48)*/
DATA S40840.HEART1;
	set S40840.HEART1;
	length Age_Status $ 10;
		Age_Status ='Young'; *Initialising Size;
		if  AgeAtStart > 32 and AgeAtStart <= 48 then Age_Status='Middle';
		if AgeAtStart > 48 then Age_Status='Old';
run;

/*i. Write a step using a do group which 
creates a new character and numerical variable
based on the following:
- if the participant smokes between 0 and 10
cigarettes per day, label them as 'Light1'
and with a value of 5 for the numeric variable.
- if they smoke more than 10 and up to and including 20,
label them as 'Light 2' and with a value of 15 for 
numeric variable.
Continue in the same fashion up to the maximum needed
(you can quickly see this when viewing the dataset
by clicking on the smoking column twice to sort by descending)
- Decide on appropriate names for the rest of the categories:
'Light3','Medium','Heavy1'..etc*/




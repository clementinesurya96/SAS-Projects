/* Practice 4 */

/* 1. Use the HEART dataset from the SASHELP library for these questions. Write steps
for these questions, remembering to comment your code clearly. Create and save a new
dataset when answering the following. Use a new SAS programme file to:*/

/* a. Create a new dataset (heart1) containing only the Status, Sex, Age at Start, Age
at Death, Height, and Weight variables. */
DATA s40840.heart1 (keep= Status Sex AgeAtStart AgeAtDeath Height Weight);
	set sashelp.heart;
run;

/* b. Create a new dataset (heart2) containing only those participants from heart1 who
were female or with a height greater than 70. */
DATA s40840.heart2;
	set s40840.heart1;
		where Sex = 'Female' | Height > 70;
run;

/*c. Create a new dataset (heart3) containing only those participants from heart2 who
have an age at death of less than 56.*/
DATA s40840.heart3;
	set s40840.heart2;
		where AgeAtDeath < 56;
run;

/*d. Print the first 5 rows of heart3. What is the status for the third person? What
was their age at death?
Answer: The status for the third person is Alive. However, the age at death is N/A.
https://support.sas.com/documentation/cdl/en/lrcon/62955/HTML/default/viewer.htm#a000989180.htm*/
PROC print data=s40840.heart3 (firstobs=1 obs=5);
run;

/* 2. Create functions to answer the following questions, and test each of them on the
Baseball dataset. Save them in the ‘functions’ table of the S40840 library, in a package
called ‘myfunctions’. That is, start your function definitions with the line:
PROC fcmp outlib=s40840.functions.myfunctions;*/

/*a. Create a function ‘firstletter’ which takes a character variable called ‘Division’
and returns the first letter of that variable in a new character variable.*/
PROC fcmp outlib=s40840.functions.myfunctions;
	function firstletter(Division $) $;
		length division_name $ 1;
			division_name = substr(Division, 1, 1);
		return(division_name);
	endsub;
quit;

options CMPLIB=s40840.functions;
/* Testing the function using CARS Dataset */
DATA s40840.cars;
	set sashelp.cars;
	Origin_Division = firstletter(Origin);
run;

/*b. Create a function called ‘namelength’ which takes a character variable called
‘Name’ and finds the length of the string in each entry, after removing all spaces
and commas. Store this length in a new numeric variable.*/
PROC FCMP outlib=s40840.functions.myfunctions;
	function namelength(Name $) $;
	length length_name $ 20;
		length_name = compress(tranwrd(Name, ',', ''), ' ');
		length_count = length(length_name);
		return(length_count);
	endsub;
QUIT;

options CMPLIB=s40840.functions;
/* Testing the function using CARS Dataset */
DATA s40840.cars;
	set sashelp.cars;
	Model_Count = namelength(Model);
run;

/* c. Create a function called ‘nbrmisses’, which finds the number of misses by taking
the difference between two numeric variables nAtBat and nHits, and finds and
stores the difference of these two in a new variable. */
PROC FCMP outlib=s40840.functions.myfunctions;
	function nbrmisses(a, b);
		diff = a - b;
		return(diff);
	endsub;
QUIT;

options CMPLIB=s40840.functions;
/* Testing the function using BASEBALL Dataset */
DATA s40840.baseball;
	set sashelp.baseball;
	diff_nAtBat_nHits = nbrmisses(nAtBat, nHits);
run;








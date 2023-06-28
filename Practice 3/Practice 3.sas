/* Practice 3 */

/* Use the DEMOGRAPHICS dataset from the SASHELP library for these questions.
Write steps for these questions, remembering to comment your code clearly.*/
/* And if we want to capitalise it? */

/* Using the DEMOGRAPHICS dataset: */
PROC print data=SASHELP.DEMOGRAPHICS;
run;

/* a. Change the ISONAME variable so that only the first letters are capitalised. */
DATA s40840.DEMOGRAPHICS;
    set sashelp.DEMOGRAPHICS;
    ISONAME = propcase(ISONAME);
run;

PROC print data=s40840.DEMOGRAPHICS;
run;

/* b. Replace the REGION values with the corresponding full word - e.g., AMR →
America, etc. */
DATA s40840.DEMOGRAPHICS;
	format region $ 40.;
	set s40840.DEMOGRAPHICS;
		region = tranwrd(region, 'AMR', 'America');
		region = tranwrd(region, 'EUR', 'Europe');
		region = tranwrd(region, 'AFR', 'Africa');
		region = tranwrd(region, 'EMR', 'Eatern Mediterranean Region');
		region = tranwrd(region, 'SEAR', 'South East Asia Region');
		region = tranwrd(region, 'WPR', 'Western Pacific Region');
run;



PROC print data=s40840.DEMOGRAPHICS;
run;

/* c. Create a variable NAME2 which contains the NAME variable but with all spaces
and special characters removed (hint: / is the only special character in this col-
umn).*/
DATA s40840.DEMOGRAPHICS;
    set s40840.DEMOGRAPHICS;
    NAME2 = compress(tranwrd(NAME, '/', ''), ' ');
run;

/*d. Create a variable LEN which records the length of the NAME2 variable for each
country. */
DATA s40840.DEMOGRAPHICS;
    set s40840.DEMOGRAPHICS;
    LEN = length(NAME2);
run;

/* Use the means procedure to find the minimum and maximum length
recorded in this variable. */
PROC means data=s40840.DEMOGRAPHICS max min;
	var LEN;
run;

/* e. Remove the first character and the final character from ISONAME and con-
catenate them into a string of length 2. Store this in a new variable called
FIRST_LAST, ensuring that all letters in this new variable are capitalised.*/
DATA s40840.DEMOGRAPHICS;
    set s40840.DEMOGRAPHICS;
    length FIRST_LAST $ 2;
    FIRST_LAST = upcase(substr(ISONAME, 1, 1) || substr(ISONAME, length(ISONAME), 1));
run;

DATA s40840.DEMOGRAPHICS;
    set s40840.DEMOGRAPHICS;
    ISONAME = substr(ISONAME, 2, length(ISONAME)-2);
run;


/* f. Can you order the dataset alphabetically by this new variable?
What is the observation in the fifth row?*/
PROC sort data=s40840.DEMOGRAPHICS;
    by FIRST_LAST;
run;

DATA fifth_observation;
    set s40840.DEMOGRAPHICS (firstobs=5 obs=5);
run;

/* Observation in the fifth row */
PROC print data=fifth_observation;
run;

/* g. Can you create a frequency table of this variable? Are there
observations which appear more than once or is every two-letter string unique? */
PROC freq data=s40840.DEMOGRAPHICS;
    tables FIRST_LAST / out=freq_table;
run;

/*There are observations appear more than once*/







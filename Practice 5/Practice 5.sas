/* Practice 5 */

/*  Simulating data from distributions & Plotting */

/* 1. Write steps for these questions, remembering to comment your code clearly. The
output of the first 4 questions could be created in a single DATA step. Use a new SAS
programme file to:*/

DATA random (drop = i);
	/* Set seed */
    call streaminit(1234);
    /* Simulate 50 values */
    do i=1 to 50;
	/* a. from a random variable which is uniformly distributed between 0 and 30 */
         a = rand('uniform', 0, 30);
    /* b. from a random variable which is exponentially distributed with a rate parameter of 5 */
         b = rand('exponential',5);
    /* c. from a binomial experiment where there are 8 trials and a 0.4 
    probability of success on each trial.*/
         c = rand('binomial',0.4,8);
    /* d. from a random variable which is Poisson distributed with a mean of 2.5 */
         d = rand('poisson',2.5);
         output;
    end;
run;
  
/* 2. Using the HEART dataset:
a. Create a plot showing two histograms: the first is the Height of the Female partic-
ipants in dataset; the second is the Height of the Male participants in the dataset.*/
PROC sgpanel data=SASHELP.HEART;
	panelby Sex / columns=2;
	histogram height;
	title "Height Distribution by Sex";
run;

/* b. Create a plot showing two barcharts: the first is the blood pressure status of
the Female participants in the dataset; the second is the blood pressure status of
the Male participants in the dataset. */
PROC sgpanel data=SASHELP.HEART;
	panelby Sex / columns=2;
	vbar  BP_Status;
	title "Blood Pressure Status by Sex";
run;


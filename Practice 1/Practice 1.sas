/* Tutorial 3 */

/* a. Write a PROC step to view the contents of the CARS dataset. Ensure the vari-
ables are sorted in the order in which they appear in the table. */
PROC contents data=SASHELP.CARS varnum;
run;

/* b. Create a report showing the 40th to 60th row. */
PROC print data=SASHELP.CARS (firstobs=40 obs=60);
run;

/* c. Create a report containing only those cars with an engine size greater than 3
litres. */
PROC print data=SASHELP.CARS;
	where  EngineSize > 3;
run;

/* d. Create a report containing only those cars with an engine size greater than 3 litres
and a horsepower greater than 250. */
PROC print data=SASHELP.CARS;
		where EngineSize > 3 &  Horsepower > 250;
run;

/* e. Create a report containing only those cars with an engine size greater than 3 litres
and a horsepower greater than 250, and set the car make as the ID. */
PROC print data=SASHELP.CARS;
		where EngineSize > 3 &  Horsepower > 250;
		ID Make;
run;


 
* Import the TSAClaims2002_2017.csv file.;

%let path=/home/u63417244/EPG1V2/data;
libname tsa "&path";
options validvarname=v7;
proc import datafile="&path/TSAClaims2002_2017.csv"
    dbms=csv
    out=tsa.ClaimsImport
    replace;
    guessingrows=max;
run;

* Preview the data.;
proc print data=tsa.ClaimsImport (obs=20);
run;
proc contents data=tsa.ClaimsImport varnum;
run;

*Explore the following columns and make notes using the information from the Data Layout;
proc freq data=tsa.ClaimsImport;
  tables Claim_Site Disposition Claim_Type / nocum nopercent;
  tables Date_Received Incident_Date / nocum nopercent;
  format Date_Received Incident_Date year4.;
run;


* Remove duplicate rows;
proc sort data=tsa.ClaimsImport
	out=tsa.Claims_NoDups
	nodupkey;
   by _all_;
run;

* Sort the data by ascending Incident_Date;
proc sort data=tsa.Claims_NoDups;
	by Incident_Date;
run;


data tsa.ClaimsImport;
  set tsa.ClaimsImport;
  
  	* Clean the Claim_Site column;
	if Claim_Site in ('-',"") then Claim_Site="Unknown";
	
	* Clean the Disposition column;
	if Disposition in ("-","") then Disposition='Unknown';
	else if Disposition='Closed: Canceled' then Disposition='Closed:Canceled';
	else if Disposition='losed: Contractor Claim' then Disposition='Closed:Contractor Claim';
	
	* Clean the Claim_Type column;
	if Claim_Type in ("-","") then Claim_Type="Unknown";
	else if Claim_Type = 'Passenger Property Loss/Personal Injur' then 
	Claim_Type='Passenger Property Loss';
	else if Claim_Type = 'Passenger Property Loss/Personal Injury' then
	Claim_Type='Passenger Property Loss';
	else if Claim_Type = 'Property Damage/Personal Injury' then
	Claim_Type='Property Damage';
	
	* Convert all State values to uppercase and all StateName values to proper case;
	State=upcase(state);
	StateName=propcase(StateName);
	
	* Create a new column that indicates date issues;
	if (Incident_Date > Date_Received or
	Incident_Date = . or
	Date_Received = . or
	year(Incident_Date) < 2002 or
	year(Incident_Date) > 2017 or
	year(Date_Received) < 2002 or
	year(Date_Received) > 2017) then Date_Issues="Needs Review";
	
	* Add permanent labels and formats;
	format Incident_Date Date_Received date9. Close_Amount Dollar20.2;
	label Airport_Code="Airport Code"
	Airport_Name="Airport Name"
	Claim_Number="Claim Number"
	Claim_Site="Claim Site"
	Claim_Type="Claim Type"
	Close_Amount="Close Amount"
	Date_Issues="Date Issues"
	Date_Received="Date Received"
	Incident_Date="Incident Date"
	Item_Category="Item Category";
	
	* Drop County and City;
	drop County City;
run;

* Analyze the overall data to answer the business questions;
title "Overall Date Issues in the Data";
proc freq data=TSA.Claims_Cleaned;
	table Date_Issues / nocum nopercent;
run;
title;

ods graphics on;
title "Overall Claims by Year";
proc freq data=TSA.Claims_Cleaned;
	table Incident_Date / nocum nopercent plots=freqplot;
	format Incident_Date year4.;
	where Date_Issues is null;
run;
title;

* Analyze the state-level data to answer the business questions;
%let StateName=California;
title "&StateName Claim Types, Claim Sites and Disposition Frequencies";
proc freq data=TSA.Claims_Cleaned order=freq;
	table Claim_Type Claim_Site Disposition / nocum nopercent;
	where StateName="&StateName" and Date_Issues is null;
run;
title "Close_Amount Statistics for &StateName";

proc means data=TSA.Claims_Cleaned mean min max sum maxdec=0;
	var Close_Amount;
	where StateName="&StateName" and Date_Issues is null;
run;
title;

* Export the end results into a single PDF named ClaimReports;
%let outpath=/home;
ods pdf file="&outpath\ClaimsReports.pdf" style=Meadow;

* Customize the procedure labels in your report;
ods proclabel "output program";
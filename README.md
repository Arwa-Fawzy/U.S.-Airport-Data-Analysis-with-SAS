# U.S.-Airport-Data-Analysis-with-SAS
A project for solving a real-world business problem by applying concepts in the SAS Programming.

## Business Problem
The first project is to prepare and analyze Transportation Security Administration (TSA) Airport Claims data from 2002 through 2017. The TSA is an agency of the United States Department of Homeland Security that has authority over the security of the traveling public. A claim is filed if you are injured or your property is lost or damaged during the screening process at an airport.
Here is what I need to do:
* Prepare the data.
* Create one PDF report that analyzes the overall data as well as the data for a dynamically specified state.

## Data Information
The data that I used is TSAClaims2002_2017.csv, which was created from the following:
* TSA Airport Claims data from https://www.dhs.gov/tsa-claims-data.
* FAA Airport Facilities data from https://www.faa.gov/airports/airport_safety/airportdata_5010/.
The TSAClaims2002_2017.csv file was created by concatenating each individual TSA Airport Claims table. After the concatenation, the data was joined with the FAA Airport Facilities data. Here are a few notes regarding the data:
* All data is public data, and accuracy is not guaranteed.
* The column Airport_Codes from the TSA Airport Claims data has been joined with Location_ID from the FAA Airports Facilities data. Some Airport_Codes values do not correspond to Location_ID values.
* Columns in the TSA Airport Claims data have changed over the years. Because of this, some of the original columns were removed from the data for this case study.
* The column Item_Category does not have consistent input values over the years. For this reason, I do not clean this column in this case study.

## Resources
To attempt this case study, I downloaded the TSAClaims2002_2017.csv file.

![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/ca350ba5-ba4e-455d-9d8a-a6ff20f7cf38)
![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/c0f5bd13-c239-4398-b7ec-b7dda30a19fd)
![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/a8859cb2-fe34-4722-b7e4-b1237bcd4347)

## Results
Here are the results for the overall analysis and a report with the selected state of California.

* Date issues in the overall data
 
![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/e789dd13-6e53-4441-9e32-e19db52f5c73)

* Claims per year of Incident_Date in the overall data

![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/112bfd6b-a212-455e-bb62-883e44b5414b)

![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/e0fa8699-f7ec-4624-90d0-afcf9f908b15)

* The frequency values for Claim_Type for the selected state

![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/33f3e803-6d8e-4dd8-8f57-768eebc39230)


* The frequency values for **Claim_Site** for the selected state

![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/01ff1efa-a72c-456b-9879-c2de68c3b601)

* the frequency values for **Disposition** for the selected state

![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/d74e58a9-e9d6-4181-9b8c-89d789454625)

* The mean, minimum, maximum, and sum of Close_Amount for the selected state to the nearest integer.

![image](https://github.com/Arwa-Fawzy/U.S.-Airport-Data-Analysis-with-SAS/assets/101527083/1f5a0432-682f-4b9b-ac25-bbbb4047cad2)


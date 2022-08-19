# GeocodingUsingPipelines
Geocoding a file with addresses using either Azure Data Factory or Synapse Pipelines

The requirements are

1. Take a csv file (or a database) with addresses and append the Latitude and Longitude of that location using either ADF or Synapse Pipelines

Approach
Ended up using a combination of a small Azure SQL Database (to take advantage of Stored Procedures and keep costs down), web call (to a free geocoding API) and a Copy Activity to hold the final results. Look at the high level overview here

![High Level](https://github.com/ujvalgandhi1/GeocodingUsingPipelines/blob/main/images/HighLevelOverview.PNG)

The first step is to define the global variables that are needed. By definition, the variables in pipelines are for the entire pipeline and cannot be constrained to a particular scope. I also ended up creating a new variable called confidence because it indicated the quality of the geocoded output. 

![Global Variables](https://github.com/ujvalgandhi1/GeocodingUsingPipelines/blob/main/images/GlobalVariables.PNG)

The first component is a LookUp Component. By design, this allows you to look up values from any source. I used a csv file (but it can be an actual database table also)
![Lookup Component Settings] (https://github.com/ujvalgandhi1/GeocodingUsingPipelines/blob/main/images/LookupSourceFiles-Settings.PNG)

The critical item to note is that the setting for "First Row only" should be unchecked because we want to read the entire file/table

The next component is a Script component. The Script (as of 8/19/2022) is limited to linked services for Azure SQL, Azure SQL MI, Azure Synapse, Oracle, On Prem SQL and Snowflake. For cost purposes, I created a small Basic Azure SQL Database
This script component is used to delete the temporary table before we run the other component. We need a temporary SQL Table to hold the output from the stored procedures that are going to be used down the line

![Script Settings](https://github.com/ujvalgandhi1/GeocodingUsingPipelines/blob/main/images/ScriptSettings.PNG)

The next component is the For Each. For Each is set up to take each row and process it.
In the first component, make sure you set the Sequential to be checked of. This will speed up processing. Then under items, click Dynamic Content to open the Pipeline Expression Builder. 
![For Each - 1](https://github.com/ujvalgandhi1/GeocodingUsingPipelines/blob/main/images/ForEachSettings1.PNG)

![For Each - 2](https://github.com/ujvalgandhi1/GeocodingUsingPipelines/blob/main/images/ForEachSettings2.PNG)

Within activities, we are going to use two activites - One is Web and other is a Stored Procedure
(https://github.com/ujvalgandhi1/GeocodingUsingPipelines/blob/main/images/ForEachActivities.PNG)

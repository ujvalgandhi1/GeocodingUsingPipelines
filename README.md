# GeocodingUsingPipelines
Geocoding a file with addresses using either Azure Data Factory or Synapse Pipelines

The requirements are

1. Take a csv file (or a database) with addresses and append the Latitude and Longitude of that location using either ADF or Synapse Pipelines

Approach
Ended up using a combination of a small Azure SQL Database (to take advantage of Stored Procedures and keep costs down), web call (to a free geocoding API) and a Copy Activity to hold the final results. Look at the high level overview here

([/images/HighLevelOverview.PNG](https://github.com/ujvalgandhi1/GeocodingUsingPipelines/blob/main/images/HighLevelOverview.PNG))

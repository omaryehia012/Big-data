CREATE database if not exists covid_db;
use covid_db;

CREATE TABLE IF NOT EXISTS covid_db.covid_staging
(
 Country STRING,
 Total_Cases DOUBLE,
 New_Cases DOUBLE,
 Total_Deaths DOUBLE,
 New_Deaths DOUBLE,
 Total_Recovered DOUBLE,
 Active_Cases DOUBLE,
 Serious DOUBLE,
 Tot_Cases DOUBLE,
 Deaths DOUBLE,
 Total_Tests DOUBLE,
 Tests DOUBLE,
 CASES_per_Test DOUBLE,
 Death_in_Closed_Cases STRING,
 Rank_by_Testing_rate DOUBLE,
 Rank_by_Death_rate DOUBLE,
 Rank_by_Cases_rate DOUBLE,
 Rank_by_Death_of_Closed_Case DOUBLE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED as TEXTFILE
LOCATION '/user/cloudera/ds/COVID_HDFS_LZ'
tblproperties ("skip.header.line.count"="1");

SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.max.dynamic.partitions=100000;
SET hive.exec.max.dynamic.partitions.pernode=100000;

CREATE TABLE IF NOT EXISTS covid_db.covid_partitioned 
(
 Country STRING,
 Total_Cases DOUBLE,
 New_Cases DOUBLE,
 Total_Deaths DOUBLE,
 New_Deaths DOUBLE,
 Total_Recovered DOUBLE,
 Active_Cases DOUBLE,
 Serious DOUBLE,
 Tot_Cases DOUBLE,
 Deaths DOUBLE,
 Total_Tests DOUBLE,
 Tests DOUBLE,
 CASES_per_Test DOUBLE,
 Death_in_Closed_Cases STRING,
 Rank_by_Testing_rate DOUBLE,
 Rank_by_Death_rate DOUBLE,
 Rank_by_Cases_rate DOUBLE,
 Rank_by_Death_of_Closed_Cases DOUBLE
)
PARTITIONED BY (COUNTRY_NAME STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED as TEXTFILE
LOCATION '/user/cloudera/ds/COVID_HDFS_PARTITIONED';

FROM
covid_db.covid_staging
INSERT INTO TABLE covid_db.covid_partitioned PARTITION(COUNTRY_NAME)
SELECT *, Country WHERE Country is not null and Country <> "" and Country <> "World";


CREATE EXTERNAL TABLE IF NOT EXISTS covid_db.covid_output
(
 COUNTRY STRING,
 TOP_DEATH_VALUE DOUBLE,
 TOP_TEST_VALUE DOUBLE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED as TEXTFILE
LOCATION '/user/cloudera/ds/COVID_FINAL_OUTPUT';

FROM
covid_db.covid_partitioned
INSERT INTO TABLE covid_db.covid_output
SELECT country, deaths, tests SORT BY cast(regexp_replace(deaths, ',', '') as double) desc;

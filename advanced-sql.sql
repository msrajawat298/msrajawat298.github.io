load large data in sql db
================================
mysqli_query($connection, 'LOAD DATA LOCAL INFILE "'.$file.'"INTO TABLE transactionsFIELDS TERMINATED by ","OPTIONALLY ENCLOSED BY "\'"LINES TERMINATED BY "\n"');

Import / Export for single table:
=====================================
1. Export table schema
	mysqldump -uusername -ppassword databasename table1 table2 table3 > path/filename.sql
2. Import data into table
    mysql -u username -p databasename < path/example.sql

Q. How to update multiple row in one statement...
UPDATE table_name SET filed_name = CASE filed_name WHEN YOUR_CONDITION1 THEN 'value1' WHEN YOUR_CONDITION2 THEN 'value2' END WHERE filed_name IN('76818', '76856');

e.g: 
UPDATE orders_products SET features_details = CASE orders_products_id WHEN '76818' THEN 'value1' WHEN '76856' THEN 'value2' END WHERE orders_products_id IN('76818', '76856')


Q. group concat exmples...
	SELECT GROUP_CONCAT("'",COLUMN_NAME,"'") as field_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='mayank_kushwah8' AND TABLE_NAME = 'test_table'

Q. Query to find list of all primary keys and check if they are clustered and if they are on unique identifier column ?
	or
Q How to select Primary key from table. or Q. How to get keys from specific table.
    SELECT GROUP_CONCAT("'",COLUMN_NAME,"'") as field_name , (SELECT COLUMN_NAME WHERE COLUMN_KEY='PRI') as primary_key  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='mayank_kushwah8' AND TABLE_NAME = 'admin'

Q. How to select all table names from database ?
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='mayank_kushwah3'
SELECT GROUP_CONCAT(TABLE_NAME) as tb FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='mayank_kushwah3'

INSERT INTO db_name.table_name SELECT * FROM db_name.table_name
such as ::
INSERT INTO mayank_kushwah1.admin_constants_description SELECT *  FROM mayank_kushwah3.`admin_constants_description` WHERE `auto_id` > 7111
INSERT INTO mayank_kushwah1.site_constants  SELECT *  FROM `site_constants` WHERE `constant_id` > 3256
INSERT INTO mayank_kushwah1.product_category  SELECT *  FROM mayank_kushwah3.`product_category` WHERE `category_id`  = 10


Q. How to fetch coloum name of table ? (SQL query to find Primary Key of a table?) 
	SELECT *  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='mayank_kushwah8' AND TABLE_NAME = 'admin'
	SELECT  COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='mayank_kushwah8' AND  TABLE_NAME = 'admin' ;

Q. How get query of create table ?
    SHOW CREATE TABLE TABLE_NAME

Q. How to fetch if multiple value in field or coloum. such as table name shipping_method and having a field or coloumn user_type = 1,2,3 and you want to fetch the data from table having user type = 1
then you need to use FIND_IN_SET.
e.g,:

	SELECT * FROM shipping_method WHERE status = '1' AND FIND_IN_SET('1',user_type) AND user_group_id = '0' ORDER BY sort_order

Q. How to fetch recent created table from db
select table_schema as database_name,table_name,create_time from information_schema.tables where create_time > adddate(current_date,INTERVAL -60 DAY) 
and table_schema not in('information_schema', 'mysql','performance_schema','sys') and table_type ='BASE TABLE'
      -- and table_schema = 'your database name' 
order by create_time desc,
         table_schema;
select table_schema as database_name,
       table_name,
       create_time
from information_schema.tables
where create_time > adddate(current_date,INTERVAL -2 DAY)
and table_schema = "mayank_kushwah8"
      order by create_time desc,
         table_schema
Need to learn more ::
===========================
https://www.geeksforgeeks.org/mysql-regular-expressions-regexp/
https://www.geeksforgeeks.org/sql-tutorial/?ref=lbp

====================================================================================================================================
						IMPORT EXPORT DATABASE
====================================================================================================================================

import :
----------------------
gunzip < impordb_filename.gz  | mysql -uREPLACE_DB_USERNAME -pdeep70 dbname

export :
----------------------
mysqldump -uREPLACE_DB_USERNAME -pdeep70 DB_NAME | gzip > EXPORT_FILENAME.gz

--For export db structure without data
--------------------------------------------
mysqldump -uREPLACE_DB_USERNAME -pdeep70 --no-data DB_NAME > EXPORT_FILENAME.gz

Issue generated ::
#1267 - Illegal mix of collations (latin1_general_ci,IMPLICIT) and (latin1_swedish_ci,IMPLICIT) for operation '='
solution:
========================================================================================================================
SELECT table_schema, table_name, column_name, character_set_name, collation_name FROM information_schema.columns WHERE collation_name = 'latin1_general_ci' and table_schema="standard_v91_81" ORDER BY table_schema, table_name,ordinal_position;

SELECT table_schema, table_name, column_name, character_set_name, collation_name FROM information_schema.columns WHERE collation_name = 'latin1_swedish_ci' and table_schema="standard_v91_81" ORDER BY table_schema, table_name,ordinal_position;

ALTER TABLE tbl_name CONVERT TO CHARACTER SET latin1 COLLATE 'latin1_swedish_ci';



----------------------------------------------
Learn More About db-sync ::
----------------------------------------------
Problem Statement ::
To sync local database and web server database in MySql
I am using PHP and Mysql for developing an application. we have two copies of database, one at local server(i.e our end) and one at web server. we want to sync both the database so that if any change made in local database should also reflect on the webserver database. is that possible?? Currently we are using PHP scripts to do so..which is taking too much of time and aswell as not reliable. What can be done so that MySQL will internally fire the whole update and logic??

Solution : MySQL Replications(https://dev.mysql.com/doc/refman/8.0/en/replication.html) might be what you are looking for, but i do not recommend to sync development and production databases. This can get you in trouble when continuing development after webpage has been released. The common approach is to have a server for development (dummy data, not public), testing (real data, not public) and production (real data, public).

Reference Link : https://stackoverflow.com/questions/3977277/to-sync-local-database-and-web-server-database-in-mysql
https://github.com/mrjgreen/db-sync
https://github.com/hrsetyono/wp-sync-db#wp-cli-integration
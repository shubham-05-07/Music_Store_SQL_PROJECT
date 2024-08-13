create database Music_Store;
use music_store;

alter table employee 
add column hire_date_temp date;

SET SQL_SAFE_UPDATES = 0;

update employee 
set hire_date_temp = STR_TO_DATE(SUBSTRING_INDEX(hire_date, ' ', 1), '%d-%m-%Y');

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE employee DROP COLUMN hire_date;

ALTER TABLE employee CHANGE hire_date_temp hire_date DATE;
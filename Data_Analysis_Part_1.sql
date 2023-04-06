/************************** Find employee and department details based on specific condition **************************/

-- Find department details under postal code 98199.
SELECT departments.* 
FROM departments join locations 
on departments.location_id=locations.LOCATION_ID
WHERE locations.postal_code = 98199;



-- Find department name under postal code 98199.
SELECT DEPARTMENT_NAME
FROM departments join locations 
on departments.location_id=locations.LOCATION_ID
WHERE locations.postal_code = 98199;


-- Find department details which does not belong to postal code 98199.
SELECT DEPARTMENT_NAME
FROM departments join locations 
on departments.location_id=locations.LOCATION_ID
WHERE locations.postal_code != 98199 or locations.postal_code is NULL;


-- Find employees details whose salary is more then 10000.
SELECT *
FROM EMPLOYEES
WHERE SALARY > 10000;


-- Find employee name, email and phone number where salary is more then 10000.
SELECT FIRST_NAME,
  LAST_NAME,
  EMAIL,
  PHONE_NUMBER
FROM EMPLOYEES
WHERE SALARY > 10000;


-- Find employee details who belongs to marketing department and has salary less then or equal to 6000.
SELECT employees.* 
FROM departments join employees 
on departments.department_id=employees.department_id
WHERE DEPARTMENT_NAME = 'Marketing' AND SALARY <= 6000;



/************************** Display records in a ordered manner and deal with NULL values. **************************/

-- Find employees details where commission pct is available.
SELECT * 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;


-- Find employee details where manager is not available.
SELECT * 
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;


-- List down employee name in ascending order.
SELECT concat(first_name,' ',last_name) as full_name
FROM employees
ORDER BY first_name, last_name

-- Find locations of UK country in ascending order of postal code.
SELECT * 
FROM LOCATIONS
WHERE COUNTRY_ID = 'UK'
ORDER BY POSTAL_CODE;


-- Find locations of UK country in descending order of postal code.
SELECT * 
FROM LOCATIONS
WHERE COUNTRY_ID = 'UK'
ORDER BY POSTAL_CODE DESC;


-- Find all the locations and arrange country in ascending and city in descending order.
SELECT * 
FROM LOCATIONS
ORDER BY COUNTRY_ID ASC, CITY DESC;


/************************** Search for specified pattern in a column. (Like, wildcards, in) **************************/


-- Find employees who work as President, Administration Vice President and Administration Assistant.
SELECT * 
FROM JOBS 
WHERE JOB_TITLE IN ('President', 'Administration Vice President' ,'Administration Assistant');

SELECT FIRST_NAME, LAST_NAME, EMAIL, JOB_ID
FROM EMPLOYEES 
WHERE JOB_ID IN ('AD_ASST', 'AD_PRES', 'AD_VP');


--Find employees who does not work as Finance Manager, Accountant and Shipping Clerk.

select * 
FROM JOBS
WHERE JOB_TITLE IN ('Finance Manager', 'Accountant', 'Shipping Clerk');

SELECT FIRST_NAME, LAST_NAME, EMAIL, JOB_ID
FROM EMPLOYEES 
WHERE JOB_ID NOT IN ('FI_MGR', 'FI_ACCOUNT', 'SH_CLERK');


-- Find employees whose job id starts with AD.
SELECT FIRST_NAME, LAST_NAME, EMAIL, JOB_ID
FROM EMPLOYEES 
WHERE JOB_ID LIKE 'AD%';


--Find all the employees whose job id does not starts with SA

SELECT FIRST_NAME, LAST_NAME, EMAIL, JOB_ID
FROM EMPLOYEES 
WHERE JOB_ID NOT LIKE 'SA%';


--Find all the employees whose job id neither starts with SA or SH
SELECT FIRST_NAME, LAST_NAME, EMAIL, JOB_ID
FROM EMPLOYEES 
WHERE JOB_ID NOT LIKE 'SA%'
AND JOB_ID NOT LIKE 'SH%';


--Find all the locations which starts with S
SELECT * 
FROM LOCATIONS
WHERE CITY LIKE 'S%';


--Find all the locations where street address has Rd in it.
SELECT * 
FROM LOCATIONS
WHERE STREET_ADDRESS LIKE '%Rd%';

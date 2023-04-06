/************************** 1. Data analysis using Sub-query **************************/

--Find all the departments where employees are tagged to it.
SELECT DEPARTMENT_ID, DEPARTMENT_NAME 
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
                        FROM EMPLOYEES);
                        
--Implement it with join                        
SELECT DISTINCT DEPARTMENTS.DEPARTMENT_ID,
DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;


-- Find employee details who belongs to marketing department and has salary less then or equal to 6000
-- and working as 'Marketing Representative'.

SELECT * FROM EMPLOYEES 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Marketing') 
AND JOB_ID = (SELECT JOB_ID 
              FROM JOBS 
              WHERE JOB_TITLE = 'Marketing Representative')
AND SALARY <= 6000;

/************************** 2. Inline view:  **************************/

--List down only those employees along with department name and city where city is 'Roma' or 'Venice' or 'Southlake'.
SELECT EMPLOYEES.EMPLOYEE_ID,
  EMPLOYEES.FIRST_NAME,
  DEPARTMENTS.DEPARTMENT_NAME,
  LOCATIONS.CITY
FROM EMPLOYEES
JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
AND CITY                  IN ('Roma', 'Venice', 'Southlake')
ORDER BY EMPLOYEES.EMPLOYEE_ID;


--List down all the employees along with department name and city where city is 'Roma' or 'Venice' or 'Southlake'.
SELECT EMPLOYEES.EMPLOYEE_ID,
  EMPLOYEES.FIRST_NAME,
  DEPARTMENTS.DEPARTMENT_NAME,
  LOCATIONS.CITY
FROM EMPLOYEES
LEFT JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
LEFT JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
AND CITY                  IN ('Roma', 'Venice', 'Southlake')
ORDER BY EMPLOYEES.EMPLOYEE_ID;

/************************** 3. Aggregate Function: Min, Max, Count, Sum, Avg **************************/

--Find max salary of an employee.
SELECT MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES;

--List down the employees who are getting maximum salary.
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES);


--Find min salary of an employee.
SELECT MIN(SALARY) AS MIN_SALARY FROM EMPLOYEES;

--List down the employees who are getting lowest salary.
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) AS MAX_SALARY FROM EMPLOYEES);


--Find total salary given to employees.
SELECT SUM(SALARY) AS SUM_OF_SALARY FROM EMPLOYEES;


--Find average salary of employees.
SELECT ROUND(AVG(SALARY), 2) AS SUM_OF_SALARY FROM EMPLOYEES;

--List down the employees who are getting more then average salary.
SELECT * FROM EMPLOYEES
WHERE SALARY > (SELECT ROUND(AVG(SALARY), 2) AS SUM_OF_SALARY FROM EMPLOYEES)
ORDER BY SALARY;

--Find total number of employees.
SELECT COUNT(*) FROM EMPLOYEES;


--Find maximum salary and number of employees who are working in IT department and hired after 29-Nov-1990.
SELECT max(salary) as 'max salary of IT',count(*) as 'number of employees in IT' 
FROM employees 
where department_id=60 and hire_date>'1990-11-29';

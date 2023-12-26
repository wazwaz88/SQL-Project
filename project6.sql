SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);

SELECT e.first_name, e.last_name, e.employee_id, e.salary  
FROM employees e
WHERE e.manager_id = (SELECT employee_id FROM employees WHERE first_name = 'Payam');


SELECT d.department_id, e.first_name, e.last_name, e.job_id, d.department_name
FROM employees e 
JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';


SELECT * 
FROM employees
WHERE salary BETWEEN (SELECT MIN(salary) FROM employees) AND 2500;


SELECT first_name, last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id;


SELECT first_name, last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id IN (40, 80);


SELECT first_name, last_name, hire_date 
FROM employees
WHERE department_id = 
( SELECT department_id 
  FROM employees
  WHERE first_name = 'Clara') 
  AND first_name <> 'Clara';
  
------------------------------------
  ---8---
SELECT employee_id, first_name || ' ' || last_name as "employee name", salary FROM employees
where salary > (SELECT avg(salary) FROM employees ) 
and department_id  in ((select department_id from employees
where first_name like 'J%'));

---------------------------------------

SELECT first_name, last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id 
JOIN locations l 
ON d.location_id = l.location_id
WHERE first_name LIKE '%z%';



SELECT e.first_name, e.last_name, e.department_id, d.department_name  
FROM employees e 
RIGHT JOIN departments d
ON e.department_id = d.department_id;


SELECT e.employee_id, e.first_name, e.last_name, j.job_title
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE e.salary < ANY  
   (SELECT salary 
    FROM employees 
    WHERE job_id = 'MK_MAN');
    


SELECT e.employee_id, e.first_name, e.last_name, e.job_id
FROM employees e
WHERE e.salary > ANY
  (SELECT salary 
   FROM employees
   WHERE job_id = 'PU_MAN')
AND e.job_id <> 'PU_MAN';



SELECT e.employee_id, e.first_name, e.last_name,  j.job_title
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE e.salary > ANY
  (SELECT AVG(salary)
   FROM employees
   GROUP BY department_id);
   
   
SELECT d.department_id, SUM(e.salary) AS total_salary
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id
HAVING COUNT(e.employee_id) > 0;



SELECT first_name, last_name, salary 
FROM employees
WHERE salary < (SELECT salary 
                FROM employees 
                WHERE employee_id = 182);


SELECT e.first_name AS employee, m.first_name AS manager
FROM employees e 
JOIN employees m
ON e.manager_id = m.employee_id;


SELECT d.department_name, l.city, l.state_province
FROM departments d 
JOIN locations l
ON d.location_id = l.location_id;


SELECT e.first_name, e.last_name  
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name LIKE 'IT%'
   AND e.salary > (SELECT AVG(salary) 
                   FROM employees e2 
                   JOIN departments d2
                   ON e2.department_id = d2.department_id
                   WHERE d2.department_name LIKE 'IT%');
                   
                
    

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e 
LEFT JOIN departments d
ON e.department_id = d.department_id;



SELECT e.first_name AS employee, m.first_name AS manager  
FROM employees e
LEFT JOIN employees m 
ON e.manager_id = m.employee_id;




SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT salary 
                FROM employees
                WHERE employee_id = 163);
                

SELECT first_name, last_name, salary, department_id, job_id
FROM employees
WHERE job_id = (SELECT job_id 
                 FROM employees
                 WHERE employee_id = 169);
                


SELECT e.first_name, e.last_name, e.department_id
FROM employees e 
JOIN employees e2
ON e.department_id = e2.department_id
WHERE e2.last_name = 'Taylor';


----24-----------

SELECT d.department_name, e.first_name, e.last_name 
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id;



------25-------

----------------

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees 
GROUP BY department_id);


SELECT * 
FROM employees
WHERE salary = 3000 AND manager_id = 121;


SELECT e.first_name, e.last_name, e.employee_id, j.job_title
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id 
JOIN jobs j
ON e.job_id = j.job_id
JOIN locations l 
ON d.location_id = l.location_id
WHERE l.city = 'Toronto';


SELECT first_name, last_name, department_name
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
WHERE EXISTS(SELECT * 
             FROM employees  
             WHERE salary > 3700);



SELECT * FROM employees
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE last_name = 'Russell');


SELECT first_name, last_name  
FROM employees
WHERE manager_id IS NULL;


SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;



SELECT last_name, city
FROM employees e 
JOIN departments d 
ON e.department_id = d.department_id 
JOIN locations l 
ON d.location_id = l.location_id;


SELECT job_id, AVG(salary) AS average_salary
FROM employees  
GROUP BY job_id;



SELECT first_name, last_name, d.department_name, l.city
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l 
ON d.location_id = l.location_id;


SELECT first_name, last_name
FROM employees
WHERE department_id IS NULL;


SELECT d.department_name, COUNT(e.employee_id)  
FROM employees e 
RIGHT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;


SELECT first_name, last_name, department_name  
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > 10000;


SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 7000;



SELECT first_name, last_name 
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';



SELECT first_name, last_name
FROM employees e
WHERE salary > (SELECT 0.5 * SUM(salary) 
                FROM employees 
                WHERE department_id = e.department_id);
    

SELECT * 
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE job_title like '%Manager';


SELECT d.department_id, d.department_name
FROM departments d
JOIN locations l
ON l.location_id = d.location_id
WHERE city = 'London';


SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary > 
(SELECT MAX(salary) 
FROM employees 
WHERE department_id = 40);

SELECT d.department_name, d.department_id, l.city
FROM departments d
JOIN locations l
ON  d.location_id = l.location_id
JOIN departments d2 
ON d2.department_id = 30
WHERE d.location_id = d2.location_id;



SELECT  d.department_name
FROM departments d
WHERE manager_id IN (
  SELECT employee_id 
  FROM employees
  WHERE first_name = 'Susan');


SELECT d.department_name, l.city
FROM departments d
JOIN locations l 
ON d.location_id = l.location_id
JOIN countries c 
ON l.country_id = c.country_id
WHERE c.country_id = 'US';


SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE e.last_name LIKE 'S%';


SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name  
HAVING COUNT(e.employee_id) > 2
ORDER BY num_employees DESC;


SELECT d.department_name, e.first_name, e.last_name 
FROM employees e  
JOIN departments d 
ON e.employee_id = d.manager_id;

SELECT e.employee_id, h.start_date, h.end_date, e.job_id, e.department_id
FROM employees e 
JOIN job_history h
ON e.employee_id = h.employee_id
WHERE e.salary >= 12000;

SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG (e.salary) > 7000;
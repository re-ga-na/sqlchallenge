-- Once you have a complete database, do the following:
--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
ORDER BY employees.emp_no;

--2. List employees who were hired in 1986.

SELECT *
FROM employees
WHERE date_part('year', hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept_manager.dept_no, 
departments.dept_name, 
dept_manager.emp_no,
employees.last_name, 
employees.first_name, 
employees.hire_date, 
dept_emp.to_date
FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN dept_emp ON dept_emp.emp_no = dept_manager.emp_no
ORDER BY dept_manager.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, 
COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;

--Epilogue: Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

SELECT *
FROM employees
WHERE emp_no = 499942
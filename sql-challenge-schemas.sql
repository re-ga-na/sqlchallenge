--Data Engineering

--Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
--Import each CSV file into the corresponding SQL table.


DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE departments (
    dept_no varchar primary key,
	dept_name varchar
);

CREATE TABLE employees (
    emp_no int primary key,
	birth_date date,
	first_name varchar,
	last_name varchar,
	gender varchar,
	hire_date date
);

CREATE TABLE dept_emp (
    emp_no int,
	dept_no varchar,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
); 

CREATE TABLE dept_manager (
    dept_no varchar,
	emp_no int,
	from_date date,
	to_date date,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees(emp_no)
);

CREATE TABLE salaries (
    emp_no int,
	salary int,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees (emp_no)
);

CREATE TABLE titles (
    emp_no int,
	title varchar,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees (emp_no)
);

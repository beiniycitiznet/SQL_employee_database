-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/xFQGgI
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--Create titles table
CREATE TABLE titles (
    title_id VARCHAR(5)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

--Create employees table
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

--Create salaries table
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);

--Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(4)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

--Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(4)   NOT NULL
);

--Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4)   NOT NULL,
    emp_no INT   NOT NULL
);

--Set foreign keys for all tables
--Connect emp_title_id in employees to title_id in titles as foreign key
ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

--Connect emp_no in salaries to emp_no in employees as foreign key
ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

--Connect emp_no in dept_emp to emp_no in employees as foreign key
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

--Connect dept_no in dept_emp to dept_no in departments as foreign key
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

--Connect dept_no in dept_manager to dept_no in departments as foreign key
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

--Connect emp_no in dept_manager to emp_no in employees as foreign key
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

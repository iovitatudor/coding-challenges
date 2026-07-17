# Task Name: Marketing vs Engineering Highest Salary Gap Analysis

## Task Overview
Calculate the absolute difference between the highest salaries in the marketing and engineering departments. The final output must be a single, absolute numeric value representing this salary difference.

## Data Requirements
* **Department Identification**: Identify the IDs corresponding to the 'marketing' and 'engineering' departments from the department table.
* **Aggregations**: Find the maximum (`MAX`) salary for each of the target departments.
* **Math Operations**: Subtract one maximum salary from the other and wrap the result in an absolute value function (`ABS`) to ensure a positive result.
* **Columns Needed**: Output a single column alias named `salary_difference`.

## Table Schema

### 1. `db_employee`
* `id` (Big Int) — Unique ID for the employee.
* `first_name` (Text) — First name of the employee.
* `last_name` (Text) — Last name of the employee.
* `salary` (Big Int) — The employee's annual salary.
* `department_id` (Big Int) — Foreign key mapping to the department.

### 2. `db_dept`
* `id` (Big Int) — Unique ID for the department (corresponds to `department_id` in employee table).
* `department` (Text) — Name of the department (e.g., 'marketing', 'engineering').

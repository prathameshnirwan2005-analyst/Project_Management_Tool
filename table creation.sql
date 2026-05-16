create database Project_Management_Tool ;     -- helps in industries better planning & organization , improve team collaboration , time mngt , resource mngt , tracking & monitoring , record keeping.
use Project_Management_Tool ;

-- Creating table for client    ( here i have created 5 main tables which are clients,projects,employees,tasks & task assignment )
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(50),
    industry VARCHAR(50),
    contact_email VARCHAR(100));

-- Creating table for projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    client_id INT,
    start_date DATE,
    deadline DATE,
    status VARCHAR(20),
    FOREIGN KEY (client_id) REFERENCES clients(client_id));

-- Creating table for empliyees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50),
    department VARCHAR(50));
    

-- Creating table for tasks
CREATE TABLE tasks (
    task_id INT PRIMARY KEY,
    project_id INT,
    task_description VARCHAR(100),
    assignee_id INT,
    due_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (assignee_id) REFERENCES employees(employee_id));

-- Creating table for task assignments
CREATE TABLE task_assignments (
    assignment_id INT PRIMARY KEY,
    task_id INT,
    employee_id INT,
    assigned_date DATE,
    FOREIGN KEY (task_id) REFERENCES tasks(task_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id));
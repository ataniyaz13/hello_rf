*** Settings ***
Documentation   Common Setup and Teardown keywords

Resource  variables.robot


*** Keywords ***
Connect to database
    Connect To Database Using Custom Params     pymssql    ${DBConnect}

Check average min_salary
    [Arguments]  ${table}
    ${avg_value} =  Query   select cast(avg(min_salary) as int) from ${table}
    log  ${avg_value}
    set test variable  ${avg_result}  ${avg_value}[0][0]

Get job title with maximum max_salary
    [Arguments]  ${table}
    ${job_title} =  Query   select job_title from ${table} where max_salary = (select max(max_salary) from ${table})
    log  ${job_title}
    set test variable  ${highest_paid_job}  ${job_title}[0][0]

Count employees
    [Arguments]  ${table}
    ${employees_cnt} =  Query   select count(employee_id) from ${table}
    log  ${employees_cnt}
    set test variable  ${employees_cnt}  ${employees_cnt}[0][0]

Get id of earliest hired employee
    [Arguments]  ${table}
    ${id} =  Query   select employee_id from ${table} where hire_date = (select max(hire_date) from ${table})
    log  ${id}
    set test variable  ${employee_id}  ${id}[0][0]

Count asian and european countries
    [Arguments]  ${table}
    ${count} =  Query   select count(*) from ${table} where region_id in (1, 3);
    log  ${count}
    set test variable  ${countries_cnt}  ${count}[0][0]

Count not valid region ids
    [Arguments]  ${table}
    ${result} =  Query   select count(*) from ${table} where region_id > 4 and region_id < 1
    log  ${result}
    set test variable  ${not_valid_values_count}  ${result}[0][0]
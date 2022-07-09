*** Settings ***
Documentation   Common Setup and Teardown keywords

Resource  variables.robot


*** Keywords ***
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

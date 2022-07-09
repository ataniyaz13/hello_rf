*** Settings ***
Documentation     Contains data checks for TRN DB in MS SQL Server.

Resource    ../resources/variables.robot

Suite Setup     Connect to database
Suite Teardown  Disconnect From Database

*** Test Cases ***
Verify average salary
    [Tags]  Jobs-001
    [Documentation]
...   *Setup:*
...   0. Setup TRN DB which contains countries, employees, jobs tables.
...
...   *Test Steps:*
...   1. Query average min_salary from jobs table.
...
...   *Expected result:*
...   0. Jobs table is present in TRN DB.
...   1. Query executed successfully.
...   2. Jobs table average min_salary was calculated as expected.
    [Setup]  Check average min_salary  ${jobs}
    Should Be Equal As Integers  ${avg_result}  6568

Verify highest paid job
    [Tags]  Jobs-001
    [Documentation]
...   *Setup:*
...   0. Setup TRN DB which contains countries, employees, jobs tables.
...
...   *Test Steps:*
...   1. Query job_title with maximum max_salary from jobs table.
...
...   *Expected result:*
...   0. Jobs table is present in TRN DB.
...   1. Query executed successfully.
...   2. Jobs table job_title with maximum max_salary was calculated as expected.
    [Setup]  Get job title with maximum max_salary  ${jobs}
    Should Be Equal As Strings  ${highest_paid_job}  President

Verify employees count
    [Tags]  Employees-002
    [Documentation]
...   *Setup:*
...   0. Setup TRN DB which contains countries, employees, jobs tables.
...
...   *Test Steps:*
...   1. Query count employees from employees table.
...
...   *Expected result:*
...   0. Employees table is present in TRN DB.
...   1. Query executed successfully.
...   2. Employees count was calculated as expected.
    [Setup]  Count employees  ${employees}
    Should Be Equal As Integers  ${employees_cnt}  40

Verify earliest hired employee
    [Tags]  Employees-002
    [Documentation]
...   *Setup:*
...   0. Setup TRN DB which contains countries, employees, jobs tables.
...
...   *Test Steps:*
...   1. Query earliest hired employee from employees table.
...
...   *Expected result:*
...   0. Employees table is present in TRN DB.
...   1. Query executed successfully.
...   2. Employee_id was calculated as expected.
    [Setup]  Get id of earliest hired employee  ${employees}
    Should Be Equal As Integers  ${employee_id}  179

Verify countries count from europe and asia
    [Tags]  Countries-002
    [Documentation]
...   *Setup:*
...   0. Setup TRN DB which contains countries, employees, jobs tables.
...
...   *Test Steps:*
...   1. Query european and asian countries count from coutries table.
...
...   *Expected result:*
...   0. Countries table is present in TRN DB.
...   1. Query executed successfully.
...   2. Countries count was calculated as expected.
    [Setup]  Count asian and european countries  ${countries}
    Should Be Equal As Integers  ${countries_cnt}  14

Countries region id in range of expected values
    [Tags]  Countries-002
    [Documentation]
...   *Setup:*
...   0. Setup TRN DB which contains countries, employees, jobs tables.
...
...   *Test Steps:*
...   1. Query region ids from coutries table out of expected range.
...
...   *Expected result:*
...   0. Countries table is present in TRN DB.
...   1. Query executed successfully.
...   2. Countries ids are in range of expected values.
    [Setup]  Count not valid region ids  ${countries}
    Should Be True   ${not_valid_values_count} == 0

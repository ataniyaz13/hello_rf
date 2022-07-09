*** Settings ***
Documentation     Contains data checks for TRN DB in MS SQL Server.

Resource    ../resources/variables.robot

Suite Setup     Connect To Database Using Custom Params     pymssql    ${DBConnect}
Suite Teardown  Disconnect From Database

*** Test Cases ***
Verify average salary
    [Tags]  Jobs-001
    [Documentation]
...   *Setup:*
...   0. Setup TRN DB which contains regions, employees, jobs tables.
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
...   0. Setup TRN DB which contains regions, employees, jobs tables.
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


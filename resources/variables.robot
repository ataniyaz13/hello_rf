*** Settings ***
Documentation   Robot resources and variables for all tests

Library     DatabaseLibrary


Resource  ./keywords.robot


*** Variables ***
${DBConnect}    database='TRN', user='test_user', password='1234', host='127.0.0.1', port='54866'
${jobs}   hr.jobs
${countries}   hr.countries
${employees}    hr.employees
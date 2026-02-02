*** Settings ***
Library    SeleniumLibrary
Library    ../../Resources/Flights/utils.py
Library    DataDriver    ../../TestData/Flights/DDT.xlsx

Resource    ../../Resources/Flights/Common.resource
Resource    ../../Resources/Flights/OneWaySearch.resource
Resource    ../../Resources/Flights/Results.resource

Test Template    One Way Flight Search - Happy Path
Test Setup    Open MMT Application
Test Teardown    Close MMT Application

*** Variables ***
${EXCEL_PATH}    TestData/Flights/DDT.xlsx
${SHEET_NAME}    Sheet1
#${TC_ID}    TC_01

*** Keywords ***
One Way Flight Search - Happy Path
    [Arguments]    ${TC_ID}
    ${testdata}=    fetch_testdata_by_id    ${EXCEL_PATH}   ${TC_ID}
    Close Login Popup
    Enter From City    ${testdata}
    Enter To City    ${testdata}
    Select Departure Date    ${testdata}
    Select Number Of Travellers    ${testdata}
    Click Search Button

    Verify That Result Page Is Loaded
    Verify From City Is Prepopulated    ${testdata}
    Verify To City Is Prepopulated    ${testdata}
    Verify That Departure Date Is Retained    ${testdata}
    Verify Flight List Is Visible

*** Test Cases ***
One Way Flight Search   ${TC_ID}
*** Settings ***
Library    SeleniumLibrary
Library    ../../Resources/Flights/utils.py

Resource    ../../Resources/Flights/Common.resource
Resource    ../../Resources/Flights/OneWaySearch.resource
Resource    ../../Resources/Flights/Results.resource

Test Setup    Open MMT Application
Test Teardown    Close MMT Application

*** Variables ***
${EXCEL_PATH}    TestData/Flights/NewTestData.xlsx
${SHEET_NAME}    Sheet1
${TC_ID}    TC_01

*** Keywords ***
*** Test Cases ***
One Way Flight Search - Happy Path
#    Set Selenium Speed    1s
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
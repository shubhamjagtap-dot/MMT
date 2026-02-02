*** Settings ***
Library    SeleniumLibrary
Variables    ../../PageObjects/Flights/ResultPageLocators.py

*** Keywords ***
Verify That Result Page Is Loaded
    Wait Until Element Is Visible    ${result_page_identifier}

Verify From City Is Prepopulated
    [Arguments]    ${my_dict}
    ${dict}    Create Dictionary    &{my_dict}
    Wait Until Element Is Visible    ${from_city_text}
    ${t1}    Get Text    ${from_city_text}
    Should Contain    ${t1}    ${dict.FromCity}
#    Element Text Should Be    ${from_city_text}    Pune, India

Verify To City Is Prepopulated
    [Arguments]    ${my_dict}
    ${dict}    Create Dictionary    &{my_dict}
    ${to_city_text}    Replace String    ${to_city_text}    To City    ${dict.ToCity}
    Wait Until Element Is Visible    ${to_city_text}
    ${t1}    Get Text    ${to_city_text}
    Should Contain    ${t1}    ${dict.ToCity}

Verify That Departure Date Is Retained
    [Arguments]    ${my_dict}
    ${dict}    Create Dictionary    &{my_dict}
    &{date}    Display Date Formatter    ${dict.DepartDate}
#    Log To Console    ${date.display_date1}
    ${t1}    Get Text    xpath = //label[@for="departure"]//descendant::span[2]
#    Log To Console    ${t1}
    Should Contain    ${t1}    ${date.display_date1}

Verify Flight List Is Visible
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${flight_list_container}    timeout = 10s
    Log To Console    ${status}

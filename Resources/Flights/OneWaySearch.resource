*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Variables    ../../PageObjects/Flights/SearchPageLocators.py

*** Variables ***
#${departure_date_input}    //input[@id="departure"]/ancestor::div
#${next_month_button}       //span[@role="button" and @aria-label="Next Month"]

*** Keywords ***
Select Flights Tab
    Wait Until Element Is Visible    ${flight_tab}    10s
    Click Element    ${flight_tab}

Enter From City
    [Arguments]    ${from_city}
    ${selected_city}    Create Dictionary   &{from_city}
    Wait Until Element Is Visible    ${from_city_box}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${from_city_box}
    Wait Until Element Is Visible    ${from_city_input_field}    timeout=5s
    Input Text    ${from_city_input_field}    ${selected_city['FromCity']}
    ${selected_suggested_city}  replace String  ${from_city_suggestion}  Selected City   ${selected_city.FromCity}
    Wait Until Element Is Visible    ${selected_suggested_city}
    Click Element    ${selected_suggested_city}

Enter To City
    [Arguments]    ${to_city}
    ${selected_city}    Create Dictionary    &{to_city}
    Wait Until Element Is Visible    ${to_city_input}
    Wait Until Keyword succeeds    5x    2s    Click Element    ${to_city_input}
    Wait Until Element Is Visible    ${to_city_input_field}    timeout=5s
    Input Text    ${to_city_input_field}    ${selected_city.ToCity}
    ${selected_city_suggestion}    Replace String    ${to_city_suggestion}    To City    ${selected_city.ToCity}
    Wait Until Element Is Visible    ${selected_city_suggestion}
    Click Element    ${selected_city_suggestion}

Select Departure Date
    [Arguments]    ${dict}
    ${selected_date}    Create Dictionary    &{dict}
    Wait Until Element Is Visible    xpath = //div[@class = "RangeExample oneWay"]//descendant::span[contains(text(), "Book round trip")]
    ${flag}=    Set variable    0
    ${is_departure_set}    Set Variable    ${False}

    FOR    ${i}    IN RANGE    1    13
        &{date}    Display Date Formatter    ${selected_date.DepartDate}    ${flag}
        ${new_date}     Create Dictionary   &{date}
        ${new_depart_date_locator}     Replace String    ${dynamic_date_formate}    DATE_HERE    ${new_date.display_date}
#        Log To Console    ${new_date}

        IF    ${new_date.date_found} and not ${is_departure_set}
            Wait Until Element Is Visible    ${new_depart_date_locator}
            Click Element    ${new_depart_date_locator}
            ${is_departure_set}    Set Variable    ${True}
            Exit For Loop
        ELSE
#            Log To Console    Date Not Found In Current View, Moving To The Next Month
            Click Element    ${next_month_button}
            ${flag}    Evaluate    ${flag} + 1
        END
    END


Select Number Of Travellers
    [Arguments]    ${my_dict}
    ${dict}    Create Dictionary    &{my_dict}
    Log To Console    ${my_dict}
    Wait Until Element Is Visible    ${travel_and_class}
    Click Element    ${travel_and_class}

    Selecet Number Of Adults    ${dict.Adults}
    Select Number Of Children    ${dict.Children}
    Select Number Of Infants    ${dict.Infants}

    Execute Javascript    window.scrollBy(0,100);
    Wait Until Element Is Visible    ${apply_button}
    Click Element    ${apply_button}


Selecet Number Of Adults
    [Arguments]    ${number}
    ${no_of_adults}    Replace String    ${number_of_adults}    NO    ${number}
    Wait Until Element Is Visible    ${no_of_adults}
    Click Element    ${no_of_adults}

Select Number Of Children
    [Arguments]    ${number}
    ${no_of_children}    Replace String    ${number_of_children}    NO    ${number}
    Wait Until Element Is Visible    ${no_of_children}
    Click Element    ${no_of_children}

Select Number Of Infants
    [Arguments]    ${number}
    ${no_of_infants}    Replace String    ${number_of_infants}    NO    ${number}
    Wait Until Element Is Visible    ${no_of_infants}
    Click Element    ${no_of_infants}





Click Search Button
    Wait Until Element Is Visible    ${search_button}
    Click Element    ${search_button}
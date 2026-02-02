*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MMT_URL}    https://www.makemytrip.com/
${BROWSER}    chrome

*** Keywords ***
Open MMT Application
    Open Browser    ${MMT_URL}    ${BROWSER}
    Maximize Browser Window
#    Set Selenium Wait    10s

Close Login Popup
    [Documentation]    MakeMyTrip shows a login modal on page load, clicking on body usually dismises it
    Wait Until Element Is visible    xpath = //span[@data-cy = "closeModal"]
    Click Element    xpath = //span[@data-cy = "closeModal"]
    Wait Until Element Is Visible    xpath = //body
    Wait Until Element Is Visible    ${ai_popup}
    Click Element    ${ai_popup}
    Click Element    xpath = //body

Close MMT Application
    Close Browser
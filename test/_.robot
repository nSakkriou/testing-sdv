*** Settings ***
Library    SeleniumLibrary
Library    geoloca.py

*** Variables ***
${Site URL}    https://rats.nathansakkriou.com
${Browser}     Firefox
${park_id}

*** Test Cases ***
Acceder au bus le plus proche du parking relais
    [Documentation]    Trouver le bus le plus proche d'un parking relais
    [Tags]    bus

    Open Home
    
    Click station du park relais    ${park_id}
    Click Button    //*[@id="app"]/div/div[1]/button[2]
    Click Button    //*[@id="metro"]/button[1]

    Close Test
    
*** Keywords ***
Open Home
    Open Browser       ${Site URL}    ${Browser}
    Allow Geoloca
    
Close Test
    Close Browser

Click station du park relais
    [Arguments]    ${PARK_ID}
    Click Button    //*[@id="${PARK_ID}"]/div/button[2]
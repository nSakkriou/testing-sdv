*** Settings ***
Library    SeleniumLibrary
Library    geoloca.py
Library    Process

*** Variables ***
${Site URL}    https://rats.nathansakkriou.com
${Browser}     Firefox
${park_id}
${LATITUDE}    48.8566    # Paris latitude
${LONGITUDE}   2.3522     # Paris longitude


${TIMEOUT}    30s
${FIREFOX_OPTIONS}

*** Test Cases ***
Acceder au bus le plus proche du parking relais
    [Documentation]    Trouver le bus le plus proche d'un parking relais
    [Tags]    bus

    Open Home
    Wait Until Page Contains    Poterie

    #Click station du park relais    ${park_id}
    #Click Button    //*[@id="app"]/div/div[1]/button[2]
    #Click Button    //*[@id="metro"]/button[1]

    Close Test
    
*** Keywords ***
Open Home
    ${FIREFOX_OPTIONS}=    Create Firefox Options
    Open Browser    ${Site URL}    ${Browser}    options=${FIREFOX_OPTIONS}
    
    
Close Test
    Close Browser

Click station du park relais
    [Arguments]    ${PARK_ID}
    Click Button    //*[@id="${PARK_ID}"]/div/button[2]

Create Firefox Options
    ${FIREFOX_OPTIONS}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    #Call Method    ${FIREFOX_OPTIONS}    add_argument    -headless
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.enabled    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.provider.use_corelocation    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.prompt.testing    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.prompt.testing.allow    ${TRUE}
    [Return]    ${FIREFOX_OPTIONS}
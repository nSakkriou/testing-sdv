*** Settings ***
Library    SeleniumLibrary
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
Test si la bouton station emmene bien vers la liste des stations du parking
    [Documentation]    Trouver le bus le plus proche d'un parking relais
    [Tags]    bus

    Open Home
    # Chargement de la page. Trouver une meilleure méthode
    Wait Until Page Contains    Poterie
    
    ${current_named}=    Get Text    xpath=//*[@id="${park_id}"]/h2/text()
    


    Close Test
    
*** Keywords ***
Open Home
    ${FIREFOX_OPTIONS}=    Create Firefox Options
    Open Browser    ${Site URL}    ${Browser}    options=${FIREFOX_OPTIONS}
    
Close Test
    Close Browser

Click station du park relais
    [Arguments]    ${PARK_ID}
    Click Button    xpath=//*[@id="${PARK_ID}"]/div/button[2]

Create Firefox Options
    ${FIREFOX_OPTIONS}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    #Call Method    ${FIREFOX_OPTIONS}    add_argument    -headless
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.enabled    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.provider.use_corelocation    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.prompt.testing    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.prompt.testing.allow    ${TRUE}
    RETURN   ${FIREFOX_OPTIONS}
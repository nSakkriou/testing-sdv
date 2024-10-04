*** Settings ***
Library    SeleniumLibrary
Library    Process

*** Variables ***
${Site URL}    http://localhost:8080
${Browser}     Firefox
${park_id}
${LATITUDE}    48.8566    # Paris latitude
${LONGITUDE}   2.3522     # Paris longitude


${TIMEOUT}    30s
${FIREFOX_OPTIONS}
${url}




*** Test Cases ***
Test que la bouton station emmene bien vers la liste des stations du parking
    [Documentation]    Trouver le bus le plus proche d'un parking relais
    [Tags]    nom

    Open Home
    
    ${current_named}=    Get Text    xpath=//*[@id="${park_id}"]/h2/span[2]
    Click station du park relais    ${park_id}
    ${station_name}=    Get Text    xpath=//*[@id="app"]/nav/h1    

    Should Be Equal    ${current_named}    ${station_name}

    Close Test

Test que le bouton horaire ouvre bien la modale
    [Documentation]    Trouver le bus le plus proche d'un parking relais
    [Tags]    modal

    Open Home
    Click Button    xpath=//*[@id="${park_id}"]/div/button[1]
    Element Should Be Visible    xpath=//*[@id="app"]/div[2]/div[1]/button
    
    Close Test

# Test il est possible de cliquer sur un bouton metro
#     [Documentation]    Trouver le bus le plus proche d'un parking relais
#     [Tags]    metro

#     Open Home
#     Click station du park relais    ${park_id}
#     Wait Until Element Is Visible    xpath=//*[@id="metro"]/button[1]
#     Click Button    xpath=//*[@id="metro"]/button[1]
    
#     ${url}=    Get Location
#     Should Contain    ${url}    "maps.gooogle.com"

#     Close Test


*** Keywords ***
Open Home
    ${FIREFOX_OPTIONS}=    Create Firefox Options
    Open Browser    ${Site URL}    ${Browser}    options=${FIREFOX_OPTIONS}
    Wait Until Page Contains    Poterie
    
Close Test
    Close Browser

Click station du park relais
    [Arguments]    ${PARK_ID}
    Click Button    xpath=//*[@id="${PARK_ID}"]/div/button[2]
    
Create Firefox Options
    ${FIREFOX_OPTIONS}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${FIREFOX_OPTIONS}    add_argument    -headless
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.enabled    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.provider.use_corelocation    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.prompt.testing    ${TRUE}
    Call Method    ${FIREFOX_OPTIONS}    set_preference    geo.prompt.testing.allow    ${TRUE}
    RETURN   ${FIREFOX_OPTIONS}
*** Settings ***
Library    AppiumLibrary
Resource    credentials.robot
Suite Setup    Set Appium Timeout    10s

*** Variables ***
${USERNAME}    ubirajarafilho_GzcaLl
${ACCESS_KEY}    2rCdtj5phGpRm1ZsEpps
${REMOTE_URL}    https://${USERNAME}:${ACCESS_KEY}@hub.browserstack.com/wd/hub
${APP_ID}    bs://16e25e90e2d266d4eede366fcf138ee5eb253708

*** Keywords ***
Abre aplicativo
    &{bstack_options}=    Create Dictionary
    ...    sessionName=QAzando Food App
    ...    deviceName=Google Pixel 7
    ...    osVersion=13.0

    &{desired_caps}=    Create Dictionary
    ...    platformName=Android
    ...    automationName=UiAutomator2
    ...    app=${APP_ID}
    ...    bstack:options=${bstack_options}

    Open Application    ${REMOTE_URL}    &{desired_caps}

Login com sucesso
    Input Text    accessibility_id=email    ${EMAIL}
    Input Text    accessibility_id=password    ${PASSWORD}
    Click Element    accessibility_id=login-button

Login sem sucesso
    Input Text    accessibility_id=email    ${EMAIL}
    Click Element    accessibility_id=login-button

Aguardar
    Sleep    3s

*** Test Cases ***
Cenario 1: Login com sucesso
    [Tags]    login-com-sucesso
    Abre aplicativo
    Wait Until Element Is Visible    ${TEXT_LOGIN_ELEMENT}    5s
    Login com sucesso
    Wait Until Element Is Visible    ${HOME_ELEMENT}    5s
    Capture Page Screenshot
    Close Application

Cenario 2: Login sem sucesso
    [Tags]    login-sem-sucesso
    Abre aplicativo
    Wait Until Element Is Visible    ${TEXT_LOGIN_ELEMENT}    5s
    Login sem sucesso
    Wait Until Element Is Visible    ${TEXT_FAIL_LOGIN_ELEMENT}    5s
    Capture Page Screenshot
    Close Application
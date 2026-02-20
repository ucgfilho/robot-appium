*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Resource   credentials.robot
Suite Setup    Set Appium Timeout    10s

*** Keywords ***
Abre aplicativo
    Run Keyword If    '${RUN_ENV}' == 'BSTACK'    Abre no BrowserStack
    ...    ELSE    Abre Local

Abre no BrowserStack
    ${user}=    Get Environment Variable    BROWSERSTACK_USERNAME
    ${key}=     Get Environment Variable    BROWSERSTACK_ACCESS_KEY

    &{bstack_options}=    Create Dictionary
    ...    userName=${user}
    ...    accessKey=${key}
    ...    sessionName=QAzando Food App
    ...    deviceName=Google Pixel 7
    ...    osVersion=13.0

    &{caps}=    Create Dictionary
    ...    platformName=Android
    ...    automationName=UiAutomator2
    ...    app=${APP_ID_BSTACK}
    ...    bstack:options=${bstack_options}

    Open Application    ${REMOTE_URL_BSTACK}    &{caps}

Abre Local
    &{caps}=    Create Dictionary
    ...    platformName=Android
    ...    automationName=UiAutomator2
    ...    app=${APP_PATH_LOCAL}

    Open Application    ${REMOTE_URL_LOCAL}    &{caps}

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

Debug Env
    ${user}=    Get Environment Variable    BROWSERSTACK_USERNAME
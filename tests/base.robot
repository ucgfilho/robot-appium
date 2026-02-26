*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Resource   credentials.robot

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
    ...    sessionName=qafood - Android
    ...    deviceName=Google Pixel 7
    ...    osVersion=13.0

    &{caps}=    Create Dictionary
    ...    platformName=Android
    ...    automationName=UiAutomator2
    ...    app=${APP_ID_BSTACK}
    ...    bstack:options=${bstack_options}

    Open Application    ${REMOTE_URL_BSTACK}    &{caps}

Abre Local
    ${app_path}=    Normalize Path    ${APP_PATH_LOCAL}
    File Should Exist    ${app_path}
    &{caps}=    Create Dictionary
    ...    platformName=Android
    ...    automationName=UiAutomator2
    ...    app=${app_path}
    ...    udid=emulator-5554
    ...    deviceName=emulator-5554

    Open Application    ${REMOTE_URL_LOCAL}    &{caps}

Loga com credenciais válidas
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    5s
    Click Element    ${EMAIL_FIELD}
    Input Text    ${EMAIL_FIELD}    ${EMAIL}
    Click Element    ${PASSWORD_FIELD}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${HOME_HEADER}    5s

Loga com credenciais inválidas
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    5s
    Click Element    ${EMAIL_FIELD}
    Input Text    ${EMAIL_FIELD}    ${EMAIL}
    Click Element    ${PASSWORD_FIELD}
    Input Text    ${PASSWORD_FIELD}    000000
    Click Element    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${TEXT_FAIL_LOGIN_ELEMENT}    5s

Permite localização
    Click Element    //android.widget.Button[@resource-id="android:id/button1"]

Seleciona endereço
    Wait Until Element Is Visible    ${ADDRESS_SELECTOR}    5s
    Click Element    ${ADDRESS_SELECTOR}
    Permite localização

Seleciona restaurante
    Wait Until Element Is Visible    ${SELECT_RESTAURANT}    5s
    Click Element    ${SELECT_RESTAURANT}

Adiciona item ao carrinho
    Wait Until Element Is Visible    ${ITEMS_MENU_RESTAURANT}    5s
    Click Element    ${ADD_ITEM_RESTAURANT}

Confirma pedido
    Wait Until Element Is Visible    ${ORDER_CONFIRM}    5s
    Click Element    ${ORDER_CONFIRM}

Seleciona pagamento em dinheiro
    Wait Until Element Is Visible    ${MONEY_PAYMENT_METHOD}    5s
    Click Element    ${MONEY_PAYMENT_METHOD}

Finaliza pedido
    Wait Until Element Is Visible    ${PLACE_ORDER_BUTTON}    5s
    Click Element    ${PLACE_ORDER_BUTTON}

Valida confirmação do pedido
    Wait Until Element Is Visible    ${ORDER_CONFIRMATION_MESSAGE}    5s
    ${message}=    Get Text    ${ORDER_CONFIRMATION_MESSAGE}
    Should Be Equal    ${message}    Pedido realizado
    Capture Page Screenshot    order/order-confirmation.png

*** Settings ***
Resource   ../base.robot
Suite Setup    Set Appium Timeout    10s

*** Test Cases ***
Cenario 1: Login válido
    [Tags]    login-valido
    Abre aplicativo
    Loga com credenciais válidas
    Capture Page Screenshot    filename=login/login-success.png
    Close Application    

Cenario 2: Login inválido
    [Tags]    login-invalido
    Abre aplicativo
    Loga com credenciais inválidas
    Capture Page Screenshot    filename=login/login-fail.png
    Close Application
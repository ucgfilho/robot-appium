*** Settings ***
Resource   ../base.robot
Suite Setup    Set Appium Timeout    5s

*** Test Cases ***
Cenario 1: Realiza pedido com sucesso
    [Tags]    realiza-pedido-com-sucesso
    Abre aplicativo
    Loga com credenciais válidas
    Seleciona endereço
    Seleciona restaurante
    Adiciona item ao carrinho
    Confirma pedido
    Seleciona pagamento em dinheiro
    Finaliza pedido
    Valida confirmação do pedido
    Close Application
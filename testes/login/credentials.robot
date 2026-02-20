*** Variables ***
${REMOTE_URL_LOCAL}     http://localhost:4723
${REMOTE_URL_BSTACK}    https://hub.browserstack.com/wd/hub
${RUN_ENV}              BSTACK    # Caso queira rodar no BrowserStack, altere para BSTACK

${APP_ID_BSTACK}        bs://16e25e90e2d266d4eede366fcf138ee5eb253708
${APP_PATH_LOCAL}       ${CURDIR}/../../app/qazandofood.apk

${TEXT_LOGIN_ELEMENT}   //android.widget.TextView[@text="Falta pouco pra matar sua fome!"]
${TEXT_FAIL_LOGIN_ELEMENT}   //android.widget.TextView[@text="Erro ao realizar login"]
${HOME_ELEMENT}   //android.view.ViewGroup[@content-desc="address-button"]
${EMAIL}   teste@teste.com
${PASSWORD}   123456
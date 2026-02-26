*** Variables ***
# BrowserStack Credentials
${REMOTE_URL_LOCAL}     http://localhost:4723
${REMOTE_URL_BSTACK}    https://hub.browserstack.com/wd/hub
${RUN_ENV}              LOCAL    # Caso queira rodar no BrowserStack, altere para BSTACK
${APP_ID_BSTACK}        bs://16e25e90e2d266d4eede366fcf138ee5eb253708
${APP_PATH_LOCAL}       ${CURDIR}/../app/qafood.apk

# Elements
${LOGIN_BUTTON}   //android.view.ViewGroup[@content-desc="login-button"]
${TEXT_FAIL_LOGIN_ELEMENT}   //android.widget.TextView[@text="Erro ao realizar login"]
${HOME_HEADER}   //android.view.ViewGroup[@content-desc="address-button"]
${ADDRESS_SELECTOR}   //android.view.ViewGroup[@content-desc="address-button"]/android.view.ViewGroup
${SEARCH_BAR}    //android.widget.EditText[@content-desc="search-field"]
${SELECT_RESTAURANT}    //android.view.ViewGroup[@content-desc="store-list-item"]
${ITEMS_MENU_RESTAURANT}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup
${ADD_ITEM_RESTAURANT}    //android.view.ViewGroup[@content-desc="add-item-buttom"])[1]/android.widget.ImageView
${CART_HOME}    //android.widget.ScrollView
${ORDER_CONFIRM}    //android.view.ViewGroup[@content-desc="confirm-order-button"]
${FINALIZE_ORDER_HEADER}    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]
${MONEY_PAYMENT_METHOD}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[7]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup
${CREDIT_CARD_PAYMENT_METHOD}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[7]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup
${PLACE_ORDER_BUTTON}    //android.view.ViewGroup[@content-desc="do-order-button"]
${ORDER_CONFIRMATION_MESSAGE}    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]
${EMAIL_FIELD}    //android.widget.EditText[@content-desc="email"]
${PASSWORD_FIELD}    //android.widget.EditText[@content-desc="password"]

# Credentials
${EMAIL}   teste@teste.com
${PASSWORD}   123456
import os
from appium import webdriver
from appium.webdriver.client_config import ClientConfig

def create_driver(options):
    username = os.environ["BROWSERSTACK_USERNAME"]
    access_key = os.environ["BROWSERSTACK_ACCESS_KEY"]

    client_config = ClientConfig(
        remote_server_addr="https://hub.browserstack.com/wd/hub",
        username=username,
        password=access_key
    )

    return webdriver.Remote(client_config=client_config, options=options)
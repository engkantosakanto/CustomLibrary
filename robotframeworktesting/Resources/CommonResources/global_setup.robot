*** Settings ***
Library           Selenium2Library    timeout=60
Library           OperatingSystem
Resource          global_helper.robot
Resource          launch_webdriver_page.robot
Resource          webdriver_config.robot
Resource          login_users_page.robot
Resource          logout_user.robot
Resource          navigation_header.robot
Resource          ../PageResources/footer_page.robot
Resource          ../Variables/url_extension_constants.robot
Resource          LanguageTranslation/${LANGUAGE_TRANSLATION_FILE}
Resource          ../../MobileWeb/Resources/CommonResources/mobileweb_global_helper.robot

*** Keywords ***
Setup Selenium Speed
    Set Selenium Speed    0.5

Setup Selenium Timeout
    Set Selenium Timeout    15

Post Project Page Selenium Speed
    Set Selenium Speed    2
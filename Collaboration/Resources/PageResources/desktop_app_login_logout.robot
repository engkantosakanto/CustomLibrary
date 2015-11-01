*** Settings ***
Resource          ../CommonResources/desktop_app_global_helper.robot
Resource          ../Variables/desktop_app_installation_constants.robot
Resource          ../Variables/desktop_app_login_logout_constants.robot

*** Keywords ***
#===============================================================#
#                            GIVEN
#===============================================================#
The Freelancer Desktop App Is Installed
    Directory "Application Installation Directory" Should Be Not Empty
    File "Desktop App Executable" Should Exist

User Is "${p_log_state}"
    User Should Be "${p_log_state}" Successfully
#===============================================================#
#                            WHEN
#===============================================================#
User Is In Freelancer Desktop App Login Page
    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Be "Visible" Before Timeout

User Submits Credentials Username "${p_username}" and Password "${p_password}" via "${p_login_form}"
    Run Keyword If    '${p_login_form}' == 'Login Page'
    ...    Run Keywords
    ...    Input "${p_username}" In "Login Username Email" "Textfield"    AND
    ...    Input "${p_password}" In "Login Password" "Text Field"    AND
    ...    Click Desktop App "Login" "Button"
    Run Keyword If    '${p_login_form}' == 'Facebook Login'
    ...    Run Keywords
    ...    Click Desktop App "Login With Facebook" "Button"    AND
    ...    Element "${FBLOGIN_LOGIN_PAGE}" Should Be "Visible" Before Timeout    AND
    ...    Input "${p_username}" In "FB Login Email Or Phone" "Textfield"    ANDs
    ...    Input "${p_password}" In "FB Login Password" "Textfield"    AND
    ...    Click Desktop App "FB Login Login" "Button"


User Logs Out From The Freelancer Desktop App
    Click Desktop App "Homepage Expand Context Menu" "Button"
    Element "${HOMEPAGE_CONTEXT_MENU}" Should Be "Visible" Before Timeout
    Click Desktop App "Homepage Logout" "Context Menu"
    Element "${HOMEPAGE_LOGOUT_CONFIRMATION_DIALOG}" Should Be "Visible" Before Timeout
    Click Desktop App "Homepage Logout Confirm" "Button"

#===============================================================#
#                            THEN
#===============================================================#
User Should Be "${p_log_state}" Successfully
    ${login_elements_visibility} =    Set Variable If
    ...    '${p_log_state}' == 'Logged In'    Not Visible
    ...    '${p_log_state}' == 'Logged Out'    Visible

    ${logout_elements_visibility} =    Set Variable If
    ...    '${p_log_state}' == 'Logged In'    Visible
    ...    '${p_log_state}' == 'Logged Out'    Not Visible

    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Be "${login_elements_visibility}" Before Timeout
    List Of Patterns "@{NEW_USER_HOMEPAGE_CORE_PATTERNS_LIST}" Should Be "${logout_elements_visibility}" Before Timeout

The "${p_alert}" Alert Should Be Displayed
    Element "${${p_alert}_ALERT}" Should Be "Visible" Before Timeout
#===============================================================#
#                    INTERNAL KEYWORDS
#===============================================================#

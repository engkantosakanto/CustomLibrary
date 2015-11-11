*** Settings ***
Resource          ../Variables/desktop_app_installation_constants.robot
Resource          ../Variables/desktop_app_login_logout_constants.robot

*** Keywords ***
#===============================================================#
#                            GIVEN
#===============================================================#
User Is "${p_logInState}"
    User Should Be "${p_logInState}" Successfully
#===============================================================#
#                            WHEN
#===============================================================#
User Is In Freelancer Desktop App Login Page
    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Be "Visible" Before Timeout

User Submits Credentials Username "${p_username}" and Password "${p_password}" Via "${p_loginForm}"
    Run Keyword If    '${p_loginForm}' == 'Login Page'
    ...    Run Keywords
    ...    Input "${p_username}" In "Login Username Email" "Textfield"
    ...    AND    Input "${p_password}" In "Login Password" "Text Field"
    ...    AND    Click Desktop App "Login" "Button"
    ...    ELSE    Run Keywords
    ...    Click Desktop App "Login With Facebook" "Button"
    ...    AND    Element "${FBLOGIN_LOGIN_PAGE}" Should Be "Visible" Before Timeout
    ...    AND    Input "${p_username}" In "FB Login Email Or Phone" "Textfield"
    ...    AND    Input "${p_password}" In "FB Login Password" "Textfield"
    ...    AND    Click Desktop App "FB Login Login" "Button"

User Logs Out From The Freelancer Desktop App
    Click Desktop App "Homepage Expand Context Menu" "Button"
    Element "${HOMEPAGE_CONTEXT_MENU}" Should Be "Visible" Before Timeout
    Click Desktop App "Homepage Logout" "Context Menu"
    Element "${HOMEPAGE_LOGOUT_CONFIRMATION_DIALOG}" Should Be "Visible" Before Timeout
    Click Desktop App "Homepage Logout Confirm" "Button"

User "${p_userAction}" Facebook Login
    Run Keyword If    '${p_userAction}' == 'Launches'    Run Keywords
    ...    Click Desktop App "Login With Facebook" "Button"
    ...    AND    Element "${FBLOGIN_LOGIN_PAGE}" Should Be "Visible" Before Timeout
    ...    ELSE IF    '${p_userAction}' == 'Cancels'
    ...    Click Desktop App "FB Login Cancel" "Button"

#===============================================================#
#                            THEN
#===============================================================#
User Should Be "${p_logInState}" Successfully
    ${t_loginElementsVisibility} =    Set Variable If
    ...    '${p_logInState}' == 'Logged In'    Not Visible    Visible

    ${t_logoutElementsVisibility} =    Set Variable If
    ...    '${p_logInState}' == 'Logged In'    Visible    Not Visible

    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Be "${t_loginElementsVisibility}" Before Timeout
    List Of Patterns "@{NEW_USER_HOMEPAGE_CORE_PATTERNS_LIST}" Should Be "${t_logoutElementsVisibility}" Before Timeout

The Update Checker Should Be Displayed
    List Of Patterns "@{UPDATE_CHECKER_CORE_PATTERNS_LIST}" Should Be "Visible" Before Timeout

The "${p_alert}" Alert Should Be Displayed
    Element "${${p_alert}_ALERT}" Should Be "Visible" Before Timeout

#===============================================================#
#                    INTERNAL KEYWORDS
#===============================================================#

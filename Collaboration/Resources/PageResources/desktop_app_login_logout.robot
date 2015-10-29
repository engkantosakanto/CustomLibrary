*** Settings ***
Resource          ../CommonResources/desktop_app_global_helper.robot
Resource          ../Variables/desktop_app_installation_constants.robot

*** Keywords ***
#===============================================================#
#                            GIVEN
#===============================================================#
The Desktop App Is Installed

#===============================================================#
#                            WHEN
#===============================================================#
User Is In Desktop App Login Page
    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Be Visible Before Timeout

User Submits Credentials Username "${p_username}" and Password "${p_password}" via "${p_login_form}"
    Run Keyword If    '${p_login_form}' == 'Login Page'    Run Keywords
    ...    User Inputs "${p_username} In "Login Username Email" "Textfield"
    ...    User Inputs "${p_password} In "Password" "Textfield"
    ...    User Clicks Desktop App "Login" "Button"
    ELIF    '${p_login_form}' == 'Facebook Login Page'    Run Keywords
    ...    User Clicks Desktop App "Login With Facebook" "Button"
    ...    Element "${FBLOGIN_LOGIN_PAGE}" Should Be Visible Before Timeout
    ...    User Inputs "${p_username} In "FB Login Email Or Phone" "Textfield"
    ...    User Inputs "${p_password} In "FB Login Password" "Textfield"
    ...    User Clicks Desktop App "FB Login Login" "Button"

User Logs Out From The Desktop App
    User Clicks Desktop App "Homepage Expand Context Menu" "Button"
    Element "${HOMEPAGE_CONTEXT_MENU}" Should Be Visible Before Timeout
    User Clicks Desktop App "Homepage Logout" "Context Menu"
    Element "${HOMEPAGE_LOGOUT_CONFIRMATION_DIALOG}" Should Be Visible Before Timeout
    User Clicks Desktop App "Homepage Logout Confirm" "Button"

#===============================================================#
#                            THEN
#===============================================================#
User Should Be Logged In Successfully
    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Not Be Visible Before Timeout
    List Of Patterns Should Be Visible    @{NEW_USER_HOMEPAGE_CORE_PATTERNS_LIST}

User Should Be Successfully Logged Out
    List Of Patterns Should Not Be Visible    @{NEW_USER_HOMEPAGE_CORE_PATTERNS_LIST}
    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Be Visible Before Timeout
#===============================================================#
#                    INTERNAL KEYWORDS
#===============================================================#

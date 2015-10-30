*** Settings ***
Resource          ../CommonResources/desktop_app_global_helper.robot
Resource          ../Variables/desktop_app_installation_constants.robot

*** Keywords ***
#===============================================================#
#                            GIVEN
#===============================================================#
The Freelancer Desktop App Is Installed
    Directory "Application Installation Directory" Should Not Be Empty
    File "Desktop App Executable" Should Exist

#===============================================================#
#                            WHEN
#===============================================================#
User Is In Desktop App Login Page
    Element "${DESKTOP_APP_LOGIN_PAGE}" Should Be Visible Before Timeout

User Submits Credentials Username "${p_username}" and Password "${p_password}" via "${p_login_form}"
    Run Keyword If    '${p_login_form}' == 'Login Page'    Run Keywords
    ...    Input "${p_username} In "Login Username Email" "Textfield"
    ...    Input "${p_password} In "Password" "Textfield"
    ...    Click Desktop App "Login" "Button"
    ELIF    '${p_login_form}' == 'Facebook Login Page'    Run Keywords
    ...    Click Desktop App "Login With Facebook" "Button"
    ...    Element "${FBLOGIN_LOGIN_PAGE}" Should Be Visible Before Timeout
    ...    Input "${p_username} In "FB Login Email Or Phone" "Textfield"
    ...    Input "${p_password} In "FB Login Password" "Textfield"
    ...    Click Desktop App "FB Login Login" "Button"

User Logs Out From The Desktop App
    Click Desktop App "Homepage Expand Context Menu" "Button"
    Element "${HOMEPAGE_CONTEXT_MENU}" Should Be Visible Before Timeout
    Click Desktop App "Homepage Logout" "Context Menu"
    Element "${HOMEPAGE_LOGOUT_CONFIRMATION_DIALOG}" Should Be Visible Before Timeout
    Click Desktop App "Homepage Logout Confirm" "Button"

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

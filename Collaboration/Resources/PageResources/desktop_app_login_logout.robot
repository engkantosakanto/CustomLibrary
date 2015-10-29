*** Settings ***
Resource          ../CommonResources/desktop_app_global_helper.robot
Resource          ../Variables/desktop_app_installation_constants.robot

*** Keywords ***
#===============================================================#
#                            GIVEN
#===============================================================#


#===============================================================#
#                            WHEN
#===============================================================#
User Is In Desktop App Login Page
    Run And Wait Until Keyword Succeeds
    ...    Assert Pattern Is Visible    ${DESKTOP_APP_LOGIN_PAGE}

User Submits Credentials Username "${p_username}" and Password "${p_password}" via "${p_login_form}"
    Run Keyword If    '${p_login_form}' == 'Login Page'
    ...    User Types String "${p_username} In "${p_element}" "${p_element_type}"


User Logs Out From The Desktop App

#===============================================================#
#                            THEN
#===============================================================#
User Should Be Logged In Successfully

User Should Be Successfully Logged Out

#===============================================================#
#                    INTERNAL KEYWORDS
#===============================================================#

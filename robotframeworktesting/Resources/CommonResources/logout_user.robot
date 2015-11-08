*** Settings ***
Resource          ../Variables/profile_navigation_constants.robot
Resource          ../Variables/navigation_header_constants.robot

*** Keywords ***
User Hovers On Profile And Clicks Logout
    Set Selenium Speed    .15
    Focus    ${USERNAME_LINK}
    :FOR    ${index}   IN RANGE    1    5
    \    Mouse Over    ${USERNAME_LINK}
    \    ${t_isLogoutClicked} =    Run Keyword And Return Status    Click Element    ${LOGOUT_BTN}
    \    Exit For Loop If    '${t_isLogoutClicked}' == 'True'

User Account Should Be Logged Out
    : FOR    ${index}    IN RANGE    0    20
    \    ${t_isVisible} =    Run Keyword And Return Status   Run And Wait Until Keyword Succeeds
    ...    Element Should Be Visible    ${LOGIN_SECTION}
    \    Exit For Loop If    '${t_isVisible}'=='True'
    Element Should Be Visible    ${LOGIN_SECTION}

Logout From Freelancer Website
    #Scroll To Top Of Page
    ${t_isUsernameVisible} =    Run Keyword And Return Status    Element Should Be Visible    ${USER_PROFILE_DIV}
    Run Keyword If    '${t_isUsernameVisible}' == 'False'     Go To    ${BASE_URL}/dashboard
    #User Hovers On Profile And Clicks Logout
    Go To    ${BASE_URL}${LOGOUT_URL_EXT}    #direct logout for successful teardowns, can still use other keywords for logout with elements

User Logs Out From Navigation Header
    ${t_isProfileFigureVisible} =    Run Keyword And Return Status
    ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGGED_IN_PROFILE_FIGURE}
    Run Keyword If    ${t_isProfileFigureVisible}    Click Element    ${HEADER_LOGGED_IN_PROFILE_FIGURE}
    ${t_isVisible} =    Run Keyword And Return Status
    ...    Wait Until Keyword Succeeds    ${TIMEOUT}   ${INTERVAL}    Element Should Be Visible    ${HEADER_SIDEBAR_LOGOUT}
    Run Keyword If    ${t_isVisible}    Click Element    ${HEADER_SIDEBAR_LOGOUT}


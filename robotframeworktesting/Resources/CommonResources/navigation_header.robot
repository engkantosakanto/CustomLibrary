*** Settings ***
Documentation    This resource contains keywords related to the freelancer page header
Resource    ../Variables/navigation_header_constants.robot

*** Keywords ***
#===========================================================#
#                         GIVEN
#===========================================================#

Page Header Is Visible
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_PRIMARY_HEADER}
    Element Should Be Visible    ${HEADER_FREELANCER_LOGO}

#===========================================================#
#                         WHEN
#===========================================================#

User Clicks Page Header Login
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGIN_BUTTON}
    Click Element    ${HEADER_LOGIN_BUTTON}

User Clicks Page Header Signup
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_SIGN_UP_BUTTON}
    Click Element    ${HEADER_SIGN_UP_BUTTON}

User Clicks Page Header Post A Project Button
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_POST_PROJECT_BUTTON}
    Click Element    ${HEADER_POST_PROJECT_BUTTON}

# User Clicks My Rewards
#     Navigate To Profile Side Bar
#     Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_SIDEBAR_MY_REWARDS}
#     Click Element    ${HEADER_SIDEBAR_MY_REWARDS}

User Clicks Edit Settings
    Navigate To Profile Side Bar
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_SIDEBAR_SETTINGS}
    Click Element    ${HEADER_SIDEBAR_SETTINGS}

User Clicks Invite Friends
    Navigate To Profile Side Bar
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_SIDEBAR_INVITE_FRIENDS}
    Click Element    ${HEADER_SIDEBAR_INVITE_FRIENDS}

User Clicks How It Works
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGGED_OUT_NAV_ITEM_HOW_IT_WORKS}
    Click Element    ${HEADER_LOGGED_OUT_NAV_ITEM_HOW_IT_WORKS}

User Clicks Get Support
    Navigate To Profile Side Bar
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_SIDEBAR_HELP}
    Click Element    ${HEADER_SIDEBAR_HELP}

User Clicks On Navigation Header [LOGIN] Button
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGIN_BUTTON}
    Focus Element    ${HEADER_LOGIN_BUTTON}
    Click Element    ${HEADER_LOGIN_BUTTON}

User Clicks Profile In Sidebar
    Navigate To Profile Side Bar
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Element Should Be Visible    ${HEADER_SIDEBAR_PROFILE}
    Click Element    ${HEADER_SIDEBAR_PROFILE}

User Clicks On Browse Directory
    Mouse Over Hire Freelancers
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Element Should Be Visible    ${HEADER_SUB_NAV_BROWSE_DIRECTORY}
    Click Element    ${HEADER_SUB_NAV_BROWSE_DIRECTORY}

User Clicks Notification Tab In Header
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HEADER_ACTION_NOTIFY_REALTIME_ICON}
    Click Element    ${HEADER_ACTION_NOTIFY_REALTIME_ICON}

User Clicks Messages Tab In Header
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HEADER_ACTION_MESSAGES_TAB}
    ${t_abTestHeader} =    Check If Header Is In ABTest
    Run Keyword If    ${t_abTestHeader}    Mouse Over    ${HEADER_ACTION_MESSAGES_TAB}
    ...    ELSE    Click Element    ${HEADER_ACTION_NOTIFY_MESSAGE_ICON}

User Navigates To Inbox Page
    User Clicks Messages Tab In Header
    Mouse Down    ${HEADER_ACTION_NOTIFY_SEE_ALL_MESSAGES_LINK}
    Mouse Up    ${HEADER_ACTION_NOTIFY_SEE_ALL_MESSAGES_LINK}
    inbox_page.User Is In Inbox Page

User Clicks First Message In Messages Tab
    ${t_isMessageListVisible} =    Run Keyword And Return Status
    ...    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HEADER_ACTION_NOTIFY_MESSAGE_LIST}
    Run Keyword Unless    ${t_isMessageListVisible}    User Clicks Messages Tab In Header
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HEADER_ACTION_NOTIFY_FIRST_MESSAGE}
    Click Element    ${HEADER_ACTION_NOTIFY_FIRST_MESSAGE}

#===========================================================#
#                         THEN
#===========================================================#

Logged Out Navigation Header Should Be Loaded Successfully
    List Of Elements Should Be Visible    @{HEADER_LIST_OF_ELEMENTS}

Invite To Project Notification In Header Should Be Displayed
    [Arguments]    ${p_projName}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HEADER_ACTION_NOTIFICATION_POPOVER}
    Run And Wait Until Keyword Succeeds    Element Should Contain    ${HEADER_ACTION_FIRST_NOTIF_TEXT}    ${p_projName}

"${HEADER_TAB}" Notification Dot Alert In Header Should Be Displayed
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HEADER_ACTION_NOTIFY_${HEADER_TAB}_ICON}${HEADER_NOTIFICATION_DOT_ALERT}

#==============================================================#
#                       INTERNAL KEYWORDS                      #
#==============================================================#
Mouse Over Hire Freelancers
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_NAV_ITEM_HIRE_FREELANCERS}
    Focus    ${HEADER_NAV_ITEM_HIRE_FREELANCERS}
    Mouse Over    ${HEADER_NAV_ITEM_HIRE_FREELANCERS}

Mouse Over Logged In Work
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGGED_IN_NAV_ITEM_WORK}
    Mouse Over    ${HEADER_LOGGED_IN_NAV_ITEM_WORK}

Mouse Over Logged Out Work
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGGED_OUT_NAV_ITEM_WORK}
    Mouse Over    ${HEADER_LOGGED_OUT_NAV_ITEM_WORK}

Mouse Over My Projects
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGGED_IN_NAV_ITEM_MY_PROJECTS}
    Mouse Over    ${HEADER_LOGGED_IN_NAV_ITEM_MY_PROJECTS}

Mouse Over Finances
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGGED_IN_NAV_ITEM_FINANCES}
    Mouse Over    ${HEADER_LOGGED_IN_NAV_ITEM_FINANCES}

Navigate To Profile Side Bar
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${HEADER_LOGGED_IN_PROFILE_FIGURE}
    Click Element    ${HEADER_LOGGED_IN_PROFILE_FIGURE}

Check If Header Is In ABTest
    ${r_abTestHeader} =    Run Keyword And Return Status
    ...    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HEADER_PRIMARY_FL_HEADER}
    [Return]    ${r_abTestHeader}
*** Settings ***
Resource          ../Variables/login_users_constants.robot

*** Keywords ***
#============================================#
#                     GIVEN
#============================================#
User Is In Default Login Page
    ${t_isLoginPage} =    Run Keyword And Return Status    Location Should Contain    ${DEFAULT_LOGIN_URL}
    Run Keyword Unless    ${t_isLoginPage}    Go To    ${BASE_URL}${DEFAULT_LOGIN_URL}

User Is In Modal "${ACCESS_MODE}"
    ${t_modal} =    Set Variable If    '${ACCESS_MODE}' == 'Signup'    ${SIGNUP_MODAL_SIGNUP_BUTTON}    ${MODAL_LOGIN_LINK}
    ${t_isModalVisible} =    Run Keyword And Return Status
    ...    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${MODAL_FORM}
    Run Keyword Unless    ${t_isModalVisible}    Click Element    ${t_modal}

User Is In Login Modal
    ${t_isLoginModal} =    Run Keyword And Return Status    Element Text Should Be    ${MODAL_SWITCH_LOGIN_BUTTON}    Sign Up!
    Run Keyword Unless    ${t_isLoginModal}    Focus And Click Element    ${MODAL_SWITCH_LOGIN_BUTTON}

#=============================================#
#                      WHEN
#=============================================#
Valid Credentials Are Submitted Through "${ORIGIN_PAGE}" Login
    [Documentation]    This keyword is for input of valid login credentials through differenct login modes
    ...    such as Home Page, Modal and Default
    ...    Requires ${tc_Username} to be setup first before calling this
    ${t_loginElement} =    Set Variable If
    ...    '${ORIGIN_PAGE}' == 'Home Page'    ${PINT_LOGIN_LINK}
    ...    '${ORIGIN_PAGE}' == 'Login Modal'    ${PINT_LOGIN_LINK}
    ...    '${ORIGIN_PAGE}' == 'Login Page'    ${DF_LOGIN_DIV}
    Run Keyword If    '${ORIGIN_PAGE}' == 'Login Page'    Run Keywords    Go To URL And Bypass AB Test
    ...    AND    Default Login    ${tc_USERNAME}    ${PASSWORD}
    ...    ELSE    Run Keywords
    ...    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${t_loginElement}
    ...    AND    Click Element    ${t_loginElement}
    Run Keyword If    '${ORIGIN_PAGE}' == 'Home Page'
    ...    Home Page Login    ${tc_USERNAME}    ${PASSWORD}
    ...    ELSE IF    '${ORIGIN_PAGE}' == 'Login Modal'    Modal Login    ${tc_USERNAME}    ${PASSWORD}

User Clicks Home Page Login
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${PINT_LOGIN_LINK}
    Click Element    ${PINT_LOGIN_LINK}

User Logs In As New User
    [Arguments]    ${p_email}    ${p_username}    ${p_password}    ${p_confirmPasswod}    ${p_clickElementToLogin}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${USER_TYPE_NEW_RBTN}
    Click Element    ${USER_TYPE_NEW_RBTN}
    Input Text On Focused Field    ${NEW_EMAIL_FIELD}    ${p_email}    ${NEW_USRNAME_FIELD}
    Input Text    ${NEW_USRNAME_FIELD}    ${empty}
    Input Text On Focused Field    ${NEW_USRNAME_FIELD}    ${p_username}    ${NEW_PASSWORD_FIELD}
    Input Text On Focused Field    ${NEW_PASSWORD_FIELD}    ${p_password}    ${NEW_CONFIRM_PASSWORD_FIELD}
    Input Text On Focused Field    ${NEW_CONFIRM_PASSWORD_FIELD}    ${p_confirmPasswod}    ${p_clickElementToLogin}

User Logs In As Returning User
    [Arguments]    ${p_username}    ${p_password}    ${p_elementToClick}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${USER_TYPE_RETURNING_RBTN}
    Click Element    ${USER_TYPE_RETURNING_RBTN}
    Input Text On Focused Field    ${USERNAME_FIELD}    ${p_username}    ${PASSWORD_FIELD}
    Input Text On Focused Field    ${PASSWORD_FIELD}    ${p_password}    ${p_elementToClick}
    Repeat Login As Returning User    ${p_username}    ${PASSWORD_FIELD}    ${p_elementToClick}

User Inputs And Submits Valid Login Credentials In Modal Form    #This for PVP logged out only
    [Arguments]    ${p_username}    ${p_password}
    ${t_isVisibleLogin}=    Run Keyword And Return Status    Element Text Should Be    ${MODAL_SWITCH_LOGIN_BUTTON}    Log In
    Run Keyword If    ${t_isVisibleLogin}    Focus And Click Element    ${MODAL_SWITCH_LOGIN_BUTTON}
    ${t_isVisibleUsernameField}=    Run Keyword And Return Status
    ...    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${MODAL_USERNAME_FIELD}
    Input Text    ${MODAL_USERNAME_FIELD}    ${p_username}
    Input Text    ${MODAL_PASSWORD_FIELD}    ${p_password}
    Click Element    ${MODAL_LOGIN_BTN}

User Clicks [Login with Facebook] On Login Form
    ${t_isLoginPage}=    Run Keyword And Return Status    Location Should Contain    login
    ${t_isLoginModal}=    Run Keyword And Return Status    Element Should Be Visible    ${MODAL_FORM}
    Run Keyword If    ${t_isLoginModal}    Click Login FB Button Until FB Window Is Visible    ${MODAL_FB_LOGIN_BTN}
    ...    ELSE IF    ${t_isLoginPage}    Click Login FB Button Until FB Window Is Visible    ${LOGIN_PAGE_FACEBOOK_LOGIN_BUTTON}
    ...    ELSE    Click Login FB Button Until FB Window Is Visible    ${PINT_FB_LOGIN_BTN}

User Submits Valid Facebook Login Credentials
    [Arguments]    ${p_fbEmail}    ${p_password}
    Input Text    ${FB_EMAIL_FIELD}    ${p_fbEmail}
    Input Text    ${FB_PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${FB_LOGIN_BTN}
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Select Window

#==============================================#
#      WHEN: FOR LOGIN SPECIFIC TEST CASES
#==============================================#
Valid Credentials Are Submitted Through Home Page Login
    [Arguments]    ${p_username}    ${p_password}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${PINT_LOGIN_LINK}
    Click Element    ${PINT_LOGIN_LINK}
    Home Page Login    ${p_username}    ${p_password}

Valid Credentials Are Submitted Through Modal Login
    [Arguments]    ${p_username}    ${p_password}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${MODAL_LOGIN_LINK}
    Click Element    ${MODAL_LOGIN_LINK}
    Modal Login    ${p_username}    ${p_password}

Valid Credentials Are Submitted Through Default Login
    [Arguments]    ${p_username}    ${p_password}
    Go To URL And Bypass AB Test
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${DF_LOGIN_DIV}
    Default Login    ${p_username}    ${p_password}

#==============================================#
#                     THEN
#==============================================#
Freelancer Logo Should Be Displayed
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${FIND_FREELANCER_LOGO}

User Should Have Successfully Logged In
    [Arguments]    ${p_username}
    ${t_isLive} =    Run Keyword And Return Status    Should Be Equal As Strings    ${BASE_URL}    https://www.freelancer.com
    Run Keyword If    ${t_isLive}    Wait Until Keyword Succeeds    60s    2s    Browser Cookie Should Not Be Empty    ${LOGIN_GETUSERID_COOKIE}
    ...    ELSE    Wait Until Keyword Succeeds    60s    2s    Browser Cookie Should Not Be Empty    ${LOGIN_GETUSERID_COOKIE_FLN}
    Capture Page Screenshot
    Language Verification

Validate User Select Container Is Visible
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${USER_SELECT_CNTR}

Guest User Should See User Selector Container
    Wait Until Page Contains Element    ${USER_TYPE_NEW_RBTN}
    List Of Elements Should Be Visible    ${USER_TYPE_RETURNING_RBTN},${NEW_EMAIL_FIELD},${NEW_USRNAME_FIELD},${NEW_PASSWORD_FIELD},${NEW_CONFIRM_PASSWORD_FIELD}

Login Modal Should Be Displayed
    List Of Elements Should Be Visible    ${MODAL_FORM},${MODAL_USERNAME_FIELD},${MODAL_PASSWORD_FIELD},${MODAL_LOGIN_BTN}

Account Suspended Page Has Loaded Successfully
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${LOGIN_HOMEPAGE_SUSPENDED_ERROR_MSG_CNTR}
    Element Text Should Be    ${LOGIN_HOMEPAGE_SUSPENDED_ERROR_MSG_CNTR}    ${LOGIN_HOMEPAGE_SUSPENDED_ERROR_MSG_TEXT}

Account Suspended Login Error Message Has Showed Successfully
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${LOGIN_SUSPENDED_ERROR_MSG_CNTR}
    Element Text Should Be    ${LOGIN_SUSPENDED_ERROR_MSG_CNTR}    ${LOGIN_SUSPENDED_ERROR_MSG_TEXT}

Account Close Login Error Message Has Showed Successfully
    ${t_isLoginPage}=    Run Keyword And Return Status    Location Should Contain    login
    ${t_isLoginModal}=    Run Keyword And Return Status    Element Should Be Visible    ${MODAL_FORM}
    Run Keyword If    ${t_isLoginModal}
    ...    Run And Wait Until Keyword Succeeds    Element Should Contain    ${MODAL_LOGIN_ERROR_CNTR}     ${MODAL_CLOSED_ERROR_MSG_TEXT}
    ...    ELSE IF    ${t_isLoginPage}
    ...    Run And Wait Until Keyword Succeeds    Element Should Contain    ${LOGIN_CLOSED_ERROR_MSG_CNTR}     ${LOGIN_CLOSED_ERROR_MSG_TEXT}
    ...    ELSE
    ...    Run And Wait Until Keyword Succeeds    Element Should Contain    ${LOGIN_INCORRECT_ERROR_MSG_CNTR}     ${LOGIN_INCORRECT_ERROR_MSG_TEXT}

Facebook Login Window Has Popup Successfully
    Run And Wait Until Keyword Succeeds    Select Window    ${FB_WINDOW_NAME}

Private Error Message Should Be Displayed
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${DF_PRIVATE_ERROR_MESSAGE}

#=====================================================================#
#                           INTERNAL KEYWORDS
#=====================================================================#
Home Page Login
    [Arguments]    ${p_username}    ${p_password}
    Set Selenium Speed    2
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${PINT_LOGIN_FORM}
    Input Text    ${PINT_USERNAME_FIELD}    ${p_username}
    Input Text    ${PINT_PASSWORD_FIELD}    ${p_password}
    Click Element    ${PINT_LOGIN_BTN}
    Set Selenium Speed    .5

Modal Login
    [Arguments]    ${p_username}    ${p_password}
    Set Selenium Speed    2
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${MODAL_LOGIN_DIV}
    Input Text    ${MODAL_USERNAME_FIELD}    ${p_username}
    Input Text    ${MODAL_PASSWORD_FIELD}    ${p_password}
    Click Element    ${MODAL_LOGIN_BTN}
    Set Selenium Speed    .5

Default Login
    [Arguments]    ${p_username}    ${p_password}
    Set Selenium Speed    2
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${DF_LOGIN_DIV}
    Input Text    ${DF_USERNAME_FIELD}    ${p_username}
    Input Text    ${DF_PASSWORD_FIELD}    ${p_password}
    Click Element    ${DF_LOGIN_BTN}
    Set Selenium Speed    .5

User Should Be Redirected To Login Page
    Go To URL And Bypass AB Test
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${DF_LOGIN_DIV}
    Location Should Contain    ${DEFAULT_LOGIN_URL}

Repeat Login As Returning User
    [Arguments]    ${p_username}    ${p_passwordField}    ${p_elementToClick}
    Register Keyword To Run On Failure    Nothing
    : FOR    ${index}    IN RANGE    1    200
    \    ${t_isLoggedIn} =    Run Keyword And Return Status    User Should Have Successfully Logged In    ${p_username}
    \    Run Keyword Unless    ${t_isLoggedIn}    Repeat Login    ${p_passwordField}    ${p_elementToClick}
    \    Exit For Loop If    ${t_isLoggedIn}
    Register Keyword To Run On Failure    Capture Page Screenshot

Click Login FB Button Until FB Window Is Visible
    [Arguments]    ${p_fbButton}
    :FOR    ${index}    IN RANGE    5
    \    ${t_isLoginModalVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${MODAL_FORM}
    \    Run Keyword Unless    ${t_isLoginModalVisible}    Click Login Button Until Login Modal Is Visible
    \    Focus And Click Element    ${p_fbButton}
    \    ${t_isFbWindowVisibleAndSelected}=    Run Keyword And Return Status    Run And Wait Until Keyword Succeeds    Select Window    ${FB_WINDOW_NAME}
    \    Exit For Loop If    ${t_isFbWindowVisibleAndSelected}
    \    Capture Page Screenshot
    \    Reload Page

Click Login Button Until Login Modal Is Visible
    :FOR    ${index}    IN RANGE    5
    \    ${t_isNavHeadrer}=    Run Keyword And Return Status    Should Contain    ${SUITE NAME}    NavHeaderTest
    \    ${t_isApplyForThisJob}=    Run Keyword And Return Status    Should Contain    ${SUITE NAME}    ApplyForThisJobButtonTest
    \    ${t_isSignUpNow}=    Run Keyword And Return Status    Should Contain    ${SUITE NAME}    SignUpNowButtonTest
    \    Run Keyword If    ${t_isNavHeadrer}    User Clicks On Navigation Header [LOGIN] Button
    \    Run Keyword If    ${t_isApplyForThisJob}    User Clicks On "APPLY_FOR_THIS_JOB" Button In PVP Logged Out
    \    Run Keyword If    ${t_isSignUpNow}    Run Keywords
    ...    User Clicks On "SIGN_UP_NOW" Button In PVP Logged Out    AND    User Clicks On [Log In] Link On Sign Up Modal
    \    ${t_isLoginModalVisible}=    Run Keyword And Return Status    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${MODAL_FORM}
    \    Exit For Loop If    ${t_isLoginModalVisible}
    \    Capture Page Screenshot

Language Verification
    "Hide" Newsfeed Container
    ${t_isEnglishLanguage} =    Run Keyword And Return Status
    ...    Element Text Should Be    ${FOOTER_CHOSEN_LANGUAGE}    ${FOOTER_DEFAULT_LANGUAGE}
    Run Keyword If   '${LANGUAGE}'=='English' and '${t_isEnglishLanguage}'=='False'
    ...    Set Language    ${FOOTER_DEFAULT_LANGUAGE}
    ...    ELSE IF    '${LANGUAGE}'!='English'
    ...    Set Language    ${LANGUAGE}
    "Show" Newsfeed Container

#=====================================================================#
#                       GLOBAL LOGIN SUITE SETUP
#=====================================================================#
Setup Login On Freelancer Home Page
    [Documentation]    This keyword is used for launch browser setup only. Take note that the username and password in the test suite should be the same with the expected argument
    Valid Credentials Are Submitted Through Home Page Login    ${USERNAME}    ${PASSWORD}
    User Should Have Successfully Logged In    ${USERNAME}
    Capture Page Screenshot

Login Setup From Default Login Page
    Launch Browser Setup    ${DEFAULT_LOGIN_URL}    ${BROWSER}    ${ALIAS1}    ${NATIVE_EVENTS_FALSE}
    User Is In Default Login Page
    Valid Credentials Are Submitted Through Default Login    ${USERNAME}    ${PASSWORD}
    User Should Have Successfully Logged In    ${USERNAME}
    Capture Page Screenshot

Freelancer And Employer Login Setup From Default Login Page
    [Documentation]    Use the Login Setup From Default Login Page keyword and overides the variables ${ALIAS1} and ${USERNAME} by it's arguments
    [Arguments]    ${p_firstUser}    ${p_secondUser}
    Set Suite Variable    ${ALIAS1}    ${p_firstUser}
    Set Suite Variable    ${USERNAME}    ${p_firstUser}
    Login Setup From Default Login Page
    Set Suite Variable    ${ALIAS1}    ${p_secondUser}
    Set Suite Variable    ${USERNAME}    ${p_secondUser}
    Login Setup From Default Login Page

Login Via "${LOGIN_ENTRY_POINT}"
    [Documentation]    This keyword is used for login via home page where the value ${tc_USERNAME} is replaced when the test name contains value from @{EMPLOYERS_LIST}. The testsuite calling this keyword should have ${employerUsername} and ${freelancerUsername} in the variables table.
    Valid Credentials Are Submitted Through "${LOGIN_ENTRY_POINT}" Login
    User Should Have Successfully Logged In    ${tc_USERNAME}
    Capture Page Screenshot
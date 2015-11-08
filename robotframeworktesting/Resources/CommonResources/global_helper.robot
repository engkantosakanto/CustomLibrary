*** Settings ***
Library           String
Library           DateTime
Resource          ../Variables/global_constants.robot

*** Keywords ***
Generate Date Time With Milliseconds
    [Documentation]    This keyword generates date time with milliseconds
    ...    removing all special characters from the string
    ${t_dateTime} =    Get Current Date    result_format=timestamp
    ${t_removeSpecialChar} =    Remove String    ${t_dateTime}    :    -    .    ${SPACE}
    ${t_removeSpecialChar} =    Get Substring    ${t_removeSpecialChar}    2    17
    ${t_convertedDateTime} =    Set Variable    ${t_removeSpecialChar}
    [Return]    ${t_convertedDateTime}

Setup Project Title
    [Documentation]    This keyword generates project title in MD5 with milliseconds
    ...     and random number to avoid duplicate project name
    ${t_dateTimeMilliseconds} =    Generate Date Time With Milliseconds
    ${t_randomNumber} =    Generate Random Number
    ${t_projectTitle}=    Catenate    ${MD5} ${t_dateTimeMilliseconds} ${t_randomNumber}
    ${t_projectName}=    Set Variable If    '${BASE_URL}'=='${MOBILE_BASE_URL}'
    ...    ${t_projectTitle} Mobile     ${t_projectTitle} Web
    Set Global Variable    ${g_PROJECT_TITLE_MD5}    ${t_projectName} ${SUITE NAME}
    Set Global Variable    ${g_TIME}    ${t_dateTimeMilliseconds}

Setup Dynamic Test User
    [Documentation]    This keyword generates dynamic test user with milliseconds
    ...     and random number to avoid duplicate or already registered email
    ${t_dateTimeMilliseconds} =    Generate Date Time With Milliseconds
    ${t_randomNumber} =    Generate Random Number
    ${t_testUsername} =    Catenate    T${t_dateTimeMilliseconds}
    Set Global Variable    ${g_TEST_USERNAME}    ${t_testUsername}
    Set Global Variable    ${g_NEW_EMAIL}    testuser+${t_dateTimeMilliseconds}${t_randomNumber}@freelancer.com

Get Project Url
    [Documentation]    This keyword gets the project url for switching of browsers
    ${t_projectUrl} =    Get location
    Set Global Variable    ${g_PROJECT_URL}    ${t_projectUrl}

User Has Selected Browser
    [Documentation]    This keyword is for switching browser window.
    ...    It accepts ALIAS as an argument.
    [Arguments]    ${p_browser}
    Switch Browser    ${p_browser}

User Reloads Page
    [Documentation]    Reloads Page
    Reload Page

User Goes To Page
    [Documentation]    Keyword that navigates to a certain page. Accepts a url as an argument.
    [Arguments]    ${p_URL_EXT}
    ${url}=    Run Keyword And Return Status    Should Contain    ${p_URL_EXT}    ${BASE_URL}
    Run Keyword If    '${url}'=='False'    Verify Hostname Contains Http    ${p_URL_EXT}

Hide Element From Website
    [Documentation]    This keyword hides elements that usually overlaps
    ...    with the buttons/links that are being clicked during test execution
    ${t_elementToHideList} =    Create List
    ...    ${WHITE_HEADER}    ${LOGOOUT_WHITE_HEADER}
    ...    ${TOAST_CONTAINER}    ${STICKY_BAR}
    ...    ${CONTACT_LIST_FORM}    ${CHAT_BOX}
    ...    ${POST_SITE_HEADER}    ${CHAT_WINDOW}
    : FOR    ${element}    IN    @{t_elementToHideList}
    \    ${t_element} =    Remove Element Locator Type    ${element}
    \    Execute Javascript    jQuery('${t_element}').hide();

Hide Specific Element
    [Arguments]    ${p_element}
    ${t_element} =    Remove Element Locator Type    ${p_element}
    Execute Javascript    jQuery('${t_element}').hide();

Get Browser Instance Window Identifier
    [Documentation]    Gets the window title of the focused window
    ${t_getWindowTitle} =    Get Window Titles
    Execute Javascript    function setWindowFocus() {var window = document.title("${t_getWindowTitle}")}; window.focus();

Get Current Month In Word
    [Arguments]    ${isAbbr}=1
    [Documentation]    Gets the current month and returns in word format
    ...
    ...    Argument:
    ...
    ...    isAbbr = 1 by default returns the abbrevated word (e.g. Feb)
    ...
    ...    isAbbr = 0 returns the whole word (e.g. February)
    ${mo}=    Get Time    month
    ${mo_dic}=    Run Keyword If    ${isAbbr} == 1
    ...    Create Dictionary
    ...    01=Jan    02=Feb    03=Mar    04=Apr
    ...    05=May    06=Jun    07=Jul    08=Aug
    ...    09=Sep    10=Oct    11=Nov    12=Dec
    ...    ELSE    Create Dictionary
    ...    01=January    02=February    03=March    04=April
    ...    05=May    06=June    07=July    08=August
    ...    09=September    10=October    11=November    12=December
    ${mo_in_word}=    Get From Dictionary    ${mo_dic}    ${mo}
    [Return]    ${mo_in_word}

Browser Cookie Should Not Be Empty
    [Documentation]    This keyword is used for checking if the cookie is not empty after loggin in
    [Arguments]    ${p_cookieName}
    ${t_cookieValue} =    Execute Javascript    return window.getCookie("${p_cookieName}");
    ${t_isNotEmpty} =    Run Keyword and Return Status    Should Not Be Empty    ${t_cookieValue}
    Run Keyword Unless    ${t_isNotEmpty}    Capture Page Screenshot
    Should Be True    ${t_isNotEmpty}

Setup Translation Text
    [Documentation]    Generates global translation text with milliseconds
    ${t_dateTimeMilliseconds} =    Generate Date Time With Milliseconds
    Set Global Variable    ${g_E2E_TRANSLATION_TEXT}   E2E ${t_dateTimeMilliseconds}
    Set Global Variable    ${g_FUNCTIONALITY_TRANSLATION_TEXT}   Functionality ${t_dateTimeMilliseconds}
    Set Global Variable    ${g_MODAL_REPORT_TEXT}   Modal Report ${t_dateTimeMilliseconds}
    Set Global Variable    ${g_E2E_PANEL_TEXT}   Panel ${t_dateTimeMilliseconds}

Run And Wait Until Keyword Succeeds
    [Documentation]    This keyword is used in waiting for an element to be visible within the global timeout and interval
   [Arguments]    ${p_keyword}    ${p_arg1}    ${p_arg2}=No Operation
   ${isEqual}=  Run Keyword And Return Status    Should Be Equal As Strings    ${p_arg2}    No Operation
   # Run Keyword If     '${p_arg2}' == 'No Operation'
   Run Keyword If    ${isEqual}
   ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    ${p_keyword}    ${p_arg1}
   ...    ELSE
   ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    ${p_keyword}    ${p_arg1}    ${p_arg2}

Input Text On Focused Field
    [Documentation]  This user Keyword will execute when field are having problems on inputting.
    ...   ${p_locator}=  input field
    ...   ${p_inputText}= input text
    ...   ${p_targetlLocatorForTab}=  next element/locator that will trigger the tab key
    [Arguments]    ${p_locator}    ${p_inputText}    ${p_targetlLocatorForTab}
    Focus Element    ${p_locator}
    Input Text    ${p_locator}    ${p_inputText}
    Run Keyword And Ignore Error    Press Key    ${p_targetlLocatorForTab}    \\09
    Run Keyword And Ignore Error    Blur Element    ${p_locator}

Scroll To Page Location
    [Documentation]    This keyword is used for scrolling the window to a specified x and y offset.
    [Arguments]    ${p_xAxis}    ${p_yAxis}
    Execute Javascript    window.scrollTo(${p_xAxis},${p_yAxis});

Go To URL And Bypass AB Test
    [Documentation]  This user keyword will by pass the URL with AB test URL flags with t=
    ${t_AbtestUrl}=    Get Location
    ${t_removeABParam}=  Remove String Using Regexp  ${t_AbtestUrl}   t=.&
    Go To  ${t_removeABParam}

Input Text By Press Key Each Character
    [Documentation]    Gets the current month and returns in word format
    ...    Argument:
    ...    ${p_locator} is the input text field element locator
    ...    ${p_characters} is the input text string
    [Arguments]    ${p_locator}    ${p_characters}
    Set Selenium Speed    .1
    @{t_characters}=    Split String To Characters   ${p_characters}
    :FOR   ${t_char}    IN    @{t_characters}
    \    Press Key    ${p_locator}   ${t_char}
    Set Default Selenium Speed

Wait Until Element Is Not Visible
    [Documentation]    This keyword is used to wait for an element to become not visible
    [Arguments]    ${t_element}
    Run And Wait Until Keyword Succeeds    Element Should Not Be Visible    ${t_element}

Get Element Color
    [Documentation]    This keyword is used to assert the color of an element.
    ...    It accepts the locator and color attribute as arguments.
    [Arguments]    ${p_element}    ${p_colorAttribute}
    ${t_element}=    Remove Element Locator Type    ${p_element}
    ${r_fieldColor} =    Execute Javascript   return jQuery('${t_element}').css("${p_colorAttribute}");
    [Return]    ${r_fieldColor}

User Inputs Location
    [Documentation]    This keyword covers inputting of location in Skills Page, Settings Page and Post Project Page
    [Arguments]    ${p_location}
    ${t_isSettingsPage} =    Run Keyword And Return Status
    ...    Should Contain    ${TESTNAME}    Settings Page
    ${t_isPostProjectPage} =    Run Keyword And Return Status
    ...    Should Contain    ${TESTNAME}    Project
    Run Keyword If    ${t_isSettingsPage}
    ...    Set Test Variable    ${SKILLS_PAGE_LOCATION_FIELD}    ${SETTINGS_LOCATION_FIELD}
    ...    ELSE IF    ${t_isPostProjectPage}
    ...    Run Keywords    Set Test Variable    ${SKILLS_PAGE_LOCATION_FIELD}    ${POST_PROJECT_LOCATION_FIELD}
    ...    AND    Click Element     ${POST_PROJECT_LOCALLY_RADIO_BUTTON}
    Input Location    ${p_location}

Get User Current Fund Balance From Dashboard
    [Documentation]    Gets user's balance and returns value without currency symbol and comma.
    Go To    ${BASE_URL}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${BALANCE_BEFORE_DEPOSIT}
    ${t_fund}=    Get Text    ${BALANCE_BEFORE_DEPOSIT}
    ${t_fund}=    Get Substring    ${t_fund}    1    #remove the currency
    ${t_fund}=    Replace String    ${t_fund}    ,    ${EMPTY}    #remove the comma
    [Return]    ${t_fund}

Focus And Click Element
    [Documentation]    This keyword focus on an element before it clicks on it.
    [Arguments]    ${p_element}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${p_element}
    Focus    ${p_element}
    Click Element    ${p_element}

List Of Elements Should Be Visible
    [Documentation]    This keyword accepts pre-created list of elements or a number of elements separated by a comma as an argument and
    ...    iterates to check if the element is visible
    ...    Argument Example:
    ...    pre-created list of elements: @{t_listOfElements}
    ...    elements separated by comma: ${ELEMENT_1},${ELEMENT_2},${ELEMENT_3},${ELEMENT_4},${ELEMENT_5},${ELEMENT_6},${ELEMENT_7}
    [Arguments]    @{p_elements}
    ${t_isCount} =    Get Length    ${p_elements}
    @{t_createdListOfElements} =    Run Keyword If    ${t_isCount} == 1    Split String    @{p_elements}    ,
    Run Keyword If    ${t_isCount} == 1    Set Test Variable    @{t_listOfElements}    @{t_createdListOfElements}
    ...    ELSE    Set Test Variable    @{t_listOfElements}    @{p_elements}
    : FOR    ${element}    IN    @{t_listOfElements}
    \    Run And Wait Until Keyword Succeeds   Element Should Be Visible    ${element}

List Of Elements Should Not Be Visible
    [Documentation]    This keyword accepts pre-created list of elements or a number of elements separated by a comma as an argument and
    ...    iterates to check if the element is not visible
    ...    Argument Example:
    ...    pre-created list of elements: @{t_listOfElements}
    ...    elements separated by comma: ${ELEMENT_1},${ELEMENT_2},${ELEMENT_3},${ELEMENT_4},${ELEMENT_5},${ELEMENT_6},${ELEMENT_7}
    [Arguments]    @{p_elements}
    ${t_isCount} =    Get Length    ${p_elements}
    @{t_createdListOfElements} =    Run Keyword If    ${t_isCount} == 1    Split String    @{p_elements}    ,
    Run Keyword If    ${t_isCount} == 1    Set Test Variable    @{t_listOfElements}    @{t_createdListOfElements}
    ...    ELSE    Set Test Variable    @{t_listOfElements}    @{p_elements}
    : FOR    ${element}    IN    @{t_listOfElements}
    \    Run And Wait Until Keyword Succeeds   Element Should Not Be Visible    ${element}

Upload A File
    [Arguments]    ${p_uploadContainer}    ${p_fileName}
    ${new_FileDirectory}=    Replace String   ${CURDIR}   CommonResources    TestData${/}Images${/}
    Log   ${new_FileDirectory}
    Choose File    ${p_uploadContainer}    ${new_FileDirectory}${p_fileName}

#==========================================================#
#                          THEN
#==========================================================#
New Window Should Display "${TARGET_PAGE}"
    Run And Wait Until Keyword Succeeds    Select Window    url=${tc_pageUrl}
    Run And Wait Until Keyword Succeeds    Location Should Contain    ${tc_pageUrl}

#==========================================================#
#                     INTERNAL KEYWORDS
#==========================================================#
Verify Hostname Contains Http
    [Documentation]    Verifies if the hostname contains http
    [Arguments]    ${p_url}
    ${index}=    Run Keyword And Return Status    Should Contain    ${p_url}    http
    Run Keyword If    '${index}'=='True'    Go To    ${p_url}    ELSE    Go To    ${BASE_URL}${p_url}

Repeat Login
    [Documentation]    Try catch for login.
    [Arguments]    ${p_passwordField}    ${p_elementToClick}
    ${t_isVisible} =    Run Keyword And Return Status    Element Should Be Visible    ${p_passwordField}
    Run Keyword If    ${t_isVisible}    Click Element    ${p_passwordField}
    Click Element    ${p_elementToClick}

Focus Element
    [Documentation]    Triggers focus event using jQuery
    [Arguments]    ${p_element}
    ${t_element}=    Remove Element Locator Type    ${p_element}
    Execute Javascript    jQuery('${t_element}').focus();

Blur Element
    [Documentation]    Triggers blur event using jQuery
    [Arguments]    ${p_element}
    ${t_element}=    Remove Element Locator Type    ${p_element}
    Execute Javascript    jQuery('${t_element}').blur();

JQuery Click Element
    [Documentation]    Clicking an element using jQuery
    [Arguments]    ${p_element}
    ${t_element}=    Remove Element Locator Type    ${p_element}
    Execute Javascript    jQuery('${t_element}').click();

Remove Element Locator Type
    [Documentation]    This keyword will remove the Element locator type and return just the value of the locator
    [Arguments]    ${p_element}
    ${t_newElement}=    Remove String Using Regexp    ${p_element}    ^.*?=
    ${r_removeHTMLElement}=    Set Variable    ${t_newElement}
    [Return]    ${r_removeHTMLElement}

Change Element Locator Type
    [Documentation]    Replace the element location
    ...    ${p_element} =  locator
    ...    ${p_locatorType}= string that you will replace on the element locator
    [Arguments]    ${p_element}    ${p_locatorType}
    ${t_changeLocatorAttributeToJquery}=    Replace String Using Regexp    ${p_element}    (^\\w+)\\b    ${p_locatorType}
    ${r_newHTMLAttribute}=    Set Variable    ${t_changeLocatorAttributeToJquery}
    [Return]    ${r_newHTMLAttribute}

Generate Random Number
    [Documentation]    Generates 8 characters with a combination of numbers and letters
    ${t_getRandomNum} =    Generate Random String    8    [NUMBERS][LETTERS]
    [Return]    ${t_getRandomNum}

Input Location
    [Documentation]    Loop will serve as try catch if the location displayed is not equal to the inputted value
    [Arguments]    ${p_location}
    Set Test Variable    ${tc_LOCATION_IS_SET}    False
    : FOR    ${iteration}    IN RANGE    5
    \    Input Text    ${SKILLS_PAGE_LOCATION_FIELD}    ${empty}
    \    Input Text By Press Key Each Character    ${SKILLS_PAGE_LOCATION_FIELD}    ${p_location}
    \    Press Key    ${SKILLS_PAGE_LOCATION_FIELD}    \\09
    \    Click Element    ${SKILLS_PAGE_LOCATION_FIELD}
    \    ${t_isVisible} =    Run Keyword And Return Status
    ...    Element Should Contain    ${SKILLS_PAGE_LOCATION_FIRST_ITEM}    ${p_location}
    \    ${t_isClicked} =    Run Keyword And Return Status
    ...    Click Element    ${SKILLS_PAGE_LOCATION_FIRST_ITEM}
    \    Run Keyword If    ${t_isVisible} and ${t_isClicked}    Run Keywords
    ...    Set Test Variable    ${tc_LOCATION_IS_SET}    True    AND    Exit For Loop
    \    Capture Page Screenshot

Get Matching Locator Count
    [Documentation]   This keyword will count all possible elements in the page using jQuery length.
    ...    Do not use ID since it will only return 1 result. Use class as argument.
    [Arguments]    ${p_elementLocator}
    ${t_plainElementLocator}=    Remove Element Locator Type    ${p_elementLocator}
    ${r_elementCount}    Execute Javascript   return jQuery("${t_plainElementLocator}").length
    Log   ${r_elementCount}
    [Return]    ${r_elementCount}

User Navigates To "${PAGE_URL}" Page
    Run And Wait Until Keyword Succeeds    Go To    ${BASE_URL}${${PAGE_URL}_URL_EXT}

User Has Navigated To "${PAGE_URL}" Page
    ${t_isCorrectUrl} =    Run Keyword And Return Status
    ...    Run And Wait Until Keyword Succeeds
    ...    Location Should Contain    ${BASE_URL}${${PAGE_URL}_URL_EXT}
    Run Keyword Unless    ${t_isCorrectUrl}    Go To    ${BASE_URL}${${PAGE_URL}_URL_EXT}

Get Number Only From String
    [Documentation]    Gets the number from parsed strings like string with currency $10 or 10 USD and return the number as Integer.
    [Arguments]    ${p_string}
    ${r_number} =    Set Variable    ${EMPTY}
    ${t_numberAsList} =    Get Regexp Matches    ${p_string}    [0-9]
    ${t_lengthOfList} =    Get Length    ${t_numberAsList}
    : FOR    ${index}    IN RANGE    ${t_lengthOfList}
    \    ${t_number} =    Get From List    ${t_numberAsList}    ${index}
    \    ${r_Number} =    Catenate    SEPARATOR=    ${r_Number}    ${t_number}
    ${r_number} =    Run Keyword If    '${r_Number}' != '${EMPTY}'    Convert To Integer    ${r_number}
    [Return]    ${r_number}

Generate Random Alpha Nummeric String
    [Documentation]    Generates randon string having atleast 1 uppercase, 1 lowercase and 1 number.
    [Arguments]    ${p_lengthOfstring}
    : FOR    ${index}    IN RANGE    20
    \    ${r_randomAlphaNumString}=    Generate Random String   ${p_lengthOfstring}
    \    ${t_isLowerCase} =    Run Keyword And Return Status    Should Be Lowercase    ${r_randomAlphaNumString}
    \    ${t_isUpperCase} =    Run Keyword And Return Status    Should Be Uppercase    ${r_randomAlphaNumString}
    \    ${t_number} =    Get Number Only From String    ${r_randomAlphaNumString}
    \    ${t_number} =    Convert To String    ${t_number}
    \    ${t_numberLength} =    Get Length    ${t_number}
    \    ${t_hasNumber} =    Set Variable If    ${t_number} != None    True    False
    \    Exit For Loop If    ${t_isLowerCase} == False and ${t_isUpperCase} == False and ${t_hasNumber} == True and ${t_numberLength} != ${p_lengthOfstring}
    [Return]    ${r_randomAlphaNumString}

Set Default Selenium Speed
    [Documentation]    This keyword sets the selenium speed to execute
    ...    commands based on Get Default Selenium Speed which is called in
    ...    Browser Is Launched keyword
    Set Selenium Speed    .5

#==========================================================#
#                  SETUP AND TEARDOWN
#==========================================================#
Setup Browser For Login Via "${LOGIN_MODE}"
    [Documentation]    This keyword by default is for launching an employer browser but if
    ...    called by a test name that contains freelancer, it will then change the value of Alias
    ...    Accepts three entry points of logging in (Login Modal, Login Page, and Home Page)
    ...    RESTRICTION: Can only be used in [Setup] of Test Cases
    Setup Test Accounts
    ${t_urlExt} =    Set Variable If    '${LOGIN_MODE}' == 'Login Modal' or '${LOGIN_MODE}' == 'Login Page'    ${DEFAULT_LOGIN_URL}
    ...    ${FREELANCER_EXT}
    Launch Browser Setup    ${t_urlExt}    ${BROWSER}    ${tc_ALIAS}    ${NATIVE_EVENTS_FALSE}
    Login Via "${LOGIN_MODE}"

Setup Test Accounts
    [Documentation]    This keyword setup the test accounts based from user role(employer, freelancer)
    ...    and calls set credentials for "user_role"
    ...    RESTRICTION: Can only be used in [Setup] of Test Cases; dependent on test case name
    : FOR    ${element}    IN    @{EMPLOYERS_LIST}
    \    ${t_containsValue} =    Run Keyword And Return Status
    ...    Should Contain    ${TESTNAME}    ${element}
    \    Run Keyword If    ${t_containsValue}
    ...    Set Credentials For "Employer"
    \    Exit For Loop If    ${t_containsValue}
    Run Keyword Unless    ${t_containsValue}
    ...    Set Credentials For "Freelancer"

Check If "${USER_ROLE}" Account Exists
    ${t_isFirstExisting} =    Get Variable Value    ${${${USER_ROLE}_BROWSER_PREFIX}${BROWSER}${LANGUAGE}User}
    ${t_isSecondExisting} =    Get Variable Value    ${${USER_ROLE}Username}
    ${r_isExisting} =    Set Variable If    '${t_isFirstExisting}' != 'None' or '${t_isSecondExisting}' != 'None'    True    False
    [Return]    ${r_isExisting}

Initialize "${USER_ROLE}" Test Account
    [Documentation]    This keyword initializes the test account that the test will use
    ...    ${${${USER_ROLE}_BROWSER_PREFIX}${BROWSER}${LANGUAGE}User} is a dynamic variable based from user_role, browser and language setup
    ${r_account} =    Get Variable Value     ${${${USER_ROLE}_BROWSER_PREFIX}${BROWSER}${LANGUAGE}User}    ${${USER_ROLE}Username}
    [Return]    ${r_account}

Set Credentials For "${USER_ROLE}"
    [Documentation]    Called by Setup Test Accounts
    ...    This keyword initializes credentials needed by the account
    ...    RESTRICTION: Can only be used in [Setup] of Test Cases
    ${t_isAccountExisting} =    Check If "${USER_ROLE}" Account Exists
    ${t_accountUsername} =    Run Keyword If    ${t_isAccountExisting}
    ...    Initialize "${USER_ROLE}" Test Account
    ${t_alias} =    Set Variable If    '${USER_ROLE}' == 'Employer'    ${ALIAS1}    ${ALIAS2}
    Run Keyword If    '${USER_ROLE}' == 'Employer'    Run Keywords
    ...    Setup Project Title
    ...    Setup Dynamic Test User
    Set Test Variable    ${tc_USERNAME}    ${t_accountUsername}
    Set Test Variable    ${tc_ALIAS}    ${t_alias}

Set Language To Default For All Browsers
    [Documentation]    Teardown for setting the language preference of all users to default
    : FOR    ${iterate}    IN    1    2
    \    Exit For Loop If    '${LANGUAGE}'=='English'
    \    Switch Browser    browser${iterate}
    \    Set Language To Default
    Close All Browsers

#==============================================#
#               Deprecated Global Keywords
#==============================================#
# Wait Until AngularJS Is Loaded
#    ${retval}=    Execute Async JavaScript
#    ...    var callback = arguments[arguments.length - 1];
#    ...    function answer(){callback("loaded");};
#    ...    angular.getTestability('${ANGULAR_CONTAINER}').whenStable(answer);
#    Should Be Equal   ${retval}    loaded

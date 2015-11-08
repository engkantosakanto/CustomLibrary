*** Settings ***
Resource          ../Variables/footer_constants.robot

*** Keywords ***
#=======================================================#
#                      WHEN
#=======================================================#
User Checks Number Of Freelancers
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${FREELANCER_COUNT_SPAN}
    ${t_noOfFreelancers} =    Get Text    ${FREELANCER_COUNT_SPAN}
    Set Suite Variable    ${noOfFreelancers}    ${t_noOfFreelancers}

User Clicks Freelancer Contests In Footer
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Element Should Be Visible    ${FOOTER_FREELANCE_CONTESTS_LINK}
    Click Element    ${FOOTER_FREELANCE_CONTESTS_LINK}

User Clicks Freelancer Contests In Footer 2
    Wait Until Element Is Visible    ${FOOTER_FREELANCE_CONTESTS_LINK}
    #Click Element    ${FOOTER_FREELANCE_CONTESTS_LINK}
    Go To    ${BASE_URL}${CNP_URL_EXT}

User Clicks Find Freelancer Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_FIND_FREELANCER_LINK}
    Click Element    ${FOOTER_FIND_FREELANCER_LINK}

User Clicks Freelance Projects Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_FREELANCE_PROJECTS_LINK}
    Click Element    ${FOOTER_FREELANCE_PROJECTS_LINK}

User Clicks Freelance Jobs Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_FREELANCE_JOBS_LINK}
    Click Element    ${FOOTER_FREELANCE_JOBS_LINK}

User Clicks Hire Freelancers Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_HIRE_FREELANCERS_LINK}
    Click Element    ${FOOTER_HIRE_FREELANCERS_LINK}

User Clicks Freelance Work Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_FREELANCE_WORK_LINK}
    Click Element    ${FOOTER_FREELANCE_WORK_LINK}

User Clicks About Us Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_ABOUT_US_LINK}
    Click Element    ${FOOTER_ABOUT_US_LINK}

User Clicks Privacy Policy Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_PRIVACY_POLICY_LINK}
    Click Element    ${FOOTER_PRIVACY_POLICY_LINK}

User Clicks Terms And Conditions Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_TERMS_&_CONDITIONS_LINK}
    Click Element    ${FOOTER_TERMS_&_CONDITIONS_LINK}

User Clicks Fees And Charges Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_FIND_FREELANCER_LINK}
    Click Element    ${FOOTER_FEES_&_CHARGES_LINK}

User Clicks Investor Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_INVESTOR_LINK}
    Click Element    ${FOOTER_INVESTOR_LINK}

User Clicks Community Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_COMMUNITY_LINK}
    Click Element    ${FOOTER_COMMUNITY_LINK}

User Changes Language
    [Arguments]    ${p_language}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${FOOTER_CHOSEN_LANGUAGE}
    ${t_isChosenLanguageDefault} =    Run Keyword And Return Status
    ...    Element Text Should Be    ${FOOTER_CHOSEN_LANGUAGE}    ${p_language}
    Run Keyword Unless    ${t_isChosenLanguageDefault}    Set Language    ${p_language}

User Clicks "${p_footerIcon}" Footer Icon
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${FOOTER_${p_footerIcon}_ICON}
    Click Element    ${FOOTER_${p_footerIcon}_ICON}

#======================================================#
#                 INTERNAL KEYWORDS
#======================================================#
Set Language
    [Arguments]    ${p_desiredLanguage}
    Hide Element From Website
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${FOOTER_DOMAIN_LANGUAGE_LINK}
    Click Element    ${FOOTER_DOMAIN_LANGUAGE_LINK}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${FOOTER_LANGUAGE_DROPDOWN}
    Select From List By Label    ${FOOTER_LANGUAGE_DROPDOWN}    ${p_desiredLanguage}
    Run And Wait Until Keyword Succeeds    Element Text Should Be    ${FOOTER_CHOSEN_LANGUAGE}    ${p_desiredLanguage}

#=================================================================================================================#
#                                              INTERNAL KEYWORDS
#=================================================================================================================#
Get Million In Number
    [Documentation]    Will be refactored in the future for better approach
    ...    This keyword gets the count of users in million with one decimal point and if decimal point is 0,
    ...    returns no decimal point
    ${r_millionCount} =    Get Million With Decimal
    ${r_millionCount} =    Convert To String    ${r_millionCount}
    ${t_millionDecimal} =    Fetch From Right    ${r_millionCount}    .
    ${t_millionWhole} =    Fetch From Left    ${r_millionCount}    .
    ${r_millionCount} =    Convert To Number    ${r_millionCount}    1
    ${r_userCount} =    Set Variable If    ${t_millionDecimal} == 0    ${t_millionWhole}    ${r_millionCount}
    [Return]    ${r_userCount}

Get Million With Decimal
    ${t_toNumber} =    Remove String    ${noOfFreelancers}    ,
    ${t_toNumber} =    Convert To Number    ${t_toNumber}    1
    ${r_millionCount} =    Evaluate    ${t_toNumber}/1000000
    ${r_millionCount} =    Convert To Number    ${r_millionCount}    1
    [Return]    ${r_millionCount}

Home Page Footer Should Be Displayed
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HOME_PAGE_BANNER_SECTION}

#======================================================#
#                SETUP AND TEARDOWN
#======================================================#

Set Language To Default
    Go To    ${BASE_URL}${DASHBOARD_EXT}
    Run And Wait Until Keyword Succeeds    Location Should Contain    ${DASHBOARD_EXT}
    Set Language    ${FOOTER_DEFAULT_LANGUAGE}


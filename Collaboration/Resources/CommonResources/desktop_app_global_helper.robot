*** Settings ***
Library           FreelancerSikuliXRobotLibrary
Library           Operating System
Resource          ../Variables/desktop_app_installation_constants.robot

*** Keywords ***
Set Default Pattern Library Directory
    ${new_PatternDirectory}=    Replace String   ${CURDIR}   CommonResources    PatternResources
    Log   ${new_PatternDirectory}
    Set Image Library    ${new_PatternDirectory}

Get OS Type
    [Documentation]    This keyword sets the OS type, using the `Get Env OS Type` keyword from FreelancerSikuliXRobotLibrary
    ${Env_OS_type} =    Get Env OS Type
    Set Test Variable    ${OS_TYPE}    ${Env_OS_type}

User Clicks "${p_element}" "${p_element_type}"
    [Documentation]    This keyword do left click on web specific elements.
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${${p_button}_${p_element_type}}
    Click Element    ${${p_button}_${p_element_type}}

User Clicks OS "${p_element}" "${p_element_type}"
    [Documentation]    This keyword do left click on OS specific elements and uses region offsets rather than patterns.
    Set New Search Region In Active App    ${${OS_TYPE}_${p_element}_${p_element_type}_REGION}
    Click Region

User Clicks Desktop App "${p_element}" "${p_element_type}"
    [Documentation]    This keyword do left click on Desktop App specific elements and uses region offsets rather than patterns.
    Set New Search Region In Active App    ${${p_element}_${p_element_type}_REGION}
    Click Region

User Inputs "${p_fieldValue}" In "${p_element}" "${p_element_type}"
    User Clicks Desktop App "${p_element}" "${p_element_type}"
    Type String    ${p_string}

Set Focus To "${p_window}" Window
    Run And Wait Until Keyword Succeeds    Set Application Focus    ${p_window}

Close "${p_application_name}" Application
    Close Application    ${p_application_name}

List Of Patterns Should Be Visible
    [Documentation]    This keyword accepts pre-created list of patterns or a number of patterns separated by a comma as an argument and
    ...    iterates to check if the pattern is visible
    ...    Argument Example:
    ...    pre-created list of patterns: @{t_listOfPatterns}
    ...    elements separated by comma: ${Pattern_1},${Pattern_2},${Pattern_3},${Pattern_4}
    [Arguments]    @{p_pattern}
    ${t_isCount} =    Get Length    ${p_pattern}
    @{t_createdListOfPatterns} =    Run Keyword If
    ...    ${t_isCount} == 1
    ...    Split String    @{p_pattern}    ,

    Run Keyword If    ${t_isCount} == 1
    ...    Set Test Variable    @{t_listOfPatterns}    @{t_createdListOfPatterns}
    ...    ELSE
    ...    Set Test Variable    @{t_listOfPatterns}    @{p_pattern}

    : FOR    ${pattern}    IN    @{t_listOfPatterns}
    \    Element "${pattern}" Should Be Visible Before Timeout

List Of Patterns Should Not Be Visible
    [Documentation]    This keyword accepts pre-created list of patterns or a number of patterns separated by a comma as an argument and
    ...    iterates to check if the pattern is visible
    ...    Argument Example:
    ...    pre-created list of patterns: @{t_listOfPatterns}
    ...    elements separated by comma: ${Pattern_1},${Pattern_2},${Pattern_3},${Pattern_4}
    [Arguments]    @{p_pattern}
    ${t_isCount} =    Get Length    ${p_pattern}
    @{t_createdListOfPatterns} =    Run Keyword If
    ...    ${t_isCount} == 1
    ...    Split String    @{p_pattern}    ,

    Run Keyword If    ${t_isCount} == 1
    ...    Set Test Variable    @{t_listOfPatterns}    @{t_createdListOfPatterns}
    ...    ELSE
    ...    Set Test Variable    @{t_listOfPatterns}    @{p_pattern}

    : FOR    ${pattern}    IN    @{t_listOfPatterns}
    \    Element "${pattern}" Should Not Be Visible Before Timeout

Element "${p_pattern}" Should Be Visible Before Timeout
    Wait Until Pattern Is Visible    ${p_pattern}    ${TIMEOUT}

Element "${p_pattern}" Should Not Be Visible Before Timeout
    Wait Until Pattern Vanish    ${p_pattern}    ${TIMEOUT}
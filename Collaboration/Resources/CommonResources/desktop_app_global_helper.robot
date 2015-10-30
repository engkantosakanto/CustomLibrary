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

Click "${p_element}" "${p_element_type}"
    [Documentation]    This keyword do left click on web specific elements.
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${${p_button}_${p_element_type}}
    Click Element    ${${p_button}_${p_element_type}}

Click OS "${p_element}" "${p_element_type}"
    [Documentation]    This keyword do left click on OS specific elements and uses region offsets rather than patterns.
    Set New Search Region In Active App    ${${OS_TYPE}_${p_element}_${p_element_type}_REGION}
    Click Region

Click Desktop App "${p_element}" "${p_element_type}"
    [Documentation]    This keyword do left click on Desktop App specific elements and uses region offsets rather than patterns.
    Set New Search Region In Active App    ${${p_element}_${p_element_type}_REGION}
    Click Region

Run Application "${p_application_name}" Via "${p_application_executable}"
    Check And Open Application    ${p_application_name}    ${${OS_TYPE}_${p_application_executable}}

Input "${p_fieldValue}" In "${p_element}" "${p_element_type}"
    User Clicks Desktop App "${p_element}" "${p_element_type}"
    Type String    ${p_string}

Set Focus To "${p_window}" Window
    Wait Until Keyword Succeeds    20    5    Set Application Focus    ${p_window}

Switch Focus To "${p_window}" Window
    Wait Until Keyword Succeeds    20    5    Switch Application Focus    ${p_window}

Close "${p_application_name}" Application
    Close Application    ${p_application_name}

Get "${p_file}" File Size
    Open Application    ${${OS_TYPE}_${p_file}}

Open "${p_application}" Application
    Open Application    ${${OS_TYPE}_${p_application}}

Element "${p_pattern}" Should Be Visible Before Timeout
    Wait Until Pattern Is Visible    ${p_pattern}    ${TIMEOUT}

Element "${p_pattern}" Should Not Be Visible Before Timeout
    Wait Until Pattern Vanish    ${p_pattern}    ${TIMEOUT}

Wait Until "${p_window}" Window Is Visible
    Wait Until Keyword Succeeds    20    5    Window "${p_window}" Should Be Open

Window "${p_window}" Should Be Open
    ${has_window} =    Run Keyword and Return Status    App Has Window    ${p_window}
    Should Be True    ${has_window}    # Passes if ${has_window} is True

Directory "${p_directory}" Should Not Be Empty
    Directory Should Not Be Empty    ${${OS_TYPE}_${p_directory}}

File "${p_file}" Should Exist
    File Should Exist    ${${OS_TYPE}_${p_file}}

Wait Until "${p_file}" Is Created
    Wait Until Created    ${${OS_TYPE}_${p_file}}

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
    ...    iterates to check if the pattern is not visible
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

List Of Files Should Exist
    [Documentation]    This keyword accepts pre-created list of patterns or a number of patterns separated by a comma as an argument and
    ...    iterates to check if the pattern is not visible
    ...    Argument Example:
    ...    pre-created list of patterns: @{t_listOfFiles}
    ...    elements separated by comma: ${File_1},${File_2},${File_3},${File_4}
    [Arguments]    @{p_file}
    ${t_isCount} =    Get Length    ${p_file}
    @{t_createdListOfFiles} =    Run Keyword If
    ...    ${t_isCount} == 1
    ...    Split String    @{p_file}    ,

    Run Keyword If    ${t_isCount} == 1
    ...    Set Test Variable    @{t_listOfFiles}    @{t_createdListOfFiles}
    ...    ELSE
    ...    Set Test Variable    @{t_listOfFiles}    @{p_file}

    : FOR    ${file}    IN    @{t_listOfFiles}
    \    File "${file}" Should Exist
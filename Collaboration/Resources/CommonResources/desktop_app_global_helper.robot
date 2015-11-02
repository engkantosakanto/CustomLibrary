*** Settings ***
Library           FreelancerSikuliXRobotLibrary
Library           Operating System
Library           String

*** Keywords ***

Assert That "${p_element}" Is Visible
    Assert Pattern Is Visible In Active App    ${p_element}

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
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${${p_element}_${p_element_type}}
    Click Element    ${${p_element}_${p_element_type}}

Click OS "${p_element}" "${p_element_type}"
    [Documentation]    This keyword do left click on OS specific elements and uses region offsets rather than patterns.
    Get OS Type
    Set New Search Region In Active App    ${${OS_TYPE}_${p_element}_${p_element_type}_REGION}
    Click Region

Click Desktop App "${p_element}" "${p_element_type}"
    [Documentation]    This keyword do left click on Desktop App specific elements and uses region offsets rather than patterns.
    Set New Search Region In Active App    ${${p_element}_${p_element_type}_REGION}
    Click Region

Run Application "${p_application_name}" Via "${p_application_executable}"
    Get OS Type
    Check And Open Application    ${p_application_name}    ${${OS_TYPE}_${p_application_executable}}
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY_INTERVAL}
    ...    Window "${p_application_name}" Should Be Open

Input "${p_field_value}" In "${p_element}" "${p_element_type}"
    Click Desktop App "${p_element}" "${p_element_type}"
    Type String    ${p_field_value}

Set Focus To "${p_window}" Window
    Wait Until Keyword Succeeds    20    5    Set Application Focus    ${p_window}

Switch Focus To "${p_window}" Window
    Wait Until Keyword Succeeds    20    5    Switch Application Focus    ${p_window}

Close "${p_application_name}" Application
    Close Application    ${p_application_name}

Get "${p_file}" File Size
    Get OS Type
    Open Application    ${${OS_TYPE}_${p_file}}

Open "${p_application}" Application
    Get OS Type
    Open Application    ${${OS_TYPE}_${p_application}}

Element "${p_pattern}" Should Be "${p_visibility}" Before Timeout
    Run Keyword If    '${p_visibility}' == 'Visible'
    ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY_INTERVAL}
    ...    Wait For Pattern To Be Visible    ${p_pattern}
    ...    ELSE
    ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY_INTERVAL}
    ...    Wait For Pattern To Vanish   ${p_pattern}

Wait Until "${p_window}" Window Is Visible
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY_INTERVAL}
    ...    Window "${p_window}" Should Be Open

Window "${p_application}" Should Be Open
    ${has_window} =    Run Keyword and Return Status    App Get Window    ${p_application}
    Should Be True    ${has_window}    # Passes if ${has_window} is True

Application Name "${p_application}" Should Be Correct
    ${app_name} =    App Get Window    ${p_application}
    Should Be Equal As Strings    ${app_name}    ${p_application}

Application Executable "${p_application_executable}" Should Be Correct
    ${app_exe} =    App Get Name    ${p_application_executable}
    Should Be Equal As Strings    ${app_exe}    ${p_application_executable}

Directory "${p_directory}" Should Be Not Empty
    Get OS Type
    Directory Should Not Be Empty    ${${OS_TYPE}_${p_directory}}

File "${p_file}" Should Exist
    Get OS Type
    File Should Exist    ${${OS_TYPE}_${p_file}}

Wait Until "${p_file}" Is Created
    Get OS Type
    Wait Until Created    ${${OS_TYPE}_${p_file}}

List Of Patterns "${p_pattern}" Should Be "${p_visibility}" Before Timeout
    [Documentation]    This keyword accepts pre-created list of patterns or a number of patterns separated by a comma as an argument and
    ...    iterates to check if the pattern is visible
    ...    Argument Example:
    ...    pre-created list of patterns: @{t_listOfPatterns}
    ...    elements separated by comma: ${Pattern_1},${Pattern_2},${Pattern_3},${Pattern_4}
    ${t_isCount} =    Get Length    ${p_pattern}
    @{t_createdListOfPatterns} =    Run Keyword If
    ...    ${t_isCount} == 1
    ...    Split String    @{p_pattern}    ,

    Run Keyword If    ${t_isCount} == 1
    ...    Set Test Variable    @{t_listOfPatterns}    @{t_createdListOfPatterns}
    ...    ELSE
    ...    Set Test Variable    @{t_listOfPatterns}    @{p_pattern}

    : FOR    ${pattern}    IN    @{t_listOfPatterns}
    \    Element "${pattern}" Should Be "${p_visibility}" Before Timeout

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
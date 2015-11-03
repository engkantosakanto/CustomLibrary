*** Settings ***
Library           String

*** Keywords ***

Assert That "${p_element}" Is Visible
    [Documentation]    This keyword asserts that pattern is visible in application in focus.
    Assert Pattern Is Visible In Active App    ${p_element}

Set Default Pattern Library Directory
    [Documentation]    This keyword sets the PatternResources directory as the default pattern library.
    ${new_PatternDirectory}=    Replace String   ${CURDIR}   CommonResources    PatternResources
    Log   ${new_PatternDirectory}
    Set Image Library    ${new_PatternDirectory}

Get OS Type
    [Documentation]    This keyword sets the OS type, using the `Get Env OS Type` keyword from FreelancerSikuliXRobotLibrary
    ${t_OSType} =    Get Env OS Type
    Set Test Variable    ${tc_OS_TYPE}    ${t_OSType}

Click "${p_element}" "${p_elementType}"
    [Documentation]    This keyword do left click on web specific elements.
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Element Should Be Visible    ${${p_element}_${p_elementType}}
    Click Element    ${${p_element}_${p_elementType}}

Click OS "${p_element}" "${p_elementType}"
    [Documentation]    This keyword do left click on OS specific elements and uses region offsets rather than patterns.
    Get OS Type
    Set New Search Region In Active App    ${${tc_OS_TYPE}_${p_element}_${p_elementType}_REGION}
    Click Region

Click Desktop App "${p_element}" "${p_elementType}"
    [Documentation]    This keyword do left clicks on Desktop App's specific elements and uses region offsets rather than patterns.
    Set New Search Region In Active App    ${${p_element}_${p_elementType}_REGION}
    Click Region

Run "${p_applicationName}" Application
    [Documentation]    Checks if application is running then sets it to focus, otherwise runs the application executable from the path.
    Get OS Type
    Check And Open Application    ${p_applicationName}    ${${tc_OS_TYPE}_${p_applicationName}_EXECUTABLE_PATH}

Application "${p_applicationName}" In Focus Is Correct
    [Documentation]    Checks if the application in focus is correct by verifying the application name.
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Window "${p_applicationName}" Should Be Open
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Application Name "${p_applicationName}" Is Correct
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Application Executable "${${tc_OS_TYPE}_${p_applicationName}_EXECUTABLE}" Is Correct

Input "${p_field_value}" In "${p_element}" "${p_elementType}"
    [Documentation]    Inputs string in the field as specified in p_element and p_elementType
    Click Desktop App "${p_element}" "${p_elementType}"
    Type Text At Region    ${p_field_value}

Set Focus To "${p_applicationName}" Window
    [Documentation]    Sets the focus to the application p_applicationName's window.
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Set Application Focus    ${p_applicationName}

Switch Focus To "${p_applicationName}" Window
    [Documentation]    Switches focus to the application p_applicationName's window.
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Switch Application Focus    ${p_applicationName}

Close "${p_applicationName}" Application
    [Documentation]    Closes the application p_applicationName.
    Close Application    ${p_applicationName}

Get "${p_file}" File Size
    [Documentation]    Gets the file size of specified file and assign it to tc_FILE_SIZE
    ${t_fileSize} =    Get File Size    ${${tc_OS_TYPE}_${p_file}}
    ${t_fileSize} =    Convert To String    ${t_fileSize}
    Set Test Variable    ${tc_FILE_SIZE}    ${t_fileSize}

Open "${p_applicationName}" Application
    Get OS Type
    Open Application    ${${tc_OS_TYPE}_${p_applicationName}}

Element "${p_pattern}" Should Be "${p_visibility}" Before Timeout
    Run Keyword If    '${p_visibility}' == 'Visible'
    ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Wait For Pattern To Be Visible    ${p_pattern}
    ...    ELSE
    ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Wait For Pattern To Vanish   ${p_pattern}

Window "${p_applicationName}" Should Be Open
    ${t_hasWindow} =    Run Keyword and Return Status    App Get Window    ${p_applicationName}
    Should Be True    ${t_hasWindow}    # Passes if ${t_hasWindow} is True

Application Name "${p_applicationName}" Is Correct
    ${t_applicationName} =    App Get Window    ${p_applicationName}
    Should Be Equal As Strings    ${t_applicationName}    ${p_applicationName}

Application Executable "${p_applicationExecutable}" Is Correct
    ${t_applicationExecutable} =    App Get Name    ${p_applicationExecutable}
    Should Be Equal As Strings    ${t_applicationExecutable}    ${p_applicationExecutable}

Application "${p_applicationName}" Is Running
    ${t_isRunning} =    Run Keyword and Return Status    Application Is Running    ${p_applicationName}
    Should Be True    ${t_isRunning}    # Passes if ${t_isRunning} is True

Directory "${p_directory}" Should Be Not Empty
    Get OS Type
    Directory Should Not Be Empty    ${${tc_OS_TYPE}_${p_directory}}

File "${p_file}" Should Exist
    Get OS Type
    File Should Exist    ${${tc_OS_TYPE}_${p_file}_PATH}

Wait Until "${p_file}" Is Created
    Get OS Type
    Wait Until Created    ${${tc_OS_TYPE}_${p_file}}

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
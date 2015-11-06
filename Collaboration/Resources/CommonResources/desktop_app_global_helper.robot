*** Settings ***
Library           String

*** Keywords ***
#===============================================================#
#               Desktop App Generic Keywords
#===============================================================#
#===================================================#
#                Setup Keywords
#===================================================#
Freelancer Desktop App Suite Setup
    Set Default Pattern Library Directory
    Get OS Type
    Get OS User Name
    Get OS Home Directory
    Get OS Default Download Directory

Set Default Pattern Library Directory
    [Documentation]    This keyword sets the PatternResources directory as the default pattern library.
    ${new_PatternDirectory}=    Replace String   ${CURDIR}   CommonResources    PatternResources
    Log   ${new_PatternDirectory}
    Set Image Library    ${new_PatternDirectory}

#===================================================#
#               Assertion Keywords
#===================================================#
Assert That "${p_element}" Is Visible
    [Documentation]    This keyword asserts that pattern is visible in application in focus.
    Assert Pattern Is Visible In Active App    ${p_element}

Application Name "${p_applicationName}" Is Correct
    ${t_applicationName} =    App Get Window    ${p_applicationName}
    Should Be Equal As Strings    ${${g_OS_TYPE}_${p_applicationName}_WINDOW}    ${t_applicationName}

Application Executable "${p_applicationName}" Is Correct
    ${t_applicationExecutable} =    App Get Name    ${p_applicationName}
    Should Be Equal As Strings    ${${g_OS_TYPE}_${p_applicationName}_EXECUTABLE}    ${t_applicationExecutable}

Application "${p_applicationName}" Is Running
    ${t_isRunning} =    Run Keyword and Return Status
    ...    Application Is Running    ${p_applicationName}
    Should Be True    ${t_isRunning}    # Passes if ${t_isRunning} is True

Window "${p_applicationName}" Should Be Open
    [Documentation]    Checks if the application window is open
    ${t_hasWindow} =    Run Keyword and Return Status
    ...    App Get Window    ${p_applicationName}
    Should Be True    ${t_hasWindow}    # Passes if ${t_hasWindow} is True

Directory "${p_directory}" Should Be "${p_directoryState}"
    [Documentation]    Checks if the p_directory is empty or not empty
    Run Keyword If    '${p_directoryState}' == 'Not Empty'
    ...    Directory Should Not Be Empty    ${${g_OS_TYPE}_${p_directory}}
    Run Keyword If    '${p_directoryState}' == 'Empty'
    ...    Directory Should Be Empty    ${${g_OS_TYPE}_${p_directory}}

Directory "${p_directory}" Should "${p_fileState}"
    [Documentation]    Checks if the p_directory exists or not
    Run Keyword If    '${p_fileState}' == 'Exist'
    ...    Directory Should Exist    ${${g_OS_TYPE}_${p_directory}}
    Run Keyword If    '${p_fileState}' == 'Not Exist'
    ...    Directory Should Not Exist    ${${g_OS_TYPE}_${p_directory}}

File "${p_file}" Should "${p_fileState}"
    [Documentation]    Checks if the p_file exists or not
    Run Keyword If    '${p_fileState}' == 'Exist'
    ...    File Should Exist    ${${g_OS_TYPE}_${p_file}_PATH}/${${g_OS_TYPE}_${p_file}}
    Run Keyword If    '${p_fileState}' == 'Not Exist'
    ...    File Should Not Exist    ${${g_OS_TYPE}_${p_file}_PATH}/${${g_OS_TYPE}_${p_file}}

#===================================================#
#               Waiting Keywords
#===================================================#
Element "${p_pattern}" Should Be "${p_visibility}" Before Timeout
    Run Keyword If
    ...    '${p_visibility}' == 'Visible'
    ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Wait For Pattern To Be Visible    ${p_pattern}
    ...    ELSE
    ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Wait For Pattern To Vanish   ${p_pattern}

Wait Until "${p_window}" Window Is Visible
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Window "${p_window}" Should Be Open

Wait Until "${p_file}" Is Downloaded
    ${tc_filePath} =    Set Variable If
    ...    '${g_OS_TYPE}' == 'WINDOWS'    ${${g_OS_TYPE}_${p_file}_PATH}/${${g_OS_TYPE}_${p_file}_PART_FILE}
    ...    '${g_OS_TYPE}' != 'WINDOWS'    ${${g_OS_TYPE}_${p_file}_PATH}/${${g_OS_TYPE}_${p_file}}

    Wait Until Removed    ${tc_filePath}    -1

#===================================================#
#                Cross Platform Keywords
#===================================================#
Get OS Type
    [Documentation]    This keyword sets the OS type, using the `Get Env OS Type` keyword from FreelancerSikuliXRobotLibrary
    ${t_OSType} =    Get Env OS Type
    Set Global Variable    ${g_OS_TYPE}    ${t_OSType}

Get OS User Name
    ${t_command} =    Set Variable If
    ...    '${g_OS_TYPE}' == 'WINDOWS'    echo %username%
    ...    '${g_OS_TYPE}' != 'WINDOWS'    whoami

    ${t_userName} =    Run    ${t_command}
    ${t_userName} =    Set Variable If
    ...    '${g_OS_TYPE}' == 'WINDOWS'    ${t_userName.strip()}

    Set Global Variable    ${g_USER_NAME}    ${t_userName}

Get OS Home Directory
    ${t_homeDirectory} =    Set Variable If
    ...    '${g_OS_TYPE}' == 'WINDOWS'    C:/Users/${g_USER_NAME}
    ...    '${g_OS_TYPE}' != 'WINDOWS'    /home/${g_USER_NAME}
    Set Global Variable    ${${g_OS_TYPE}_HOME_DIRECTORY}    ${t_homeDirectory}

Get OS Default Download Directory
    Set Global Variable    ${${g_OS_TYPE}_FREELANCER_DESKTOP_APP_INSTALLER_PATH}
    ...    ${${g_OS_TYPE}_HOME_DIRECTORY}/Downloads

#===================================================#
#                User Action Keywords
#===================================================#

Click "${p_element}" "${p_elementType}"
    [Documentation]    This keyword do left click on web specific elements.
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}
    ...    Element Should Be Visible    ${${p_element}_${p_elementType}}
    Click Element    ${${p_element}_${p_elementType}}

Click OS "${p_element}" "${p_elementType}"
    [Documentation]    This keyword do left click on OS specific elements and uses region offsets rather than patterns.
    Set New Search Region In Active App    ${${g_OS_TYPE}_${p_element}_${p_elementType}_REGION}
    Click Region

Click Desktop App "${p_element}" "${p_elementType}"
    [Documentation]    This keyword do left clicks on Desktop App's specific elements and uses region offsets rather than patterns.
    Set New Search Region In Active App    ${${p_element}_${p_elementType}_REGION}
    Click Region

Delete "${p_file}" File
    ${t_fileExists} =    Run Keyword and Return Status
    ...    File "${p_file}" Should "Exist"

    Run Keyword If    ${t_fileExists}
    ...    Remove File    ${${g_OS_TYPE}_${p_file}_PATH}/${${g_OS_TYPE}_${p_file}}

Get "${p_file}" File Size
    [Documentation]    Gets the file size of specified file and assign it to tc_FILE_SIZE
    ${t_fileSize} =    Get File Size    ${${g_OS_TYPE}_${p_file}_PATH}/${${g_OS_TYPE}_${p_file}}
    ${t_fileSize} =    Convert To String    ${t_fileSize}
    Set Test Variable    ${tc_FILE_SIZE}    ${t_fileSize}

Input "${p_field_value}" In "${p_element}" "${p_elementType}"
    [Documentation]    Inputs string in the field as specified in p_element and p_elementType
    Click Desktop App "${p_element}" "${p_elementType}"
    Type Text At Region    ${p_field_value}

Open "${p_applicationName}" Application
    Open Application    ${${g_OS_TYPE}_${p_applicationName}_EXECUTABLE_PATH}/${${g_OS_TYPE}_${p_applicationName}_EXECUTABLE}

Close "${p_applicationName}" Application
    [Documentation]    Closes the application p_applicationName.
    Close Application    ${p_applicationName}

Close Freelancer Desktop App
    Close Application    ${${g_OS_TYPE}_FREELANCER_DESKTOP_APP_EXECUTABLE}

Check And Open "${p_applicationName}" Application
    [Documentation]    Checks if application is running then sets it to focus, otherwise runs the application executable from the path.
    Check And Open Application    ${p_applicationName}
    ...    ${${g_OS_TYPE}_${p_applicationName}_EXECUTABLE_PATH}/${${g_OS_TYPE}_${p_applicationName}_EXECUTABLE}

Set Focus To "${p_applicationName}" Window
    [Documentation]    Sets the focus to the application p_applicationName's window.
    Set Application Focus    ${p_applicationName}

Switch Focus To "${p_applicationName}" Window
    [Documentation]    Switches focus to the application p_applicationName's window.
    Switch Application Focus    ${p_applicationName}

Switch Between Open Application in "${p_OS}"
    Run Keyword If    '${p_OS}' == 'WINDOWS'    Run Keywords
    ...    Press Keyboard Key    CTRL + ALT + TAB    AND
    ...    Press Keyboard Key    RIGHT    AND
    ...    Press Keyboard Key    ENTER

#===================================================#
#                    Lists
#===================================================#
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
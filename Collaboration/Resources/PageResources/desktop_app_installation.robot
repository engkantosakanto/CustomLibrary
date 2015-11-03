*** Settings ***
Resource          ../Variables/desktop_app_installation_constants.robot
Resource          ../Variables/desktop_app_login_logout_constants.robot

*** Keywords ***
#===============================================================#
#                            GIVEN
#===============================================================#
The Freelancer Desktop App Installer Exists In Download Directory
    File "Freelancer Desktop App Installer" Should Exist

User Runs The Freelancer Desktop App
    Run "Freelancer Desktop App" Application

#===============================================================#
#                            WHEN
#===============================================================#
User Downloads The Freelancer Desktop App Installer
    Get OS Type
    Click "${tc_OS_TYPE} Select" "Button"
    Click "Desktop App Download Now" "Button"
    Run And Wait Until Keyword Succeeds    Click OS "Save File" "Button"

User Runs the Freelancer Desktop App Installer
    Get OS Type
    Run Keyword If    '${tc_OS_TYPE}' == 'Windows'
    ...    Install Freelancer Desktop App in Windows

User Uninstalls The Freelancer Desktop App
    Get OS Type
    Run Keyword If    '${tc_OS_TYPE}' == 'Windows'
    ...    Uninstall Freelancer Desktop App in Windows

#===============================================================#
#                            THEN
#===============================================================#
The Freelancer Desktop App Installer Should Be Successfully Downloaded
    Wait Until "Freelancer Desktop App Installer" Is Created
    File "Freelancer Desktop App Installer" Should Exist
    The File Size of Freelancer Desktop App Installer Should be Correct

The Freelancer Desktop App Installer Should Be Successfully Installed
    Directory "Freelancer Desktop App Installation Path" Should Not Be Empty
    File "Desktop App Executable" Should Exist

The File Size of Freelancer Desktop App Installer Should be Correct
    Get "Freelancer Desktop App Installer" File Size
    Should Be Equal As Strings    ${tc_FILE_SIZE}
    ...    ${${tc_OS_TYPE}_FREELANCER_DESKTOP_APP_INSTALLER_FILE_SIZE}

The Freelancer Desktop App Installer Should Exist In Download Directory
    File "Freelancer Desktop App Installer" Should Exist

The Update Checker Should Be Displayed
    List Of Patterns "@{UPDATE_CHECKER_CORE_PATTERNS_LIST}" Should Be "Visible" Before Timeout

#===============================================================#
#                    INTERNAL KEYWORDS
#===============================================================#

Install Freelancer Desktop App in Windows
    Open "Desktop App Installer" Application
    Wait Until "Setup - Freelancer Desktop App" Window Is Visible
    Set Focus To "Setup - Freelancer Desktop App" Window
    Repeat Keyword    4 times    Click OS "Setup Next" "Button"
    Click OS "Setup Install" "Button"
    Element "${WINDOWS_COMPLETING_INSTALLATION_DIALOG}" Should Be "Visible" Before Timeout
    Click OS "Setup Launch App" "Button"    # Unchecks the Launch Application checkbox
    Click OS "Setup Finish" "Button"


Uninstall Freelancer Desktop App in Windows
    [Documentation]    Uninstalls the Freelancer Desktop App from Control Panel. Note that unsinstallation using unins000.exe leaves traces of the application in Windows and may pose issues during installation.
    Run Command    control appwiz.cpl
    Element "${WINDOWS_PROGRAMS_CONTROL_PANEL} " Should Be "Visible" Before Timeout
    Press Keyboard Key    CTRL + F
    Type String    ${FREELANCER_DESKTOP_APP_NAME}
    Wait In Seconds    1
    Hover At Pattern    ${WINDOWS_FREELANCER_DESKTOP_APP_IN_CONTROL_PANEL}
    Right Click At Pattern    ${WINDOWS_FREELANCER_DESKTOP_APP_IN_CONTROL_PANEL}
    Press Keyboard Key    DOWN
    Press Keyboard Key    ENTER
    Wait Until "Uninstall" Window Is Visible
    Click Desktop App "Uninstall Yes" "Button"
    Element "${WINDOWS_UNINSTALL_SUCCESSFULL_DIALOG}" Should Be "Visible" Before Timeout
    Click Desktop App "Uninstall Complete OK" "Button"
    Press Keyboard Key    CTRL + W

*** Settings ***
Resource          ../Variables/desktop_app_installation_constants.robot
Resource          ../Variables/desktop_app_login_logout_constants.robot

*** Keywords ***
#===============================================================#
#                            GIVEN
#===============================================================#
The Freelancer Desktop App Installer Exists In Download Directory
    File "Freelancer Desktop App Installer" Should "Exist"

User Runs The Freelancer Desktop App
    Open "Freelancer Desktop App" Application

User Deletes The Freelancer Desktop App Installer
    Delete "Freelancer Desktop App Installer" File
    File "Freelancer Desktop App Installer" Should "Not Exist"
#===============================================================#
#                            WHEN
#===============================================================#
User Downloads The Freelancer Desktop App Installer
    [Documentation]    Pop-up should be disabled in firefox to byoass the download popup window http://www.slideshare.net/AparnaNaik/selenium-webdriver-pop-up-handling
    Click "Start Tracking" "Button"
    Click "${g_OS_TYPE}" "Select Button"
    Click "Desktop App Download Now" "Button"

User Installs the Freelancer Desktop App
    Run Keyword If    '${g_OS_TYPE}' == 'WINDOWS'
    ...    Install Freelancer Desktop App in Windows

User Uninstalls The Freelancer Desktop App
    Run Keyword If    '${g_OS_TYPE}' == 'WINDOWS'
    ...    Uninstall Freelancer Desktop App in Windows

#===============================================================#
#                            THEN
#===============================================================#
The Freelancer Desktop App Installer Should Be Successfully Downloaded
    Wait Until "Freelancer Desktop App Installer" Is Downloaded
    File "Freelancer Desktop App Installer" Should "Exist"
    The File Size of Freelancer Desktop App Installer Should be Correct

The Freelancer Desktop App Should Be "${p_installationState}" Successfully
    ${p_state} =    Set Variable If
    ...    '${p_installationState}' == 'Installed'    Exist
    ...    '${p_installationState}' == 'Uninstalled'    Not Exist

    Directory "Freelancer Desktop App Executable Path" Should "${p_state}"
    File "Freelancer Desktop App Executable" Should "${p_state}"

The File Size of Freelancer Desktop App Installer Should be Correct
    Get "Freelancer Desktop App Installer" File Size
    Should Be Equal As Strings    ${tc_FILE_SIZE}
    ...    ${${g_OS_TYPE}_FREELANCER_DESKTOP_APP_INSTALLER_FILE_SIZE}

The Update Checker Should Be Displayed
    List Of Patterns "@{UPDATE_CHECKER_CORE_PATTERNS_LIST}" Should Be "Visible" Before Timeout

#===============================================================#
#                    INTERNAL KEYWORDS
#===============================================================#
Run "${p_file}" Installer
    Open Application    ${${g_OS_TYPE}_FREELANCER_DESKTOP_APP_INSTALLER_PATH}/${${g_OS_TYPE}_${p_file}_INSTALLER}

Install Freelancer Desktop App in Windows
    [Documentation]    This keyword installs the Freelancer Desktop App in Windows. Note that the UAC must be disabled in the Registry Editor inorder for sikuli to access the windows setup.
    Element "${WINDOWS_SETUP_WIZARD}" Should Be "Visible" Before Timeout
    Repeat Keyword    4 times    Click OS "Setup Next" "Button"
    Click OS "Setup Install" "Button"
    Element "${WINDOWS_COMPLETING_INSTALLATION_DIALOG}" Should Be "Visible" Before Timeout
    Click OS "Setup Launch App" "Button"    # Unchecks the Launch Application checkbox
    Click OS "Setup Finish" "Button"

Uninstall Freelancer Desktop App in Windows
    [Documentation]    Uninstalls the Freelancer Desktop App from Control Panel. Note that unsinstallation using unins000.exe leaves traces of the application in Windows and may pose issues during installation.
    Run Command    control appwiz.cpl
    Element "${WINDOWS_PROGRAMS_CONTROL_PANEL}" Should Be "Visible" Before Timeout
    #Set Focus To "Programs and Features" Window
    Element "${WINDOWS_FREELANCER_DESKTOP_APP_IN_CONTROL_PANEL}" Should Be "Visible" Before Timeout
    Hover At Pattern    ${WINDOWS_FREELANCER_DESKTOP_APP_IN_CONTROL_PANEL}
    Right Click Pattern    ${WINDOWS_FREELANCER_DESKTOP_APP_IN_CONTROL_PANEL}
    Press Keyboard Key    DOWN
    Press Keyboard Key    ENTER
    Element "${WINDOWS_UNINSTALL_CONFIRMATION_DIALOG}" Should Be "Visible" Before Timeout
    Click OS "Uninstall Yes" "Button"
    Element "${WINDOWS_UNINSTALL_SUCCESSFULL_DIALOG}" Should Be "Visible" Before Timeout
    Click OS "Uninstall Complete OK" "Button"
    Set Focus To "Programs and Features" Window
    Press Keyboard Key    CTRL + w


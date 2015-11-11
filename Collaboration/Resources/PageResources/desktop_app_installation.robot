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

The Freelancer Desktop App Is Installed
    The Freelancer Desktop App Should Be "Installed" Successfully

#===============================================================#
#                            WHEN
#===============================================================#
User Downloads The Freelancer Desktop App Installer
    [Documentation]    Pop-up should be disabled in firefox to bypass the download popup window. Reference: http://www.slideshare.net/AparnaNaik/selenium-webdriver-pop-up-handling
    Click "Start Tracking" "Button"
    Click "${g_OS_TYPE}" "Select Button"
    Click "Desktop App Download Now" "Button"

User "${p_installUninstall}" the Freelancer Desktop App
    Run Keyword If    '${g_OS_TYPE}' == 'WINDOWS'
    ...    User "${p_installUninstall}" Freelancer Desktop App In Windows

#===============================================================#
#                            THEN
#===============================================================#
The Freelancer Desktop App Installer Should Be Successfully Downloaded
    Wait Until "Freelancer Desktop App Installer" Is Downloaded
    File "Freelancer Desktop App Installer" Should "Exist"
    The File Size of Freelancer Desktop App Installer Should be Correct

The Freelancer Desktop App Should Be "${p_installationState}" Successfully
    ${p_state} =    Set Variable If
    ...    '${p_installationState}' == 'Installed'    Exist    Not Exist

    Directory "Freelancer Desktop App Executable Path" Should "${p_state}"
    File "Freelancer Desktop App Executable" Should "${p_state}"

The File Size of Freelancer Desktop App Installer Should be Correct
    Get "Freelancer Desktop App Installer" File Size
    Should Be Equal As Strings    ${tc_FILE_SIZE}
    ...    ${${g_OS_TYPE}_FREELANCER_DESKTOP_APP_INSTALLER_FILE_SIZE}

#===============================================================#
#                    INTERNAL KEYWORDS
#===============================================================#
Run "${p_file}" Installer
    Open Application    ${${g_OS_TYPE}_FREELANCER_DESKTOP_APP_INSTALLER_PATH}/${${g_OS_TYPE}_${p_file}_INSTALLER}

User "${p_installUninstall}" Freelancer Desktop App In Windows
    [Documentation]    This keyword install/uninstalls the Freelancer Desktop App in Windows. Note that the UAC must be disabled in the Registry Editor inorder for sikuli to access the windows setup.
    Run Keyword If    '${p_installUninstall}' == 'Installs'    Run Keywords
    ...    Run "Freelancer Desktop App" Installer
    ...    AND    Element "${WINDOWS_SETUP_WIZARD}" Should Be "Visible" Before Timeout
    ...    AND    Repeat Keyword    4 times    Click OS "Setup Next" "Button"
    ...    AND    Click OS "Setup Install" "Button"
    ...    AND    Element "${WINDOWS_COMPLETING_INSTALLATION_DIALOG}" Should Be "Visible" Before Timeout
    ...    AND    Click OS "Setup Launch App" "Button"    # Unchecks the Launch Application checkbox
    ...    AND    Click OS "Setup Finish" "Button"
    ...    ELSE    Run Keywords
    ...    Run Command    control appwiz.cpl
    ...    AND    Element "${WINDOWS_PROGRAMS_CONTROL_PANEL}" Should Be "Visible" Before Timeout
    ...    AND    Element "${WINDOWS_FREELANCER_DESKTOP_APP_IN_CONTROL_PANEL}" Should Be "Visible" Before Timeout
    ...    AND    Hover At Pattern    ${WINDOWS_FREELANCER_DESKTOP_APP_IN_CONTROL_PANEL}
    ...    AND    Right Click Pattern    ${WINDOWS_FREELANCER_DESKTOP_APP_IN_CONTROL_PANEL}
    ...    AND    Press Keyboard Key    DOWN
    ...    AND    Press Keyboard Key    ENTER
    ...    AND    Element "${WINDOWS_UNINSTALL_CONFIRMATION_DIALOG}" Should Be "Visible" Before Timeout
    ...    AND    Click OS "Uninstall Yes" "Button"
    ...    AND    Element "${WINDOWS_UNINSTALL_SUCCESSFULL_DIALOG}" Should Be "Visible" Before Timeout
    ...    AND    Click OS "Uninstall Complete OK" "Button"
    ...    AND    Set Focus To "Programs and Features" Window
    ...    AND    Press Keyboard Key    ALT + F4


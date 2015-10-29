*** Settings ***
Resource          ../CommonResources/desktop_app_global_helper.robot
Resource          ../Variables/desktop_app_installation_constants.robot

*** Keywords ***
#===============================================================#
#                            GIVEN
#===============================================================#
The Desktop App Installer Exists In Download Directory
    Installer Should Exist In "${OS_TYPE}" Download Directory

User Runs The Freelancer Desktop App
    Open Application    Freelancer Desktop App    ${${OS_TYPE}_DESKTOP_APP_EXECUTABLE}

#===============================================================#
#                            WHEN
#===============================================================#
User Downloads The Desktop App Installer
    User Clicks "${OS_TYPE} Select" "Button"
    User Clicks "Desktop App Download Now" "Button"
    Run And Wait Until Keyword Succeeds    User Clicks "Save File" Region

User Runs the Desktop App Installer
    Start Process    ${${OS_TYPE}_DOWNLOAD_DIRECTORY}/${${OS_TYPE}_DESKTOPAPP_INSTALLER}
    Set Focus To "Setup - Freelancer Desktop App" Window
    Repeat Keyword    4 times    User Clicks Desktop App "Setup Next" "Button"
    User Clicks Desktop App "Setup Install" "Button"
    Wait Until Pattern Is Visible
    User Clicks Desktop App "Setup Finish" "Button"
#===============================================================#
#                            THEN
#===============================================================#
The Desktop App Installer Should Be Successfully Downloaded
    Wait Until Created    ${${OS_TYPE}_DOWNLOAD_DIRECTORY}/${${OS_TYPE}_DESKTOPAPP_INSTALLER}
    The Desktop App Installer Should Exist In Download Directory
    The File Size of Desktop App Installer Should be Correct

The Desktop App Installer Should Be Successfully Installed
    Directory Should Not Be Empty    ${${OS_TYPE}_APPLICATION_INSTALLATION_DIRECTORY}
    File Should Exist    ${${OS_TYPE}_DESKTOP_APP_EXECUTABLE}

The File Size of Desktop App Installer Should be Correct
    Should Be Equal As Strings    ${DESKTOP_APP_INSTALLER_FILE_SIZE}
    ...    ${${OS_TYPE}_DESKTOPAPP_INSTALLER_FILE_SIZE}

The Desktop App Installer Should Exist In Download Directory
    File Should Exist    ${${OS_TYPE}_DOWNLOAD_DIRECTORY}/${${OS_TYPE}_DESKTOPAPP_INSTALLER}

The Update Checker Should Be Displayed
    List Of Patterns Should Be Visible    @{UPDATE_CHECKER_CORE_ELEMENTS_LIST}

#===============================================================#
#                    INTERNAL KEYWORDS
#===============================================================#

Get File Size Of Windows Desktop App Installer
    ${t_DesktopAppInstallerFileSize}=
    ...    Get File Size    ${${OS_TYPE}_DOWNLOAD_DIRECTORY}/${${OS_TYPE}_DESKTOPAPP_INSTALLER}
    ${t_DesktopAppInstallerFileSize}=    Convert To String    ${t_DesktopAppInstallerFileSize}
    Set Test Variable    ${DESKTOP_APP_INSTALLER_FILE_SIZE}    ${t_DesktopAppInstallerFileSize}


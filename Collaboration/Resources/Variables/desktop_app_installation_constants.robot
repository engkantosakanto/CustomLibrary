*** Variables ***
#******************************************************************************#
#                             TEMP
#******************************************************************************#
${TIMEOUT}                                     8
${PASSWORD}                                    free123
#******************************************************************************#
#                             PATTERN LIBRARY
#******************************************************************************#
${WINDOWS_PATTERN_LIBRARY_DIRECTORY}           freelancer-desktop-app_windows-installer.exe

#******************************************************************************#
#      Desktop App Web Constants: https://www.freelancer.com/desktop-app/
#******************************************************************************#
${START_TRACKING_BUTTON}                       id = desktop-app-download-btn
${DESKTOP_APP_MODAL}                           id = desktop-app-modal
${DESKTOP_APP_MODAL_HEADER}                    ${DESKTOP_APP_MODAL} .modal-header
${DESKTOP_APP_MODAL_BODY}                      ${DESKTOP_APP_MODAL} .modal-body
${WINDOWS_SELECT_BUTTON}                       ${DESKTOP_APP_MODAL_BODY} .windows-select.select
${LINUX_SELECT_BUTTON}                         ${DESKTOP_APP_MODAL_BODY} .linux-select.select
${MAC_SELECT_BUTTON}                           ${DESKTOP_APP_MODAL_BODY} .mac-select
${DESKTOP_APP_SELECTOR_FORM}                   ${DESKTOP_APP_MODAL_BODY} .default-form
${WINDOWS_SELECTOR}                            ${DESKTOP_APP_SELECTOR_FORM} #wwindows-selector
${WINDOWS_SELECTOR_DROPDOWN}                   ${WINDOWS_SELECTOR} #windows-select-opt
${WINDOWS_REQUIREMENT_LINK}                    ${WINDOWS_SELECTOR} #win-ver-require
${LINUX_SELECTOR_DROPDOWN}                     ${DESKTOP_APP_SELECTOR_FORM} #linux-select-opt
${MAC_SELECTOR_DROPDOWN}                       ${DESKTOP_APP_SELECTOR_FORM} #mac-select-opt
${DESKTOP_APP_DOWNLOAD_NOW_BUTTON}             ${DESKTOP_APP_MODAL_BODY} .download-app-btn

#******************************************************************************#
#                             Offsets: x, y, width, height
#******************************************************************************#
#==================================================#
#           Setup Elements - Region Offsets
#==================================================#
${WINDOWS_SAVE_FILE_BUTTON_REGION}                258, 146, -364, -162
${WINDOWS_CANCEL_BUTTON_REGION}                   344, 146, -364, -162

${WINDOWS_SETUP_NEXT_BUTTON_REGION}               332, 353, -430, -368
${WINDOWS_SETUP_INSTALL_BUTTON_REGION}            ${WINDOWS_SETUP_NEXT_BUTTON_REGION}
${WINDOWS_SETUP_FINISH_BUTTON_REGION}             ${WINDOWS_SETUP_NEXT_BUTTON_REGION}
${WINDOWS_SETUP_LAUNCH_APP_BUTTON_REGION}         181, 178, -488, -373

${WINDOWS_UNINSTALL_YES_BUTTON_REGION}            282, 122, -395, -136
${WINDOWS_UNINSTALL_CANCEL_BUTTON_REGION}         378, 122, -395, -136
${WINDOWS_UNINSTALL_COMPLETE_OK_BUTTON_REGION}    388, 122, -400, -137

#==================================================#
#         Home Page Elements  - Region Offsets
#==================================================#
${HOMEPAGE_EXPANDCONTEXTMENU_BUTTON_REGION}    205, 60, -1014, -630
${HOMEPAGE_HELP_CONTEXT_MENU_REGION}           116, 92, -910, -612
${HOMEPAGE_ABOUT_CONTEXT_MENU_REGION}          116, 122, -910, -612
${HOMEPAGE_FEEDBACK_CONTEXT_MENU_REGION}       116, 160, -910, -612
${HOMEPAGE_LOGOUT_CONTEXT_MENU_REGION}         116, 190, -910, -612

${HOMEPAGE_LOGOUT_CONFIRM_BUTTON_REGION}       181, 95, -345, -112
${HOMEPAGE_LOGOUT_CANCEL_BUTTON_REGION}        312, 95, -345, -112
${HOMEPAGE_LOGOUT_CLOSE_BUTTON_REGION}         312, 95, -345, -112

#******************************************************************************#
#                         DIRECTORY AND PATTERN DIRECTORY
#******************************************************************************#
#Directories are relative to the Default Pattern Library Directory set during setup
#==================================================#
#                 Setup Elements - Patterns
#==================================================#
${WINDOWS_DIRECTORY}                                   Windows
${WINDOWS_SETUP_DIRECTORY}                             ${WINDOWS_DIRECTORY}/Setup
${WINDOWS_COMPLETING_INSTALLATION_DIALOG}              ${WINDOWS_SETUP_DIRECTORY}/WINDOWS_COMPLETING_INSTALLATION_DIALOG.png
${WINDOWS_UNINSTALL_CONFIRMATION_DIALOG}               ${WINDOWS_SETUP_DIRECTORY}/WINDOWS_UNINSTALL_CONFIRMATION_DIALOG.png
${WINDOWS_PROGRAMS_CONTROL_PANEL}                      ${WINDOWS_SETUP_DIRECTORY}/WINDOWS_PROGRAMS_CONTROL_PANEL.png
${WINDOWS_DESKTOP_APP_IN_CONTROL_PANEL}                ${WINDOWS_SETUP_DIRECTORY}/WINDOWS_DESKTOP_APP_IN_CONTROL_PANEL.png
${WINDOWS_UNINSTALL_SUCCESSFULL_DIALOG}                ${WINDOWS_SETUP_DIRECTORY}/WINDOWS_UNINSTALL_SUCCESSFULL_DIALOG.png

${COMMON_UPDATE_CHEKER_FOLDER}                         Common/UpdateChecker
${UPDATE_CHECKER_BACKGROUND}                           ${COMMON_UPDATE_CHEKER_FOLDER}/UPDATE_CHECKER_BACKGROUND.png
${UPDATE_CHECKER_STATUS}                               ${COMMON_UPDATE_CHEKER_FOLDER}/UPDATE_CHECKER_STATUS.png
@{UPDATE_CHECKER_CORE_PATTERNS_LIST}                   ${UPDATE_CHECKER_BACKGROUND}    ${UPDATE_CHECKER_STATUS}

#******************************************************************************#
#                             File Path/Directories
#******************************************************************************#
#Test pc or node should pre-set the download directory as specified
${WINDOWS_DOWNLOAD_DIRECTORY}                    C:/Downloads
${WINDOWS_DESKTOPAPP_INSTALLER}                  ${WINDOWS_DOWNLOAD_DIRECTORY}/freelancer-desktop-app_windows-installer.exe
${WINDOWS_APPLICATION_INSTALLATION_DIRECTORY}    C:/Program Files (x86)/Freelancer.com/Freelancer Desktop App
${WINDOWS_DESKTOP_APP_EXECUTABLE}                ${WINDOWS_APPLICATION_INSTALLATION_DIRECTORY}/freelancer-desktop-app.exe

#******************************************************************************#
#                             Installer File Size
#******************************************************************************#
${WINDOWS_DESKTOPAPP_INSTALLER_FILE_SIZE}     58995885

#******************************************************************************#
#                             Desktop App Name
#******************************************************************************#
${FREELANCER_DESKTOP_APP_NAME}                 Freelancer Desktop App

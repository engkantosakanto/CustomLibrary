*** Variables ***
#==================================================#
#          Login Elements - Region Offsets
#==================================================#
${LOGIN_WITH_FACEBOOK_BUTTON_REGION}           30, 150, -60, -512
${LOGIN_USERNAME_EMAIL_TEXTFIELD_REGION}       30, 255, -60, -512
${LOGIN_PASSWORD_TEXTFIELD_REGION}             30, 310, -60, -512
${LOGIN_BUTTON_REGION}                         30, 370, -60, -512
${FBLOGIN_EMAIL_OR_PHONE_TEXTFIELD_REGION}     136, 112, -233, -287
${FBLOGIN_PASSWORD_TEXTFIELD_REGION}           136, 144, -233, -287
${FBLOGIN_FORGOT_PASSWORD_LINK_REGION}         132, 206, -308, -294
${FBLOGIN_LOGIN_BUTTON_REGION}                 292, 267, -370, -288
${FBLOGIN_CANCEL_BUTTON_REGION}                352, 272, -370, -288

#==================================================#
#                Login Elements - Patterns
#==================================================#
${COMMON_LOGIN_FOLDER}                                 Common/Login
${DESKTOP_APP_LOGIN_PAGE}                              ${COMMON_LOGIN_FOLDER}/LOGIN_PAGE.PNG
${FBLOGIN_LOGIN_PAGE}                                  ${COMMON_LOGIN_FOLDER}/FACEBOOK_LOGIN_PAGE.png

#==================================================#
#            Home Page Elements - Patterns
#==================================================#
${HOMEPAGE_LOGIN_FOLDER}                               Common/HomePage
${HOMEPAGE_BROWSE_PROJECTS_BUTTON}                     ${HOMEPAGE_LOGIN_FOLDER}/HOMEPAGE_BROWSE_PROJECTS_BUTTON.png
${HOMEPAGE_CLOCK_ICON}                                 ${HOMEPAGE_LOGIN_FOLDER}/HOMEPAGE_CLOCK_ICON.png
${HOMEPAGE_MY_WORK_SECTION}                            ${HOMEPAGE_LOGIN_FOLDER}/HOMEPAGE_MY_WORK_SECTION.png
${HOMEPAGE_CONTEXT_MENU}                               ${HOMEPAGE_LOGIN_FOLDER}/HOMEPAGE_CONTEXT_MENU.png
${HOMEPAGE_LOGOUT_CONFIRMATION_DIALOG}                 ${HOMEPAGE_LOGIN_FOLDER}/HOMEPAGE_LOGOUT_CONFIRMATION_DIALOG.png
@{NEW_USER_HOMEPAGE_CORE_PATTERNS_LIST}                ${HOMEPAGE_BROWSE_PROJECTS_BUTTON}    ${HOMEPAGE_CLOCK_ICON}
...    ${HOMEPAGE_MY_WORK_SECTION}

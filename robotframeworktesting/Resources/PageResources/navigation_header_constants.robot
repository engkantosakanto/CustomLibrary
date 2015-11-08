*** Settings ***
Documentation     This resource file will contain all locators/elements for navigation header
...    the urls can be called from the global URL_EXT file
Resource    url_extension_constants.robot

*** Variables ***
#================= NEW HEADER =============
${HEADER_PRIMARY_FL_HEADER}                             css=.fl-header
#================= OLD HEADER =============
${HEADER_FREELANCER_LOGO}                               css=.primary-header-logo-and-network
${HEADER_LOGIN_BUTTON}                                  css=#login-normal
${HEADER_SIGN_UP_BUTTON}                                css=#sign-up
${HEADER_POST_PROJECT_BUTTON}                           css=#header-post-project
${HEADER_PRIMARY_HEADER}                                css=header
${HEADER_PRIMARY_NAVIGATION}                            css=.primary-nav
#============================= SEARCH ==============================
${HEADER_LOGGED_IN_SEARCH}                              css=.header-search
${HEADER_LOGGED_IN_MESSAGE_ICON}                        css=#tabmanager_pmbs
${HEADER_LOGGED_IN_REAL_TIME_ICON}                      css=#tabmanager_notify
${HEADER_LOGGED_IN_LIVE_ICON}                           css=#tabmanager_live
${HEADER_PRIMARY_NAV_CLASS}                             primary-nav-link
${HEADER_SUB_NAV_CLASS}                                 subnav-link
#===================== PROFILE FIGURE AND SUB NAV ========================
${HEADER_LOGGED_IN_PROFILE_FIGURE}                      css=.header-user #profile-figure
${HEADER_LOGGED_IN_PROFILE_FIGURE_LOGOUT}               css=.flicon-logout
#===================== HIRE FREELANCERS AND SUB NAV ======================
${HEADER_NAV_ITEM_HIRE_FREELANCERS}                     css=a.${HEADER_PRIMARY_NAV_CLASS}[ng-href='${PP_SIGNUP_POST_PROJ_URL}']
${HEADER_NAV_ITEM_LOGGEDOUT_HIRE_FREELANCERS}           css=a.${HEADER_PRIMARY_NAV_CLASS}[href='${PP_SIGNUP_POST_PROJ_URL}']
${HEADER_SUB_NAV_START_A_PROJECT}                       css=a[class='${HEADER_SUB_NAV_CLASS}'][href='${PP_SIGNUP_POST_PROJ_URL}']
${HEADER_SUB_NAV_START_A_CONTEST}                       css=a[class='${HEADER_SUB_NAV_CLASS}'][href='${PCP_URL}']
${HEADER_SUB_NAV_BROWSE_DIRECTORY}                      css=a.${HEADER_SUB_NAV_CLASS}[ng-href='${FREELANCER_DIRECTORY_URL_EXT}']
${HEADER_SUB_NAV_PROJECT_SHOWCASE}                      css=a[class='${HEADER_SUB_NAV_CLASS}'][href='${PROJECT_SHOWCASE_URL_EXT}']
#=========================== WORK AND SUB NAV ============================
${HEADER_LOGGED_IN_NAV_ITEM_WORK}                       css=a[class='${HEADER_PRIMARY_NAV_CLASS}'][href='${MYSKILLS_JOB_URL_EXT}']
${HEADER_LOGGED_OUT_NAV_ITEM_WORK}                      css=a[class='${HEADER_PRIMARY_NAV_CLASS}'][href='${PVP_JOB_URL_EXT}']
#========================= MY PROJECTS AND SUB NAV =======================
${HEADER_LOGGED_IN_NAV_ITEM_MY_PROJECTS}                css=a[class='${HEADER_PRIMARY_NAV_CLASS}'][href='${MY_PROJECT_URL_EXT}']
#========================= FINANCES AND SUB NAV =======================
${HEADER_LOGGED_IN_NAV_ITEM_FINANCES}                   css=a[class='${HEADER_PRIMARY_NAV_CLASS}'][href='${FINANCIAL_DASHBOARD_URL_EXT}']
#========================= HOW IT WORKS AND SUB NAV =======================
${HEADER_LOGGED_OUT_NAV_ITEM_HOW_IT_WORKS}              css=a[class='${HEADER_PRIMARY_NAV_CLASS}'][href='${HOW_IT_WORKS_URL_EXT}']
#======================== LOGGED IN : SIDE BAR ========================
${HEADER_SIDEBAR}                                      .sidebar
${HEADER_SIDEBAR_PROFILE_IMAGE}                         css=${HEADER_SIDEBAR} .profile-img img
${HEADER_SIDEBAR_USERNAME}                              css=${HEADER_SIDEBAR} .user-sidebar-name
${HEADER_SIDEBAR_UPGRADE_BUTTON}                        css=${HEADER_SIDEBAR} a[fl-analytics='UpgradeButton']
${HEADER_SIDEBAR_MEMBERSHIP}                            css=${HEADER_SIDEBAR} a[fl-analytics='Membership']
${HEADER_SIDEBAR_PROFILE}                               css=${HEADER_SIDEBAR} a[fl-analytics='Profile']
${HEADER_SIDEBAR_MY_SKILLS}                             css=${HEADER_SIDEBAR} a[fl-analytics='MySkills']
${HEADER_SIDEBAR_MY_REWARDS}                            css=${HEADER_SIDEBAR} a[fl-analytics='MyRewards']
${HEADER_SIDEBAR_INVITE_FRIENDS}                        css=${HEADER_SIDEBAR} a[fl-analytics='InviteFriends']
${HEADER_SIDEBAR_HELP}                                  css=${HEADER_SIDEBAR} a[fl-analytics='Help']
${HEADER_SIDEBAR_SETTINGS}                              css=${HEADER_SIDEBAR} a[fl-analytics='Settings']
${HEADER_SIDEBAR_LOGOUT}                                css=${HEADER_SIDEBAR} a[fl-analytics='Logout']
#=============================================#
#        HEADER ACTIONS : MESSAGES
#=============================================#
${HEADER_ACTION_MESSAGES_TAB}                           css=#tabmanager_pmbs
${HEADER_ACTION_NOTIFY_MESSAGE_ICON}                    ${HEADER_ACTION_MESSAGES_TAB} #message-icon
${HEADER_ACTION_NOTIFY_MESSAGE_NOTIFICATION}            ${HEADER_ACTION_MESSAGES_TAB} #message-notification
${HEADER_ACTION_NOTIFY_SEE_ALL_MESSAGES_LINK}           ${HEADER_ACTION_MESSAGES_TAB} .notification-popover-more-bt
${HEADER_ACTION_NOTIFY_MESSAGE_LIST}                    ${HEADER_ACTION_NOTIFY_MESSAGE_NOTIFICATION} ol.notification-popover-thread
${HEADER_ACTION_NOTIFY_FIRST_MESSAGE}                   ${HEADER_ACTION_NOTIFY_MESSAGE_LIST} li.notification-popover-item:first-child
#=============================================#
#        HEADER ACTIONS : REALTIME
#=============================================#
${HEADER_ACTION_NOTIFY_TAB}                             css=#tabmanager_notify
${HEADER_ACTION_NOTIFY_REALTIME_ICON}                   ${HEADER_ACTION_NOTIFY_TAB} #realtime-icon
${HEADER_ACTION_REALTIME_NOTIFICATION}                  ${HEADER_ACTION_NOTIFY_TAB} #realtime-notification
${HEADER_ACTION_NOTIFICATION_POPOVER}                   ${HEADER_ACTION_REALTIME_NOTIFICATION} #user-notifications-popover-content
${HEADER_ACTION_FIRST_NOTIF_TEXT}                       ${HEADER_ACTION_REALTIME_NOTIFICATION} li:nth-of-type(2) .notification-item-text strong:nth-of-type(2)
#=============================================#
#        HEADER ACTIONS : PROJECT FEED
#=============================================#
${HEADER_ACTION_LIVE_FEED_TAB}                          css=#tabmanager_live
${HEADER_ACTION_NOTIFY_LIVE_FEED_ICON}                  ${HEADER_ACTION_LIVE_FEED_TAB} #live-icon

${HEADER_NOTIFICATION_DOT_ALERT}                        .is-flagged
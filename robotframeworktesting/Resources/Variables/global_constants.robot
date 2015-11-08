*** Settings ***
Documentation    This file contains all the global variable available on Freelancer.com Website

*** Variables ***
${MD5}                                  fe2512f2ce74c5b64d3eb061766f76c0
${g_PROJECT_URL}                         Actual Value Will Be Fetched From Get Project Url Keyword
${CONTACT_LIST_HEADER_L}                css=header[class='contacts-header']
${ACCOUNT_BAL_LOCATOR}                  css=span[class='user-balance-total']
${PROFILE_STICKY_HEADER}                div#sticky-hireme
${TIMEOUT}                              20 sec
${INTERVAL}                             4 sec
${PROD_URL}                             www.freelancer.com
${SETTINGS_LOCATION_FIELD}              css=#location
${SKILLS_PAGE_LOCATION_FIELD}           css=#local-location-input-id
${SKILLS_PAGE_LOCATION_FIRST_ITEM}      css=div.pac-item:nth-child(1) span:nth-child(2)
${POST_PROJECT_LOCATION_FIELD}          css=input#project-location
#==================================================#
#                FLOATING ELEMENTS
#==================================================#

${WHITE_HEADER}                         css=header.fl-header
${LOGOOUT_WHITE_HEADER}                 css=.primary-header
${TOAST_CONTAINER}                      css=#toast-notifications-wrapper     #toast-container
${CONTACT_LIST_FORM}                    css=#contacts
${CHAT_BOX}                             css=#chatNG
${CHAT_WINDOW}                          css=.chat-window
${STICKY_BAR}                           css=#sticky-bar
${POST_SITE_HEADER}                     css=header.fm-header
#==================================================#
#                PROJECT TEST DATA
#==================================================#
${MILESTONE_REQUEST_DESCRIPTION}        This is a test for milestone request
${PASSWORD}                             The value is stored securely
${PROJECT_DESCRIPTION}                  This Is A Test Description\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE\nPLEASE IGNORE
${PROPOSAL_MESSAGE}                     This is a proposal.\nThis is a proposal.\nThis is a proposal.\nThis is a proposal.\nThis is a proposal.\nThis is a proposal.\nThis is a proposal.\nThis is a proposal.\n
${FEEDBACK_COMMENT}                     Great Job! This person is very professional and provides high quality service
${HOURLY_BUDGET}                        61     # This is value attribute of Basic ($2-8 USD)
${FIX_BUDGET}
#==================================================#
#                     LANGUAGE
#==================================================#
${LANGUAGE}                             English
${LANGUAGE_TRANSLATION_FILE}            language_${LANGUAGE}_translation.robot
#==================================================#
#                     ALIAS
#==================================================#
@{EMPLOYERS_LIST}                       Employer    Service Buyer    Contest Holder
${EMPLOYER_BROWSER_PREFIX}              firstBrowser
${FREELANCER_BROWSER_PREFIX}            secondBrowser
#==================================================#
#                     ANGULAR CONTAINER
#==================================================#
${ANGULAR_CONTAINER}                    div.main-content div[fl-app]
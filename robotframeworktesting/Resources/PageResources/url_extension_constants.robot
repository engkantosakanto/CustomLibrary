*** Settings ***
Documentation    This variable files contains all the url extension of Freelancer.com Website

*** Variables ***
${BCP_URL_EXT}                                  /contest/browse/
${PP_POST_PROJ_URL}                             /post-project
${CONTEST_HOME_URL_EXT}                         /contest/
${CONTEST_HOME_PAGE_URL_EXT}                    /contest/?ab=0
${CEP_URL_EXT}                                  /contest-info
${DFP_URL}                                      /dashboard/feedback.php
${DASHBOARD_EXT}                                /dashboard/
${MY_PROJECT_URL_EXT}                           ${DASHBOARD_EXT}/projects.php
${FREELANCER_DIRECTORY_URL_EXT}                 /freelancers/
${FIND_FREELANCER_URL}                          /freelancers/skills/all/
${FIN_DB_EXT}                                   /users/financial-dash/
${FAQ_PAGE_EXT}                                 /faq/view.php
${UMP_URL_EXT}                                  /users/messages/index.php
${IFP_URL_EXT}                                  /invite
${FREELANCE_PROJECTS_URL_EXT}                   /job/
${ENDING_JOB_URL}                               /jobs/ending/1/
${FEATURED_JOB_URL}                             /jobs/featured/1/
${FIND_PROJ_URL}                                /jobs/Project/1/
${MYSKILLS_JOB_URL_EXT}                         /jobs/myskills/1/
${HIRE_FL_URL}                                  /hire/
${LOGGED_OUT_URL_EXT}                           /logged-out/
${PVP_URL_EXT}                                  /projects/
${PVP_JOB_URL_EXT}                              /jobs
${PP_SIGNUP_POST_PROJ_URL}                      /post-project
${PCP_URL}                                      /contest/create.php
${USP_SKILL_SELECT_EXT}                         /sellers/skill-select.php
${SPP_URL_EXT}                                  /sites/sell/
${SVP_URL_EXT}                                  /sites/verify/
${PSP_EXT_URL}                                  /showcase/create
${SETTINGS_PAGE_URL_EXT}                        /users/settings.php
${SVP_EXT_URL}                                  /services/
${SERVICES_URL_EXT}                             /services/
${CREATE_URL_EXT}                               create.php
${SBP_SANDBOX_URL_EXT}                          /translation/sandbox.php
${MY_REWARDS_PAGE_URL_EXT}                      /users/game/
${PROJECT_UPGRADE_URL_EXT}                      /buyers/project-upgrades
${DEFAULT_LOGIN_URL}                            /login
${KYC_URL_EXT}                                  /users/kyc/verificationCenterHome.php
${WITHDRAW_FUND_URL_EXT}                        /payments/withdraw.php
${WITHDRAW_FUND_SKRILL_URL_EXT}                 /payments/withdraw/withdraw.php?method=withdraw.moneybookers
${WITHDRAW_FUND_SKRILL_CONFIRM_URL_EXT}         /payments/withdraw/confirm.php
${PAYMENT_VERIFICATION_URL_EXT}                 /payments/verify.php
${ACCOUNT_SETTINGS_URL_EXT}                     ${SETTINGS_PAGE_URL_EXT}#AccountSettings
${EMAIL_NOTIFICATION_SETTINGS_URL_EXT}          ${SETTINGS_PAGE_URL_EXT}#EmailSettings
${PAYMENT_VERIFY_URL_EXT}                       /payments/verify.php?ref=menu_submenu2
${DEPOSIT_FUND_URL_EXT}                         /deposit
${FINANCIAL_DASHBOARD_URL_EXT}                  /users/financial-dash/
${PROJECT_SHOWCASE_URL_EXT}                     /showcase
${HOW_IT_WORKS_URL_EXT}                         /info/how-it-works.php
${HOME_PAGE_EXT}                                /?t=b
${TRANSACTION_HISTORY_EXT}                      /payments/transactions.php
${SERVICES_DASHBOARD_URL_EXT}                   /services/dashboard.php
${FIND_FREELANCE_WORK_URL_EXT}                  /work/
${REPOST_PROJ_URL_EXT}                          /jobs/Wordpress/Adobe-Fireworks-Graphic-with-Hotspots
${DEPOSIT_FUND_CONFIRM_URL_EXT}                 /payments/deposit.php#deposit.worldpay
${DEPOSIT_FUND_COMPLETE_URL_EXT}                /payments/worldpay.php?complete=true
${FEEDBACK_URL_EXT}                             /users/review/rate.php?
#==================================================#
#                      AFFILIATES
#==================================================#
${AFFILIATES_HIREME_URL_EXT}                    /hireme
${AFFILIATES_HIREME_WIDGET_BUILDER_URL_EXT}     /hireme-widget-builder
${AFFILIATES_HOME_PAGE_URL_EXT}                 /affiliates
${AFFILIATES_BANNER_BUILDER_URL_EXT}            /affiliates-banner-builder
${AFFILIATES_EARNINGS_URL_EXT}                  /affiliate-earnings
#==================================================#
#                       SIGN-UP
#==================================================#
${SIGNUP_URL_EXT}                               /signup.php
${SIGNUP_PAGE_SECURED_URL_EXT}                  /users/signup.php?secured_connection=3xwKX0N7Df8h817Wfhls3yle8ZyiRi9kLiMRlcNa0OxD7R25WGmotCHhMS2nnOu
${HOME_PAGE_SECURED_URL_EXT}                    ?/users/signup.php?secured_connection=3xwKX0N7Df8h817Wfhls3yle8ZyiRi9kLiMRlcNa0OxD7R25WGmotCHhMS2nnOu
${SIGNUP_OLD_URL_EXT}                           /signup?utm_expid=294858-318.KkgRVHlATK28Y12yXdvcRg.0
#===================================================#
#                       EXAMS                       #
#===================================================#
${EXAM_PAGE_URL}                                /exam/exams/index.php
${EXAM_SUMMARY_PAGE_URL_EXT}                    /exam/exams/buy.php
${EXAM_INTERNAL_PAGE_URL_EXT}                   /exam/my_exams/ajax_ui.php
${EXAM_RESULT_PAGE_URL_EXT}                     /exam/results/show.php
#===================================================#
#                     MY PROJECTS                   #
#===================================================#
${MY_PROJECT_URL_EXT}                           ${DASHBOARD_EXT}/projects.php
#===================================================#
#                     MEMBERSHIP                    #
#===================================================#
${MEMBERSHIP_URL_EXT}                           /membership
#===================================================#
#                     UNSUBSCRIBE                   #
#===================================================#
${UNSUBSCRIBE_DIRECT_URL_EXT}                   /users/email/settings.php?token=2538d613e0f31f7d8333bf52d89da700ee30eca7&userid=13816343&expiration_time=1435989119
#===================================================#
#                       OTHERS                      #
#===================================================#
${BROWSE_PAGE_URL_EXT}                          /jobs/1
${BOOKMARK_PAGE_URL_EXT}                        /jobs/bookmark
#===================================================#
#                     LOCAL JOBS                    #
#===================================================#
${BROWSE_LOCAL_JOB_PAGE_URL_EXT}                /jobs/t-local
${GUEST_USER_LOCAL_LANDING_PAGE_URL_EXT}        /local/
${GET_LOCAL_JOB_URL_EXT}                        ${GUEST_USER_LOCAL_LANDING_PAGE_URL_EXT}/getjobs
${MY_BUSINESS_CARD_URL_EXT}                     /business-cards/create.php#/

#===================================================#
#                 FOOTER: ABOUT US                  #
#===================================================#
${ABOUT_US_URL_EXT}                            /about
${PRIVACY_URL_EXT}                             /about/privacy
${TERMS_&_CONDITIONS_URL_EXT}                  /about/terms
${FEES_&_CHARGES_URL_EXT}                      /feesandcharges/
${INVESTOR_URL_EXT}                            /investor
${COMMUNITY_URL_EXT}                           /community

#===================================================#
#                     PROFILE                       #
#===================================================#
${PROFILE_LOGGEDOUT_MY_PROFILE_URL_EXT}         /u/
${PROFILE_MY_PROFILE_URL_EXT}                   /me/
${MY_BUSINESS_CARD_URL_EXT}                     /business-cards/create.php#/
${PROFILE_URL_EXT}                              .html?preview=true
#===================================================#
#                      LOGIN   	                    #
#===================================================#
${DEFAULT_LOGIN_URL}                            /login
#===================================================#
#                  EXTERNAL SITES                   #
#===================================================#
${BLOGSPOT_SITE_URL}                            http://www.blogspot.com/
${BLOGSPOT_URL_EXT}                             blogger.com
${BLOGSPOT_PROFILE_URL_EXT}                     /profile
${BLOGSPOT_HIREME_WIDGET_BLOG}                  http://testaffiliateswidgets.blogspot.com/
#===================================================#
#               PAGES WITH AB TEST PARAMETER        #
#===================================================#
${DEFAULT_LOGIN_ABTEST_PARAMETER}               t=db&
${DEFAULT_SIGNUP_ABTEST_PARAMETER}              t=b&
${PROFILE_LOGGEDOUT_VIEW_PARAMETER}             t=b&
#===================================================#
#                  SUPPORT HQ                     #
#===================================================#
${SUPPORT_HQ_URL_EXT}                           /support

#===================================================#
#               FREELANCER ADMIN                    #
#===================================================#
${FREELANCER_ADMIN_URL_EXT}                     /admin/
#===================================================#
#                   Freemarket / Sites              #
#===================================================#
${SITE_URL}                                     https://www.freemarket.com/sites/
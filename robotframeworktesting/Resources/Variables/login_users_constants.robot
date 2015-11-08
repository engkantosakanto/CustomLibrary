*** Settings ***
Documentation    This variable files contains all locators for login related functionality

*** Variables ***
#===========================================#
#          Pinterest Login Elements
#===========================================#
${PINT_USERNAME_FIELD}                 css=input[name='username']
${PINT_PASSWORD_FIELD}                 css=input[name='passwd']
${PINT_LOGIN_LINK}                     css=#login-normal
${PINT_LOGIN_FORM}                     css=#login-form
${PINT_LOGIN_BTN}                      css=#login-bt
${PINT_FB_LOGIN_BTN}                   css=#login-form-div .btn-facebook

#===========================================#
#           Modal Login Elements
#===========================================#
${MODAL_FORM}                          css=.header-login-modal
${MODAL_USERNAME_FIELD}                css=#username
${MODAL_PASSWORD_FIELD}                css=#passwd
${MODAL_LOGIN_LINK}                    css=.header-login-bt
${MODAL_LOGIN_DIV}                     css=#header-login-modal
${MODAL_LOGIN_BTN}                     css=#login_btn
${MODAL_FB_LOGIN_BTN}                  css=button.btn-facebook
${MODAL_LOGIN_ERROR_CNTR}              css=aside.login-error
${MODAL_CLOSED_ERROR_MSG_TEXT}         This account has been closed

#===========================================#
#           FB Window Login Elements
#===========================================#
${FB_WINDOW_NAME}                      title=Facebook
${FB_EMAIL_FIELD}                      css=#email
${FB_PASSWORD_FIELD}                   css=#pass
${FB_LOGIN_BTN}                        css=#loginbutton

#===========================================#
# Modal Login Elements PVP Logged Out
#===========================================#
${MODAL_SWITCH_LOGIN_BUTTON}           css=a.switch-to-login

#============================================#
#          Default Login Elements
#============================================#
${DF_USERNAME_FIELD}                   css=#usr_nm
${DF_PASSWORD_FIELD}                   css=#usr_pwd
${DF_LOGIN_LINK}                       css=#login-normal
${DF_LOGIN_DIV}                        css=#login_bs
${DF_LOGIN_BTN}                        css=#login_btn
${DF_PRIVATE_ERROR_MESSAGE}            css=div[class="span12 alert alert-error margin-0 padding-0 margin-b30"]
#============================================#
#          External Website Elements
#============================================#
${BLOGSPOT_USERNAME}                   css=#Email
${BLOGSPOT_PASSWORD}                   css=#Passwd
${BLOGSPOT_SIGN_IN_BTN}                css=#signIn

#============================================#
#          Login Assertion Variables
#============================================#
${FIND_FREELANCER_LOGO}                css=.primary-header-logo-and-network
${LOGIN_GETUSERID_COOKIE}              GETAFREE_USER_ID
${LOGIN_GETUSERID_COOKIE_FLN}          GETAFREEST_USER_ID

#==============================================#
#                 USER SELECT
#==============================================#
${USER_SELECT_CNTR}                    css=div[id='projectUserSelect']
${USER_TYPE_RETURNING_RBTN}            css=#userTypeReturning
${USER_TYPE_NEW_RBTN}                  css=#userTypeNew
#Returning User
${USERNAME_FIELD}                      id=post-proj-username
${PASSWORD_FIELD}                      id=post-proj-pwd
#New User
${NEW_EMAIL_FIELD}                     id=new-email
${NEW_USRNAME_FIELD}                   id=new-username
${NEW_PASSWORD_FIELD}                  id=passwd
${NEW_CONFIRM_PASSWORD_FIELD}          id=passwd1

#==============================================#
#          Login Error Message Elements......
#==============================================#
${LOGIN_SUSPENDED_ERROR_MSG_CNTR}                css=h1.margin-t30
${LOGIN_SUSPENDED_ERROR_MSG_TEXT}                Your account has been suspended.
${LOGIN_CLOSED_ERROR_MSG_CNTR}                   css=#login-error
${LOGIN_CLOSED_ERROR_MSG_TEXT}                   Oops! The login details you entered were incorrect.


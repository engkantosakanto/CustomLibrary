*** Variables ***
${BASE_URL}                     https://www.freelancer.com
${FIREFOX_PROFILE_DIR}          ${CURDIR}${/}firefoxprofile${/}


*** Keywords ***
Browser For External Website Is Launched
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}
    Setup Desired Capability
    Setup Password
    Run Keyword If    '${BROWSER}' == 'firefox'    Setup Server
    Run Keyword If    '${SERVER_IS_AWS}' == '1'
    ...    Open Browser    ${p_urlExt}    browser=${p_browser}    alias=${p_alias}
    ...    Log    ${FIREFOX_PROFILE_DIR}
    ...    remote_url=${LOCALHOST}    desired_capabilities=${DESIRED_CAPABILITY}    ff_profile_dir=${FIREFOX_PROFILE_DIR}
    ...    ELSE IF    '${SERVER_IS_AWS}' == '0'
    ...    Open Browser    ${p_urlExt}    browser=${p_browser}    alias=${p_alias}
    Set Window Size    1024    800
    Reload Page

Browser Is Open
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}
    Setup Desired Capabilities    ${p_alias}
    ${t_iePrivateBrowser}=    Evaluate    '${BROWSER}'=='ie' and '${p_alias}'=='${ALIAS2}'
    Run Keyword If    '${SERVER_IS_AWS}' == '1' or '${t_iePrivateBrowser}'=='True'
    ...    Browser Is Launched    ${p_urlExt}    ${p_browser}    ${p_alias}    ${LOCALHOST}    ${DESIRED_CAPABILITY}
    ...    ELSE IF    '${SERVER_IS_AWS}' == '0'    Browser Is Launched
    ...    ${p_urlExt}    ${p_browser}    ${p_alias}    ${EMPTY}    ${EMPTY}

Launch Browser Setup
    [Documentation]    The following arguments are required for this keyword
    ...    ${p_urlExtension}    ${p_browser}    ${p_alias}    ${p_nativeEvents}
    [Arguments]    ${p_urlExtension}    ${p_browser}    ${p_alias}    ${p_nativeEvents}
    ...    ${p_keyword_1}=No Operation    ${p_keyword_2}=No Operation    ${p_keyword_3}=No Operation    ${p_keyword_4}=No Operation
    Run Keyword If    ${p_nativeEvents}
    ...    Setup Desired Capability Native True    ELSE    Setup Desired Capability
    Browser Is Open    ${p_urlExtension}    ${p_browser}    ${p_alias}
    Run Keywords    ${p_keyword_1}    ${p_keyword_2}    ${p_keyword_3}    ${p_keyword_4}

#===============================================#
#             INTERNAL KEYWORDS                 #
#===============================================#
Browser Is Launched
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}    ${p_remoteUrl}    ${p_desiredCapability}
    Log    ${FIREFOX_PROFILE_DIR}
    Open Browser    ${BASE_URL}    browser=${p_browser}    alias=${p_alias}    remote_url=${p_remoteUrl}
    ...    desired_capabilities=${p_desiredCapability}    ff_profile_dir=${FIREFOX_PROFILE_DIR}
    Setup Password
    Setup Cookie
    Setup Browser Window Size
    Run And Wait Until Keyword Succeeds    Go To    ${BASE_URL}${p_urlExt}
    Get Cookie Value    ${FLN_COOKIE}
    Set Selenium Speed    .5
    Setup Global Timeout

Remove AB Test Cookie
    Delete Cookie    ${FLN_COOKIE}
    Reload Page

#--- Setters ---#
Setup Cookie
    Add Cookie    ${FLN_COOKIE}    true

Setup Server
    ${hasEnvVar} =    Run Keyword And Return Status    Get Environment Variable    AWS_ENABLED
    Run Keyword If    '${hasEnvVar}' == 'True'    Set Global Variable    ${SERVER_IS_AWS}    %{AWS_ENABLED}

Setup Password
    ${t_hasPasswordEnvVar} =    Run Keyword And Return Status    Get Environment Variable    PASSWORD
    Run Keyword If    ${t_hasPasswordEnvVar}    Set Global Variable    ${PASSWORD}    %{PASSWORD}

Setup Browser Window Size
    Run Keyword If    '${BASE_URL}'=='${MOBILE_BASE_URL}'    Set Window Size    384    640
    ...    ELSE IF    '${BASE_URL}'=='${ESCROW_BASE_URL}' or '${BASE_URL}'=='${ESCROW_FLN_URL}'    Maximize Browser Window
    ...    ELSE    Set Window Size    1024    800

Setup Global Timeout
    Run Keyword If    '${BASE_URL}'!='https://www.freelancer.com'
    ...    Set Global Variable    ${TIMEOUT}    40 sec

Setup Desired Capabilities
    [Arguments]    ${p_alias}
    Setup Server
    Run Keyword If    '${BROWSER}' == 'firefox' or '${BROWSER}' == 'chrome'    Setup Desired Capabilities For Firefox
    ...    ELSE IF    '${BROWSER}'=='ie' and '${p_alias}'=='${ALIAS1}'    Setup Desired Capabilities For IE
    ...    ELSE IF    '${BROWSER}'=d='ie' and '${p_alias}'=='${ALIAS2}'    Setup Desired Private Browsing Capabilities For IE
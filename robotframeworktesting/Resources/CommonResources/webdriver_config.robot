*** Settings ***
Library           Collections
Library           Selenium2Library

*** Variables ***
${BROWSER}              firefox
${PLATFORM}             WINDOWS
${VERSION}              25.
${NATIVE_EVENTS}        ${false}
${LOCALHOST}            http://localhost:4444/wd/hub
${DESIRED_CAPABILITY}   Dynamic
${SERVER_IS_AWS}        0
${ALIAS1}               browser1
${ALIAS2}               browser2
${FREELANCER_EXT}       /

*** Keywords ***
Setup Desired Capability
    Run Keyword If    '${BROWSER}'=='firefox' or '${BROWSER}'=='chrome'   Setup Desired Capabilities For Firefox

Setup Desired Capabilities For Firefox
    ${DC}    Create Dictionary    browserName=${BROWSER}
    Set To Dictionary    ${DC}    platform    ${PLATFORM}
    Set To Dictionary    ${DC}    version    ${VERSION}
    Set To Dictionary    ${DC}    nativeEvents    ${NATIVE_EVENTS}
    Log    ${DC}
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${DC}

Setup Desired Capability Native True
    ${DC}    Create Dictionary    browserName=${BROWSER}
    Set To Dictionary    ${DC}    platform    ${PLATFORM}
    Set To Dictionary    ${DC}    version    ${VERSION}
    Log    ${DC}
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${DC}

Setup Desired Private Browsing Capabilities For IE
    ${ie default dc}=    Evaluate   sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER    sys, selenium.webdriver
    ${DC}=   Copy Dictionary   ${ie default dc}
    Set To Dictionary    ${DC}   ie.forceCreateProcessApi   ${true}
    Set To Dictionary    ${DC}    ie.browserCommandLineSwitches   -private
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${DC}

Setup Desired Capabilities For IE
    ${ie default dc}=    Evaluate   sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER    sys, selenium.webdriver
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${ie default dc}
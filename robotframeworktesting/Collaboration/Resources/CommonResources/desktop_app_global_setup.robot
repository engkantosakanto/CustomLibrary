*** Settings ***
Resource          ../Variables/desktop_app_global_constants.robot
Library           Remote    ${FREELANCERSIKULIXROBOTLIBRARY_REMOTE_SERVER}
Library           Operating System
Resource          desktop_app_global_helper.robot
Resource          ../../../Resources/CommonResources/global_setup.robot

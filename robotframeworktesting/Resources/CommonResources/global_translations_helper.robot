*** Settings ***
Resource            ../Variables/translation_widget_constants.robot
Resource            ../Variables/translation_modal_constants.robot
Resource            ../Variables/translation_panel_constants.robot

*** Keywords ***
#===============================#
#             GIVEN             #
#===============================#
Number Of Votes Recorded
    [Arguments]    ${p_globalTranslationText}    ${p_voteCounterLocator}    ${p_essentialElementLocator}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${p_essentialElementLocator}
    ${t_vote} =    Get Number Of Votes Of Translation Suggestion    ${p_globalTranslationText}    ${p_voteCounterLocator}    ${p_essentialElementLocator}
    Set Test Variable    ${tc_VOTE_COUNT}    ${t_vote}

#===============================#
#             WHEN              #
#===============================#
User Selects Language
    [Arguments]     ${p_languageLocator}    ${p_language}
    Select From List By Value    ${p_languageLocator}    ${p_language}

User Clicks Vote Translation Button
    [Arguments]     ${p_translationText}    ${p_voteButtonLocator}
    Execute Javascript    jQuery('*:contains("${p_translationText}"):last').parent().find('${p_voteButtonLocator}').click()

#===============================#
#             THEN              #
#===============================#
Translation Suggestion Should Be Successfully Upvoted    #Make sure to include 'Number Of Votes Recorded' keyword on the test case
    [Arguments]    ${p_initialVoteCount}    ${p_globalTranslationText}    ${p_voteCounterLocator}    ${p_essentialElementLocator}
    # Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${TMP_MODAL_CONTENT}
    Translation Should Be On The List of Suggestions    ${p_globalTranslationText}
    ${t_current} =    Get Number Of Votes Of Translation Suggestion    ${p_globalTranslationText}    ${p_voteCounterLocator}    ${p_essentialElementLocator}
    ${t_expected} =    Evaluate    ${p_initialVoteCount}+1
    Should Be Equal As Integers    ${t_current}    ${t_expected}

Translation Suggestion Should Be Successfully Downvoted    #Make sure to include 'Number Of Votes Recorded' keyword on the test case
    [Arguments]    ${p_initialVoteCount}    ${p_globalTranslationText}    ${p_voteCounterLocator}    ${p_essentialElementLocator}
    # Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${TMP_MODAL_CONTENT}
    Translation Should Be On The List of Suggestions    ${p_globalTranslationText}
    ${t_current} =    Get Number Of Votes Of Translation Suggestion    ${p_globalTranslationText}    ${p_voteCounterLocator}    ${p_essentialElementLocator}
    ${t_expected} =    Evaluate    ${p_initialVoteCount}-2
    Should Be Equal As Integers    ${t_current}    ${t_expected}

Translation Should Be On The List of Suggestions
    [Arguments]    ${p_translationText}
    Run And Wait Until Keyword Succeeds    Page Should Contain    ${p_translationText}

#===============================#
#            INTERNAL           #
#===============================#
Get Number Of Votes Of Translation Suggestion
    [Arguments]     ${p_translationText}    ${p_VoteCounterLocator}    ${p_essentialElementLocator}
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${p_essentialElementLocator}
    ${t_translationSuggestionTotalVotes}    Execute Javascript    return jQuery('*:contains("${p_translationText}"):last').parent().find('${p_VoteCounterLocator}').text()

    [Return]    ${t_translationSuggestionTotalVotes}

Hide Translation Widget
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${TWP_TRANSLATION_WIDGET}
    Execute Javascript    jQuery("${TWP_JQ_TRANSLATION_WIDGET}").hide();

Hide Widget When Visible
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${TWP_TRANSLATION_WIDGET}
    ${t_isWidgetVisible} =    Run Keyword And Return Status    Element Should Be Visible    ${TWP_TRANSLATION_WIDGET}
    Run Keyword If    '${t_isWidgetVisible}' == 'True'    Hide Translation Widget

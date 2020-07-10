*** Settings ***
Resource    ../Resources/common.robot

*** Variables ***
${BROWSER}        Chrome

${SEARCH BOX ELEMENT}    id:twotabsearchtextbox
${SEARCH SUBMIT BUTTON}    //span[@id="nav-search-submit-text"]/following-sibling::input

${SEARCH TERM}    Kindle

*** Test Cases ***
Web search
    Open Browser   ${URL}  ${BROWSER}
    Input Text     ${SEARCH BOX ELEMENT}    ${SEARCH TERM}
    Click Element  ${SEARCH SUBMIT BUTTON}
    Wait Until Page Contains    results for "${SEARCH TERM}"


Search Kindle
    Open Browser    ${URL}   ${BROWSER}  remote_url=
    Wait Until Page Contains    amazon
    [Teardown]  Close Browser
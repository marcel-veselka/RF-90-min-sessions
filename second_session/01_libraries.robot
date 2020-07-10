*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${URL}            https://www.amazon.com
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
    [Teardown]     Close Browser
    
Web status OK
    Create Session    web    ${URL}
    Log  web
    ${headers}=       Create Dictionary  User-Agent=RFTest
    ${resp}=          Get Request    web               /  headers=${headers}
    Status Should Be  200            ${resp}

Check web NOK status
    Create Session    web    ${URL} 
    ${headers}        Create Dictionary    User-agent=RFTest
    ${response}       Get Request    web    /asdf  headers=${headers}
    Status Should Be  404    ${response}
    

# ==============================
# Some more details here:
# ==============================
#   Selenium library: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#   Xpath cheatsheet: https://devhints.io/xpath#chaining-order

#   Requests library: https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html
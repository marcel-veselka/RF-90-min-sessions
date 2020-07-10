*** Settings ***
Library    SeleniumLibrary

Test Teardown   Close Browser
Test Setup      Start Test
Test Template   Login

*** Variables ***
${URL}      https://marcel.veselka.gitlab.io/ct60m/
${BROWSER}  Chrome  # Firefox

${TITLE}       Hello World!

${VALID USER}       marcel.veselka@tesena.com
${VALID PASSWORD}   asdf


*** Test Cases ***                USERNAME         PASSWORD             EXPECTED
Valid User Name                   ${VALID USER}    ${VALID PASSWORD}    True
Invalid User Name                 invalid          ${VALID PASSWORD}    False
Invalid Password                  ${VALID USER}    invalid              True  # This should pass until password chech is not implemented
Invalid User Name and Password    invalid          invalid              False
Empty User Name                   ${EMPTY}         ${VALID PASSWORD}    False
Empty Password                    ${VALID USER}    ${EMPTY}             False
Empty User Name and Password      ${EMPTY}         ${EMPTY}             False


*** Keywords ***
Start Test
    Open Browser  ${URL}  ${BROWSER}  options=add_argument("--ignore-certificate-errors")
    Wait Until Page Contains  ${TITLE}

Login
    [arguments]  ${user}=asdf  ${psswd}=marcel.veselka@tesena.com  ${expected}='PASS'
    Input Text      name=user  ${user}
    Input Password  name=pswd  ${psswd}
    Click Element   name=login
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  id:logedin
    Should Be True  '${status}'=='${expected}'

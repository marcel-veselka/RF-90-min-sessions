*** Settings ***
Documentation  This is file to show first steps with RF 

Default Tags  Import
Test Timeout  15s    

# Suite Setup    
# Test Setup    

Suite Teardown  Clean up    
# Test Teardown    

*** Variables ***
${VALUE}    123
${AMOUNT}    12

${SLEEP}    5

${SCALAR}   1
@{LIST}     1 2
&{DICTIONARY}   a=1  b=2
${ENVIRONMENT}  %{TMP}

*** Test Cases ***
# Purchase order
    # Navigate to new purchase
    # Fill out all data  ${VALUE}  ${AMOUNT}

Simple test
    [Documentation]    Hopefully you'll like it!
    [Tags]    my1st
    [Timeout]    2s
    Log  Simple message into log
    Log    second into log
    # [Teardown]    
    
Simple test w own KW
    [Documentation]  This is my second test
    [Tags]    second
    Log  We will use our own KW 
    ${x}  My own KW
    Log  Value from KW: ${x} 

Simple test w own KW - no default value
    ${x}    My own KW  8
    Log  Value from KW: ${x} 

Failing test
    [Documentation]  This is my third test 
    [Tags]  first 
    [Timeout]  2s
    Sleep  ${SLEEP}
    [Teardown]  Log To Console  My cool test just do nothing!? 

My third test
    Log  ${SCALAR}
    Log  ${LIST}
    Log  ${DICTIONARY}
    Log  ${ENVIRONMENT}


*** Keywords ***
My own KW
    [Documentation]    My keyword returns 2x X where X is argument
    [Arguments]    ${x}=5
    ${r}    Evaluate    ${x}*2
    Log  2 x ${x} = ${r}
    [Return]    ${r}
    
Clean up
    Log  cleaning up . . .

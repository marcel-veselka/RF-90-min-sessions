*** Settings ***
Resource    ../Resources/common.robot

*** Test Cases ***
Check web OK status
    Create Session    web    ${URL} 
    ${headers}       Create Dictionary    User-agent=RF
    ${response}      Get Request    web    /  headers=${headers}
    Status Should Be    200    ${response}
    
Check web NOK status
    Create Session    web    ${URL} 
    ${headers}       Create Dictionary    User-agent=RF
    ${response}      Get Request    web    /asdf  headers=${headers}
    Status Should Be    404    ${response}
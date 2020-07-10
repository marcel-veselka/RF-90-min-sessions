*** Variables ***
${URL}        https://localhost:8080/inss_core/
${BROWSER}    Chrome
${USERNAME}   admin
${PASSWORD}   secRet!
${SUB_MENU_AUTO_E}  New car contract
${CAR_INSURANCE_TYPE_K}            K
${CAR_INSURANCE_RESPONSIBILITY}    Responsibility
${CAR_INSURANCE_WINDOWS}           Windows
${HEC}        7753456
${ID}         6923810


*** Test Cases ***
New contract - car insurance
    [Tags]  core
    Start test  ${URL}  ${BROWSER}      ${USERNAME}     ${PASSWORD}
    Navigate to  ${SUB_MENU_AUTO_E}

    # 098 - meeting minutes
    Submit customer meeting minutes

    # 003 - new contract / parameters
    Select inss type       ${CAR_INSURANCE_TYPE_K}
    Select inss type      ${CAR_INSURANCE_RESPONSIBILITY}
    Select inss type      ${CAR_INSURANCE_WINDOWS}

    Submit inss types

   # 004 - new contract / customer and dealer details
    Fill out contract  # default agreement date: d starting date: d+1
#  Fill out contract  29.12.2020  11.11.2020

    Fill out dealer details    ${HEC}
    Fill out customer detaisl  ${ID}
    Submit dealer and customer details

    #
    Save contract
    Chceck correctness

*** Keywords ***
Save contract
    Log  ToDo
    
Chceck correctness
    Log  ToDo
    
Start test
    [Arguments]  ${URL}  ${BROWSER}      ${USERNAME}     ${PASSWORD}
    Log  ToDo

Navigate to  
    [Arguments]  ${SUB_MENU_AUTO_E}
    Log  ToDo
    
Submit customer meeting minutes
    Log  ToDo

Select inss type
    [Arguments]  ${CAR_INSURANCE_WINDOWS}
    Log  ToDo

Submit inss types
    Log  ToDo

Fill out contract
    Log  ToDo
    
Fill out dealer details
    [Arguments]  ${HEC}
    Log  ToDo

Fill out customer detaisl  
    [Arguments]  ${ID}
    Log  ToDo

Submit dealer and customer details
    Log  ToDo

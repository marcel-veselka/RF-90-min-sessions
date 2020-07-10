*** Test Cases ***
t1 Import Folder Objects
    [Tags]    Smoke    Integration
    Given Data to import folder object is available
    When User sends request to import a folder object
    Then Folder Object is imported


*** Keywords ***
Data to import folder object is available
    Log  ToDo

User sends request to import a folder object
    Log  ToDo
    
Folder Object is imported
    Log  ToDo
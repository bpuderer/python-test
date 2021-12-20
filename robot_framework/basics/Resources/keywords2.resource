*** Variables ***
${somevar}  set in keywords2.resource

*** Keywords ***
Say My Name
    Log  keywords2.resource  WARN

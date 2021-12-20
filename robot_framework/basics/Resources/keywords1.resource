*** Variables ***
${somevar}  set in keywords1.resource

*** Keywords ***
Say My Name
    Log  keywords1.resource  WARN

*** Test Cases ***

Read JSON File
    # NOTE: Path to file is from where robot is run, not from this file
    # Get File in OperatingSystem library
    #${json} =  Get File  Inputs/JSON/test.json
    #${object} =  Evaluate  json.loads('''${json}''')  json
    ${object} =  Evaluate  json.load(open("data/json/test.json", "r"))    json
    Log  Name: ${object["first_name"]} ${object["last_name"]}  WARN

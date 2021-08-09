*** settings ***
Library         ../libraries/testRedis/TestRedis.py

*** Test Cases ***
Connect Redis
    Connect To Redis    localhost	6379
    
List Keys
    List All Keys

Find Keys Using Pattern
    Get Keys	a*

Create Key 
    Key Should Not Exist 	height
    Add Key Value	height	182
    Key Should Exist 	height

Delete A Key
    Add Key Value	height	182
    Key Should Exist 	height
    delete key		height
    Key Should Not Exist 	height

Delete Database
    Clean Database
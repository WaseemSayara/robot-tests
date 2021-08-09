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
    Add Key Value	height	182
    Key Should Exist 	height

Delete A Key
    Add Key Value	dad	ahmad
    Key Should Exist 	dad
    delete key		dad
    Key Should Not Exist 	dad

Delete Database
    Clean Database
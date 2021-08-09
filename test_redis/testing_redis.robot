*** settings ***
Library         ../libraries/testRedis/TestRedis.py
Resource        ../Resources/variables.robot

*** Test Cases ***
Test Verify Redis Connection
    Connect To Redis    localhost	6379
    
Test Verify List Keys
    Make Key Value From File 	.	${KEYS_LIST}
    ${KEYS}	List All Keys

Test Finding Keys Using Pattern
    Get Keys	${PATTERN}

Test Creating A Key 
    Key Should Not Exist 	${NEW_KEY}
    Add Key Value	${NEW_KEY}	${NEW_VALUE}
    Key Should Exist 	${NEW_KEY}

Test Deleting A Key
    Add Key Value	${NEW_KEY}	${NEW_VALUE}
    Key Should Exist 	${NEW_KEY}
    delete key		${NEW_KEY}
    Key Should Not Exist 	${NEW_KEY}

Test Deleting The Database
    Clean Database
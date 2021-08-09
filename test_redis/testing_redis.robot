*** settings ***
Library         ../libraries/testRedis/TestRedis.py
Resource        ../Resources/variables.robot

*** Test Cases ***
Test Verify Redis Connection
    Connect To Redis    localhost	6379
    
Test List Keys
    Make Key Value From File		${KEYS_LIST}
    Log		hi
    ${OUTPUT}=	List All Keys
    Should Contain	${OUTPUT}	name
    Should Contain	${OUTPUT}	age
    Should Contain	${OUTPUT}	car

Test Finding Keys Using Pattern
    ${OUTPUT}=		Get Keys	${PATTERN}
    Should Contain	${OUTPUT}	age

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
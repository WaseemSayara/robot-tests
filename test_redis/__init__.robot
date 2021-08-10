*** settings ***
Library         ../libraries/testRedis/TestRedis.py
Suite setup	    log 	welcome to Redis testing
Suite teardown	log 	welcome to Redis testing

Test setup      Clean Database
*** settings ***
Library         ../libraries/testKafka/TestKafka.py
Resource               ../Resources/variables.robot

*** Test Cases ***
Test Creating Topic

    ${NEW_TPOIC}    Get Unique Topic
    topic should not exist    ${NEW_TPOIC}
    create topic    ${NEW_TPOIC}
    topic should exist    ${NEW_TPOIC}

#Delete Topic
#    create topic    waseem55
#    topic should exist    waseem55
#    delete topic            waseem55
#    topic should not exist  waseem55

Test Sending And Consuming File
    send file to kafka topic    ${NEW_TPOIC}     ${KAFKA_SEND_FILE}
    kafka Consumer  ${NEW_TPOIC}     ${KAFKA_CONSUME_FILE}
    compare sent and consumed files     ${KAFKA_SEND_FILE}  ${KAFKA_CONSUME_FILE}

Get All Topics
    ${TOPICS}   List All Topics
    Log         ${Topics}
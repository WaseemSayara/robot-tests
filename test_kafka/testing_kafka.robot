*** settings ***
Library         ../libraries/testKafka/TestKafka.py
Resource               ../Resources/variables.robot

*** Test Cases ***
Test Creating Topic

    ${NEW_TOPIC}              Get Unique Topic
    Set Global Variable       ${NEW_TOPIC}
    topic should not exist    ${NEW_TOPIC}
    create topic              ${NEW_TOPIC}
    topic should exist        ${NEW_TOPIC}

#Delete Topic
#    create topic    waseem55
#    topic should exist    waseem55
#    delete topic            waseem55
#    topic should not exist  waseem55

Test Sending And Consuming File
    send file to kafka topic            ${VALID_TOPIC}     ${KAFKA_SEND_FILE}
    kafka Consumer                      ${VALID_TOPIC}     ${KAFKA_CONSUME_FILE}
    compare sent and consumed files     ${KAFKA_SEND_FILE}  ${KAFKA_CONSUME_FILE}

Get All Topics
    ${TOPICS}            List All Topics
    Should Contain	     ${TOPICS}	waseem4
    Should Contain	     ${TOPICS}	waseem5
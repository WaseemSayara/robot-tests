*** Variables ***

# SSH Veriables
${HOST}                127.0.0.1
${USERNAME}            waseem
${PASSWORD}            123123

${NET1}                inet 10.0.2.15
${NET2}                netmask 255.255.255.0
${NET3}                broadcast 10.0.2.255

${SSH_NEW_DIRECTORY}           directory3

${SSH_NEW_FILE}                dir1/file12.txt
${SSH_NEW_FILE_CONTENT}        hello, my name is waseem
${SSH_FILE_NEW_PATH}           .

${LOCAL_SSH_PUT_FILE}        ./Resources/to_send_file.txt
${REMOTE_SSH_PUT_FILE}       from_local_file.txt


${LOCAL_SSH_GET_FILE}        ./fetched_file.txt
${REMOTE_SSH_GET_FILE}       file11.txt

${SSH_NEW_FILE_2}                file2.txt
${SSH_NEW_FILE_CONTENT_2}        hello everyone, good evening
${SSH_FILE_NEW_PATH_2}           dir1
${REMOTE_TO_REMOVE_FILE}         dir1/file2.txt

${SSH_NEW_FILE_3}                file11.txt
${SSH_NEW_FILE_CONTENT_3}        hello everyone im here
${SSH_FILE_NEW_PATH_3}           directory1
${SSH_NEW_FILE_4}                file22.txt
${SSH_NEW_FILE_CONTENT_4}        hello everyone, nice to meet you

# REDIS Veriables
${NEW_KEY}	           height
${NEW_VALUE}	       182
${PATTERN}	           a*
${KEYS_LIST}           ./Resources/keys_list.txt

# KAFKA Veriables

${KAFKA_SEND_FILE}          ./Resources/kafka_test_file.txt
${KAFKA_CONSUME_FILE}       ./consumed_test_kafka_file.txt
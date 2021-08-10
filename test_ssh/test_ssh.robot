*** Settings ***
Library                ../libraries/testSSh/TestSSH.py
Resource               ../Resources/variables.robot

*** Test Cases ***
Check Hostname
    ${HOSTNAME}=     Get Hostname
    Log              ${HOSTNAME}
    Should Be Equal  ${HOSTNAME}  waseem-ahmad

Check Network
    ${NETWORK}=      Get Network Configurations
    Log              ${NETWORK}
    Should Contain   ${NETWORK}  ${NET1}
    Should Contain   ${NETWORK}  ${NET2}
    Should Contain   ${NETWORK}  ${NET3}

Test Creating New Directory
    Create Directory    ${SSH_NEW_DIRECTORY}
    SHOULD EXIST        ${SSH_NEW_DIRECTORY}


Test Creating New File
    Create File        ${SSH_NEW_FILE}   ${SSH_NEW_FILE_CONTENT}   ${SSH_FILE_NEW_PATH}
    Should Exist       ${SSH_NEW_FILE}

Test Puting New File
    Put File        ${LOCAL_SSH_PUT_FILE}    ${REMOTE_SSH_PUT_FILE}
    Should Exist    ${REMOTE_SSH_PUT_FILE}

Test Geting New File
    Get File        ${REMOTE_SSH_GET_FILE}   ${LOCAL_SSH_GET_FILE}

Test Removing File From Remote
    Create File        ${SSH_NEW_FILE_2}   ${SSH_NEW_FILE_CONTENT_2}   ${SSH_FILE_NEW_PATH_2}
    ${NUM_OF_FILES_BEFORE}   Get Count Of Files  ${SSH_FILE_NEW_PATH_2}
    Remove File      ${REMOTE_TO_REMOVE_FILE}
    ${NUM_OF_FILES_AFTER}   Get Count Of Files  ${SSH_FILE_NEW_PATH_2}
    Evaluate  ${NUM_OF_FILES_AFTER} < ${NUM_OF_FILES_BEFORE}

Empty Directory
    Create File        ${SSH_NEW_FILE_3}   ${SSH_NEW_FILE_CONTENT_3}   ${SSH_FILE_NEW_PATH_3}
    Create File        ${SSH_NEW_FILE_4}   ${SSH_NEW_FILE_CONTENT_4}   ${SSH_FILE_NEW_PATH_3}
    Remove Files In Directory   ${SSH_FILE_NEW_PATH_3}
    ${NUM_OF_FILES}    Get Count Of Files  ${SSH_FILE_NEW_PATH_3}
    Should Be Equal As Integers  ${NUM_OF_FILES}  0

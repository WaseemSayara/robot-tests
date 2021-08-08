*** Settings ***
Library                ../libraries/testSSh/TestSSH.py
Resource               ../libraries/Resources/variables.robot
Suite Setup            Custom Setup
Suite Teardown         Custom Teardown


*** Keywords ***
Custom Setup
    Login To Host  ${HOST}  port=2222  username=${USERNAME}  password=${PASSWORD}

Custom TearDown
    Logout From Host
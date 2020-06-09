*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/LoginPage.robot
Resource  ../resources/Register.robot
Suite Setup         Open Qiscus Multichannel
Suite Teardown      Close Qiscus Multichannel
Test Setup          Sleep TestCase

*** Variables ***
${BROWSER}                  chrome
${QISCUS_MULTICHANNEL}      https://multichannel.qiscus.com/

*** Keywords ***
Open Qiscus Multichannel
    open browser  ${QISCUS_MULTICHANNEL}  ${Browser}
    maximize browser window

Close Qiscus Multichannel
    close browser

Sleep Testcase
    set selenium speed      1s

*** Test Cases ***

TC01 Register
    Open Register page
    Invalid Email Regitration
    Invalid Password
    Valid Account Register

TC02 Login
    Unverivied Account 1
    Unverivied Account 2
    Valid Account
    Log Out
    Invalid Login Password

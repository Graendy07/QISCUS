*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${EMAIL}            name:email
${PASSWORD}         name:password
${SIGN_IN}          xpath://button[contains(text(),'Sign In')]
${CHANGE_USER}      id:btn-logout
${INBOX_BTN}        xpath://span[@id='inbox_btn']
${LOG_OUT_BTN}      xpath://span[@id='logout_btn']
${WARNING_MESS_PASSWORD}    xpath://*[text()[contains(., "Please check email and password combination")]]
${OK_BUTTON}        xpath://*[text()[contains(., "OK")]]


*** Keywords ***

Unverivied Account 1
    input text      ${EMAIL}        graendy@gmail.com
    input text      ${PASSWORD}     graendy123
    click element   ${SIGN_IN}
    click element   ${CHANGE_USER}

Unverivied Account 2
    input text      ${EMAIL}        graendy2@gmail.com
    input text      ${PASSWORD}     graendy
    click element   ${SIGN_IN}
    click element   ${CHANGE_USER}

Valid Account
    input text      ${EMAIL}        graendy.pantha@gmail.com
    input text      ${PASSWORD}     graendy070110
    click element   ${SIGN_IN}
    wait until page contains element    ${inbox_btn}


Log Out
    click element  ${LOG_OUT_BTN}
    wait until page contains        Welcome Back

Invalid Login Password
    input text     ${EMAIL}     graendy.pantha@gmail.com
    input text     ${PASSWORD}  graendygraendy
    click element  ${SIGN_IN}
    wait until page contains element    ${WARNING_MESS_PASSWORD}
    click element  ${OK_BUTTON}
    wait until page contains  Welcome Back


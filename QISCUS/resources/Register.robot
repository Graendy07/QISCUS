*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${REGISTER}                 xpath://a[contains(text(),'Register Now')]
${COMPANY_NAME_FIELD}       name:company_name
${INDUSTRY}                 xpath://div[@class='form-group']//select
${AUTOMOTIVE}               xpath://*[text()[contains(., "Automotive")]]
${REGIST_EMAIL}             name:work_email
${PHONE_NUMBER}             name:phone_number
${REGIST_PASSWORD}          name:password
${CONFIRMATION_PASS}        name:confirmation
${REGISTER_BUTTON}          xpath://button[contains(text(),'Register')]
${EMAIL_WARNING_MESS}       xpath://*[text()[contains(., "The work_email field must be a valid email.")]]
${PASS_WARNING_MESS}        xpath://*[text()[contains(., "The confirmation confirmation does not match.")]]
${SUCCESS_POP_UP}           id:swal2-title
${OK_BUTTON}                xpath://*[text()[contains(., "OK")]]
${SIGN_IN_Back}             xpath://a[contains(text(),'Sign in')]

*** Keywords ***
Open Register page
    click element  ${REGISTER}
    wait until page contains  Create Your Account

Invalid Email Regitration
    input text      ${COMPANY_NAME_FIELD}       Graendy_test
    click element   ${COMPANY_NAME_FIELD}
    click element   ${AUTOMOTIVE}
    input text      ${REGIST_EMAIL}             panthalasian11@gmail
    input text      ${PHONE_NUMBER}             0859126406102
    input text      ${REGIST_PASSWORD}          graendy123
    input text      ${CONFIRMATION_PASS}        graendy123
    click element   ${REGISTER_BUTTON}
    wait until page contains element            ${EMAIL_WARNING_MESS}
    click element   ${SIGN_IN_Back}


Invalid Password
    click element   ${REGISTER}
    input text      ${COMPANY_NAME_FIELD}       Graendy_test
    click element   ${COMPANY_NAME_FIELD}
    click element   ${AUTOMOTIVE}
    input text      ${REGIST_EMAIL}             panthalasian11@gmail.com
    input text      ${PHONE_NUMBER}             0859126406102
    input text      ${REGIST_PASSWORD}          graendy123
    input text      ${CONFIRMATION_PASS}        graendy1234
    click element   ${REGISTER_BUTTON}
    wait until page contains element    ${PASS_WARNING_MESS}
    click element   ${SIGN_IN_Back}


Valid Account Register
    click element   ${REGISTER}
    input text      ${COMPANY_NAME_FIELD}       Graendy_test
    click element   ${COMPANY_NAME_FIELD}
    click element   ${AUTOMOTIVE}
    input text      ${REGIST_EMAIL}             panthalasian123@gmail.com
    input text      ${PHONE_NUMBER}             0859126406102
    input text      ${REGIST_PASSWORD}          graendy123
    input text      ${CONFIRMATION_PASS}        graendy123
    click element   ${REGISTER_BUTTON}
    wait until page contains element            ${SUCCESS_POP_UP}
    click element                               ${OK_BUTTON}
    wait until page contains    Welcome Back

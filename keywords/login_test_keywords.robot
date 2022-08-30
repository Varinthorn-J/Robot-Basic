*** Settings ***
Resource  ../import.robot

*** Keywords ***
go to lotuss web 
  Open Browser  ${lotuss_web}  chrome
  Maximize Browser Window

login
  Wait Until Element Is Visible   ${button_comfirm}
  Click Button  ${button_comfirm}
  Wait Until Element Is Visible   //*[@id="header-login-link"] 
  Click Element  //*[@id="header-login-link"]
  Wait Until Element Is Visible  ${input_username}
  Input Text  ${input_username}  ${username}
  Input Password  ${input_password}  ${password}
  Click Button  //*[@id="login"]
  Wait Until Element Is Visible  ${profile}
  Page Should Contain Element  ${profile}  Success
  close browser    
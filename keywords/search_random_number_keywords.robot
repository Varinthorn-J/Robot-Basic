*** Settings ***
Resource  ../import.robot

*** Keywords ***
go to lotuss web 
  Open Browser  ${lotuss_web}  chrome
  Maximize Browser Window

connect redis
  ${redis_conn}=   rediss   eapi-ffti-redis.qa.api.it-lotus.com      rcNGXUfhNb
  set global variable    ${redis_conn}

set redis
  [Arguments]    ${redis_key}    ${redis_value}  
  Set To Redis    ${redis_conn}    ${redis_key}    ${redis_value}
# connect redis password
#   ${redis_conn}=   Tize Redis Conn lib   eapi-ffti-redis.qa.api.it-lotus.com   6379   
#   set global variable    ${redis_conn}    

search random number
  ${search_numbers} =  generate random numbers
  Wait Until Element Is Visible   ${button_comfirm}
  Click Button  ${button_comfirm}
  Wait Until Element Is Visible  ${search_input}
  Input Text  ${search_input}   ${search_numbers}
  Press Keys  ${search_input}  ENTER
  Wait Until Element Is Visible  ${search_result}
  Page Should Contain Element  ${search_result}
  close browser

input_phone_number
  Wait Until Element Is Visible  ${input_text}
  Input Text  ${input_text}   ${phone}
  Wait Until Element Is Visible  ${button_comfirm}
  Click Button  ${button_comfirm}
  close browser          
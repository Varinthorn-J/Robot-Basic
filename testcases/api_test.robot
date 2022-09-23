*** Settings ***
Resource  ../import.robot

*** Variables ***
${base_url}  https://gorest.co.in/


*** Test Cases ***
get api test ex-01
  Create Session  get_api  ${base_url}
  ${response}  get request  get_api  public/v2/users/7
  log to console  ${response.status_code}
  log to console  ${response.content}  

post api test ex-02
  Create Session  post_api  ${base_url}
  ${response}  post request  post_api  public/v2/users
  log to console  ${response.status_code}     
  log to console  ${response.content}     




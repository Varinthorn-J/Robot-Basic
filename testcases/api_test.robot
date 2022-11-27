*** Settings ***
Resource  ../import.robot

*** Variables ***
${base_url}  https://thetestingworldapi.com
${url_w}  https://aerisweather1.p.rapidapi.com
${x-api-key}  825965648amsh06bc4bd94839638p12e344jsnec1402555659
${host}  aerisweather1.p.rapidapi.com 

${content-type}  application/x-www-form-urlencoded
${application}  application/gzip
${tran-host}  google-translate1.p.rapidapi.com
${hello}  HelloWorld
${es}  es
${en}  en

*** Keywords ***
http response status from '${response}' should be '${expected_http_response_status}'
  should be equal as integers  ${response.status_code}  ${${expected_http_response_status}}  valid http status

*** Test Cases ***
TC-001-get api test ex-01
  Create Session  get_api  ${base_url}
  ${response}  get request  get_api  api/technicalskills/${1}
  http response status from '${response}' should be '200'
  log to console  ${response.status_code} 
  log to console  ${response.content} 

TC-002-post api test ex-02
  Create Session  post_api  ${base_url}
  ${response}  post request  post_api  api/Students   
  http response status from '${response}' should be '200'
  log to console  ${response.status_code}

TC-003-get api with access key ex-03
  Create Session  get_api  ${url_w}   verify=True
  ${headers}  create dictionary
  ...  X-RapidAPI-Key=${x-api-key}
  ...  X-RapidAPI-Host=${host}
  ${response}  get request  get_api  sunmoon/ankara,tr  headers=${headers}
  http response status from '${response}' should be '200'
  log to console  ${response.status_code}

TC-004-post api with access key ex-04
  Create Session  post_api_url  https://google-translate1.p.rapidapi.com   verify=True
  ${headers}  create dictionary
  ...  content-type=${content-type}
  ...  Accept-Encoding=${application}
  ...  X-RapidAPI-Key=${x-api-key}
  ...  X-RapidAPI-Host=${tran-host}
  ${request_body}  create dictionary
  ...  q=${hello}
  ...  target=${es}
  ...  source=${en}
  ${response}  post request  post_api_url  language/translate/v2  headers=${headers}  data=${request_body}
  http response status from '${response}' should be '200'
  log to console  ${response.status_code}

 





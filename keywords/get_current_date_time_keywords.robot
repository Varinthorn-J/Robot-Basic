*** Settings ***
Resource  ../import.robot

*** Keywords ***
get_current_date_time_default_format
  ${current}  Get Current Date  result_format=%d/%m/%Y %H:%M:%S
  log to console  CUERENT TIME AND DATE ${current}

get_current_date_time_format
  ${current}  Get Current Date  result_format=%Y-%m-%dT%H:%M:%S.%f
  ${current_day}  convert date  ${current}  result_format=%d
  ${current_month}  convert date  ${current}  result_format=%m
  ${current_year}  convert date  ${current}  result_format=%Y
  ${current_time_hour}  convert date  ${current}  result_format=%H
  ${current_time_min}  convert date  ${current}  result_format=%M
  ${current_time_sec}  convert date  ${current}  result_format=%S
  ${current_time_mil_sec}  convert date  ${current}  result_format=%f
  set global variable  ${current_format}  ${current_year}-${current_month}-${current_day} ${current_time_hour}:${current_time_min}:${current_time_sec}.${current_time_mil_sec}    
  log to console  CUERENT TIME AND DATE ${current_format}    
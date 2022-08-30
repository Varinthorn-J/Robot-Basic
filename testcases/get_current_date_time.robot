*** Settings ***
Resource  ../import.robot
Resource  ../keywords/get_current_date_time_keywords.robot

*** Test Cases ***
TC-001 Get Current DateTime
  get_current_date_time_format  
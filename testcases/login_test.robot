*** Settings ***
Resource  ../import.robot
Resource  ../keywords/login_test_keywords.robot

*** Test Cases ***
TC-001 Login my-lotuss web
  go to lotuss web
  login 
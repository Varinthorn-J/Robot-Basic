*** Settings ***
Resource  ../import.robot
Resource  ../keywords/search_random_number_keywords.robot

*** Test Cases ***
TC-002 Random number with custom lib
  go to lotuss web
  search random number
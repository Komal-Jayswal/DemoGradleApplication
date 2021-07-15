@DemoAPI
Feature: Call demo API and assert the response values


  @Demo_GET_Test
  Scenario: Call demo API and assert the response values

#    Given url "http://localhost:8090/users"
    Given end point is configured from user
    When user calls api to get "users" details
    Then endpoint respond with status code "200"

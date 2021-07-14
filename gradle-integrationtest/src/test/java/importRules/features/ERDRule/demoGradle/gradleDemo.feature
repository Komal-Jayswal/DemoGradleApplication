@DemoAPI
Feature: Call demo API and assert the response values


  @RC200
  Scenario: Call demo API and assert the response values

    Given url "http://localhost:8090/"
    And path 'users'
    When method get
    Then status 200
    And print response
    And match response contains
    """
["Maven","Gradle","Ant"]
    """
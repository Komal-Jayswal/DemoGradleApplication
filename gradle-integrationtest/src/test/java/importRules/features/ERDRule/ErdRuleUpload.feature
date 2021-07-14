@EmptyReturnDepotRules
Feature: Empty Return Depot Rules PUT API to upload the rules and validate the rules uploaded.

  Background:
#    Given url 'https://api-cdt.maersk.com'
    Given url baseUrl
    And path '/import-business-rules/v2/empty-container-return-depot'
#    And configure headers = { consumer-key: 'X3tlC7zOlrZtORBkcYaWUj2zntdkWqb3',Authorization : 'Bearer eyJ0eXAiOiJKV1QiLCJraWQiOiJrTEt2U2xFcEREK1pQQUJYbUgvV3lndHZLVTQ9IiwiYWxnIjoiUlMyNTYifQ.eyJhdF9oYXNoIjoiV1lwNWNWVml0djFuQjhwNktVX2dRZyIsInN1YiI6Ii1iSUxLNXdPc253YXczbU92ci1NWU5IMk4wdGVEc1hoLXg5NHVEUVlOT0UiLCJjb3VudHJ5IjoiR0IiLCJmaXJzdG5hbWUiOiJBdmluYXNoIiwiYXVkaXRUcmFja2luZ0lkIjoiNDI0YTc5ZmUtNWYzOS00OGI0LTgwNTktN2Q0YmMwM2YxMzE5LTEyMjA2NDc5Iiwicm9sZXMiOlsiQm9va2luZyIsIkRvY3VtZW50YXRpb24iLCJJbXBvcnRDU0EiLCJNYWVyc2tJbnRlcm5hbCIsIkludm9pY2VzIiwiQ29udHJhY3RSYXRlIiwiV0JPTEFwcHJvdmVyIiwiQmFzaWNDdXN0b21lciIsIkRORE9wZXJhdG9yIiwiQWxsb2NhdGlvbk1hbmFnZXIiLCJJbXBvcnRSdWxlc0FkbWluIl0sImlzcyI6Imh0dHBzOi8vaWFtLWNkdC5tYWVyc2suY29tL2FjbS9vYXV0aDIvbWF1IiwidG9rZW5OYW1lIjoiaWRfdG9rZW4iLCJvZmZpY2UiOiJMaXZlcnBvb2wgLSBHQiIsImFjciI6IjAiLCJhenAiOiJiY2EwMDEiLCJhdXRoX3RpbWUiOjE2MjYwOTc5NzksInBlcnNvbmlkIjoiMTAwMDAzMzI4NDciLCJpcGFkZHIiOiIxNTcuNDUuMTA1LjIwMSIsImV4cCI6MTYyNjEwNTE4MCwiY3VzdG9tZXJfY29kZSI6IjEwMDAwMDA3OTUxIiwiaWF0IjoxNjI2MDk3OTgwLCJlbWFpbCI6IkF2aW5hc2gubUBtYWVyc2suY29tIiwibm9uY2UiOiI4d09FSGxJdUxFYU9hNU1jckw1aSIsImxhc3RuYW1lIjoiTSIsImF1ZCI6ImJjYTAwMSIsImNfaGFzaCI6IllybnRZQjFSdm1DbTY0djZuTDdhN0EiLCJjYXJyaWVyIjoiTUFFVSIsIm5hbWUiOiJBdmluYXNoIE0iLCJyZWFsbSI6Ii9tYXUiLCJ0b2tlblR5cGUiOiJKV1RUb2tlbiIsInVzZXJuYW1lIjoiQXZpbmFzaC5tQG1hZXJzay5jb20ifQ.VZ50f_yplt_6n87nr6snww04KYb55-FwLv3yxurWUsGLoOVDiDKzEdGn5VyZqBRWGA46ex1oUxo53xKvwj8NxO2dGAkqeARlLHNxJtpW8qpFM6f3oxooK1CQkxZX_LUTmq0f7ByO9a7kBq6zdOLYmKAgYMY6l9E1Ch7Eh-Av3r2PET_-_sPyDwFSZgBVwsdHHwE9uIqPBl6eEn-cl4rF2egEzXaWRQoE9eKip8FFBNW-bPi3dnA301but3ZcbVxkj7NjL5IF-S78o-AZ-_wu10E3pSC-SUyiwn7GUML67H869Bmrr6ndT3qMu3jxPecfd_ex47gyNIoBPlRfO7tNMw' }
    And configure headers = { consumer-key: '#(consumer_key)', Authorization : '#(authHeader)' }

  @uploadSuccess
  Scenario Outline: Verify the instant delivery order Empty Return Depot Rules PUT API when we have excel file to upload the rules.

    And multipart file file =  { read: 'classpath:importRules/resources/ERDRuleData/<FileName>', filename: '<FileName>', contentType: 'text/csv' }
    When method put
    Then status 201
    And print response
    Then match response == "Records Upserted Successfully"
    And def printMsg =
    """
  function(arg) {
  var JavaDemo = Java.type('importRules.dbValues');
  var jd = new JavaDemo();
  return jd.validate_database_value();
  }
  """
    Then  def result = call printMsg

    Examples:
      | FileName                                     |
      | EmptyContainerReturnDepotRules.xlsx          |
      | Empty_Return_Depot_Multi_containerTypes.xlsx |
      | DuplicateRowsData.xlsx                       |

  @uploadFailure
  Scenario Outline: Verify the instant delivery order Empty Return Depot Rules PUT API provides appropriate error when "<ScenarioName>"
    And multipart file file =  { read: 'classpath:importRules/resources/ERDRuleData/<FileName>', filename: '<FileName>', contentType: 'text/csv' }
    When method put
    Then status 400
    And print response
    * def response =
  """
  {"method":"PUT",
  "requestUri":"\/import-business-rules\/v2\/empty-container-return-depot",
  "debugMessage":"INVALID_EXCEL_FILE: Incorrect Number of Columns. Expected: 12, Found: 11",
  "id":"56baa997-8a0f-4f06-ae0f-cdacd14be6e6",
  "message":"Bad Request",
  "status":400,
  "timestamp":"10-07-2021 17:54:45"}
  """
    And match response ==
  """
  {
  "method": "#string",
  "requestUri": "#string",
  "status": "#number",
  "timestamp": "#string",
  "message": "#string",
  "debugMessage": "#string",
  "id": "#string"
  }
  """
  And def printMsg =
    """
  function(arg) {
  var JavaDemo = Java.type('importRules.dbValues');
  var jd = new JavaDemo();
  return jd.validate_database_value();
  }
  """
  Then  def result = call printMsg

    Examples:
      | ScenarioName                   | FileName                            |
      | Extra Column Added in rules    | ExtraColumn.xlsx                    |
      | Incorrect extension            | InCorrectExtentionOfTheFile.xls     |
      | Missing Column                 | MissingColumn.xlsx                  |
      | Incorrect Column Order         | IncorrectColumnOrder.xlsx           |
      | Special Characters in rules    | SpecialCharactersInData.xlsx        |
      | Pattern Validation for fields  | PatternValidationError.xlsx         |
      | InCorrect sheet Order          | IncorrectSheetOrder.xlsx            |
      | Separator is not valid in data | Separator_for_values_is_wrong.xlsx  |
      | Separator is not valid in data | Separator_for_values_is_wrong2.xlsx |
      | Separator is not valid in data | Separator_for_values_is_wrong3.xlsx |

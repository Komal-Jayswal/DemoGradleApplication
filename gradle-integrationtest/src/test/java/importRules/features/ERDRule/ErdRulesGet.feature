@EmptyReturnDepotRulesGET
Feature: Empty container Return depot rules GET API to fetch the data from rules which are uploaded

  Background:
    Given url baseUrl
#    Given url "api-cdt.maersk.com"
    And path '/import-business-rules/v2/empty-container-return-depots'
#    And configure headers = { consumer-key: 'X3tlC7zOlrZtORBkcYaWUj2zntdkWqb3', Authorization : 'Bearer eyJ0eXAiOiJKV1QiLCJraWQiOiJrTEt2U2xFcEREK1pQQUJYbUgvV3lndHZLVTQ9IiwiYWxnIjoiUlMyNTYifQ.eyJhdF9oYXNoIjoiV1lwNWNWVml0djFuQjhwNktVX2dRZyIsInN1YiI6Ii1iSUxLNXdPc253YXczbU92ci1NWU5IMk4wdGVEc1hoLXg5NHVEUVlOT0UiLCJjb3VudHJ5IjoiR0IiLCJmaXJzdG5hbWUiOiJBdmluYXNoIiwiYXVkaXRUcmFja2luZ0lkIjoiNDI0YTc5ZmUtNWYzOS00OGI0LTgwNTktN2Q0YmMwM2YxMzE5LTEyMjA2NDc5Iiwicm9sZXMiOlsiQm9va2luZyIsIkRvY3VtZW50YXRpb24iLCJJbXBvcnRDU0EiLCJNYWVyc2tJbnRlcm5hbCIsIkludm9pY2VzIiwiQ29udHJhY3RSYXRlIiwiV0JPTEFwcHJvdmVyIiwiQmFzaWNDdXN0b21lciIsIkRORE9wZXJhdG9yIiwiQWxsb2NhdGlvbk1hbmFnZXIiLCJJbXBvcnRSdWxlc0FkbWluIl0sImlzcyI6Imh0dHBzOi8vaWFtLWNkdC5tYWVyc2suY29tL2FjbS9vYXV0aDIvbWF1IiwidG9rZW5OYW1lIjoiaWRfdG9rZW4iLCJvZmZpY2UiOiJMaXZlcnBvb2wgLSBHQiIsImFjciI6IjAiLCJhenAiOiJiY2EwMDEiLCJhdXRoX3RpbWUiOjE2MjYwOTc5NzksInBlcnNvbmlkIjoiMTAwMDAzMzI4NDciLCJpcGFkZHIiOiIxNTcuNDUuMTA1LjIwMSIsImV4cCI6MTYyNjEwNTE4MCwiY3VzdG9tZXJfY29kZSI6IjEwMDAwMDA3OTUxIiwiaWF0IjoxNjI2MDk3OTgwLCJlbWFpbCI6IkF2aW5hc2gubUBtYWVyc2suY29tIiwibm9uY2UiOiI4d09FSGxJdUxFYU9hNU1jckw1aSIsImxhc3RuYW1lIjoiTSIsImF1ZCI6ImJjYTAwMSIsImNfaGFzaCI6IllybnRZQjFSdm1DbTY0djZuTDdhN0EiLCJjYXJyaWVyIjoiTUFFVSIsIm5hbWUiOiJBdmluYXNoIE0iLCJyZWFsbSI6Ii9tYXUiLCJ0b2tlblR5cGUiOiJKV1RUb2tlbiIsInVzZXJuYW1lIjoiQXZpbmFzaC5tQG1hZXJzay5jb20ifQ.VZ50f_yplt_6n87nr6snww04KYb55-FwLv3yxurWUsGLoOVDiDKzEdGn5VyZqBRWGA46ex1oUxo53xKvwj8NxO2dGAkqeARlLHNxJtpW8qpFM6f3oxooK1CQkxZX_LUTmq0f7ByO9a7kBq6zdOLYmKAgYMY6l9E1Ch7Eh-Av3r2PET_-_sPyDwFSZgBVwsdHHwE9uIqPBl6eEn-cl4rF2egEzXaWRQoE9eKip8FFBNW-bPi3dnA301but3ZcbVxkj7NjL5IF-S78o-AZ-_wu10E3pSC-SUyiwn7GUML67H869Bmrr6ndT3qMu3jxPecfd_ex47gyNIoBPlRfO7tNMw' }
    And configure headers = { consumer-key: '#(consumer_key)', Authorization : '#(authHeader)' }

  @RC200
  Scenario: Verify Empty container Return Depot Rules GET API when we have only one return depot.

    And param finalDischargeGeoLocationId = '2DTLIHUG9YN7S'
    And param finalDeliveryGeoLocationId = '2DTLIHUG9YN7S'
    And param carrierCode = 'MAEU'
    And param importDeliveryMode = 'CY'
    And param containerTypes = '20 DRY'
    And param cargoTypes = 'DRY'
    When method get
    Then status 200
    And print response
    And match response[0].finalDischargePortCode == "MYTPP"
    And match response[0].finalDischargeCountryCode == "MY"
    And match response[0].finalDeliveryLocationCode == "MYTPP"
    And match response[0].placeOfDeliveryCountryCode == "MY"
    And match response[0].carrierCode == "MAEU"
    And match response[0].containerType == "20 DRY"
    And match response[0].cargoType == "DRY"
    And match response[0].defaultReturnDepots[0] == "MYGEL02"
    And match response[0].allowedCountriesForSearch[0] == "MY"
    And match response[0].isAllowedToEditReturnDepot == false
  #OR
    And match response ==
  """
  [
  {
  "finalDischargePortCode": "MYTPP",
  "finalDischargeCountryCode": "MY",
  "finalDeliveryLocationCode": "MYTPP",
  "placeOfDeliveryCountryCode": "MY",
  "carrierCode": "MAEU",
  "containerType": "20 DRY",
  "cargoType": "DRY",
  "importDeliveryMode": "CY",
  "defaultReturnDepots": [
  "MYGEL02"
  ],
  "allowedCountriesForSearch": [
  "MY"
  ],
  "isAllowedToEditReturnDepot": false
  }
  ]
  """

  @RC200
  Scenario: Verify Empty container Return Depot Rules GET API for both 20DRY and 40DRY containers.

    And param finalDischargeGeoLocationId = '2DTLIHUG9YN7S'
    And param finalDeliveryGeoLocationId = '2DTLIHUG9YN7S'
    And param carrierCode = 'MAEU'
    And param importDeliveryMode = 'CY'
    And param containerTypes = '20 DRY,40 DRY'
    And param cargoTypes = 'DRY,DRY'
    When method get
    Then status 200
    And print response
    And match response[0].finalDischargePortCode == "MYTPP"
    And match response[0].finalDischargeCountryCode == "MY"
    And match response[0].finalDeliveryLocationCode == "MYTPP"
    And match response[0].placeOfDeliveryCountryCode == "MY"
    And match response[0].carrierCode == "MAEU"
    And match response[0].containerType == "20 DRY"
    And match response[1].containerType == "40 DRY"
    And match response[0].cargoType == "DRY"
    And match response[0].defaultReturnDepots[0] == "MYGEL02"
    And match response[1].defaultReturnDepots[0] == "MYTPPTH"
    And match response[0].allowedCountriesForSearch[0] == "MY"
    And match response[0].isAllowedToEditReturnDepot == false
    And match response[1].isAllowedToEditReturnDepot == false
  #OR
    And match response ==
  """
  [
  {
  "finalDischargePortCode": "MYTPP",
  "finalDischargeCountryCode": "MY",
  "finalDeliveryLocationCode": "MYTPP",
  "placeOfDeliveryCountryCode": "MY",
  "carrierCode": "MAEU",
  "containerType": "20 DRY",
  "cargoType": "DRY",
  "importDeliveryMode": "CY",
  "defaultReturnDepots": [
  "MYGEL02"
  ],
  "allowedCountriesForSearch": [
  "MY"
  ],
  "isAllowedToEditReturnDepot": false
  },
  {
  "finalDischargePortCode": "MYTPP",
  "finalDischargeCountryCode": "MY",
  "finalDeliveryLocationCode": "MYTPP",
  "placeOfDeliveryCountryCode": "MY",
  "carrierCode": "MAEU",
  "containerType": "40 DRY",
  "cargoType": "DRY",
  "importDeliveryMode": "CY",
  "defaultReturnDepots": [
  "MYTPPTH"
  ],
  "allowedCountriesForSearch": [
  "MY"
  ],
  "isAllowedToEditReturnDepot": false
  }
  ]
  """

  @RC200
  Scenario: Verify Empty container Return Depot Rules GET API for both 20 REEF and 40 DRY container.

    And param finalDischargeGeoLocationId = '2XELE43QKIMIN'
    And param finalDeliveryGeoLocationId = '2XELE43QKIMIN'
    And param carrierCode = 'ALL'
    And param importDeliveryMode = 'CY'
    And param containerTypes = '20 REEF,40 DRY'
    And param cargoTypes = 'ALL,ALL'
    When method get
    Then status 200
    And print response
    And match response[0].finalDischargePortCode == "SIKOP"
    And match response[0].finalDischargeCountryCode == "SI"
    And match response[0].finalDeliveryLocationCode == "SIKOP"
    And match response[0].placeOfDeliveryCountryCode == "SI"
    And match response[0].carrierCode == "ALL"
    And match response[0].containerType == "20 REEF"
    And match response[1].containerType == "40 DRY"
    And match response[0].cargoType == "ALL"
    And match response[0].defaultReturnDepots[0] == "SIKOPDP"
    And match response[0].defaultReturnDepots[1] == "SIKOPDL"
    And match response[1].defaultReturnDepots[0] == "HRSPUPT"
    And match response[1].defaultReturnDepots[1] == "SIKOPDL"
    And match response[0].allowedCountriesForSearch[0] == "HR"
    And match response[0].isAllowedToEditReturnDepot == false
    And match response[1].isAllowedToEditReturnDepot == false
  #OR
    And match response ==
  """
  [
  {
  "finalDischargePortCode": "SIKOP",
  "finalDischargeCountryCode": "SI",
  "finalDeliveryLocationCode": "SIKOP",
  "placeOfDeliveryCountryCode": "SI",
  "carrierCode": "ALL",
  "containerType": "20 REEF",
  "cargoType": "ALL",
  "importDeliveryMode": "CY",
  "defaultReturnDepots": [
  "SIKOPDP",
  "SIKOPDL"
  ],
  "allowedCountriesForSearch": [
  "HR"
  ],
  "isAllowedToEditReturnDepot": false
  },
  {
  "finalDischargePortCode": "SIKOP",
  "finalDischargeCountryCode": "SI",
  "finalDeliveryLocationCode": "SIKOP",
  "placeOfDeliveryCountryCode": "SI",
  "carrierCode": "ALL",
  "containerType": "40 DRY",
  "cargoType": "ALL",
  "importDeliveryMode": "CY",
  "defaultReturnDepots": [
  "HRSPUPT",
  "SIKOPDL"
  ],
  "allowedCountriesForSearch": [
  "HR"
  ],
  "isAllowedToEditReturnDepot": false
  }
  ]
  """

  @RC400
  Scenario: Verify Empty container Return Depot Rules GET API when we have input parameter finalDeliveryGeoLocationId missing

    And param finalDeliveryGeoLocationId = 'KYKBROU8A0XZB'
    And param carrierCode = 'SEJJ'
    And param importDeliveryMode = 'CY'
    And param containerTypes = '20 TANK'
    And param cargoTypes = 'DRY,OOG'
    When method get
    Then status 400
    And print response
    * def response =
  """
  {
  "method": "GET",
  "requestUri": "/import-business-rules/v2/empty-container-return-depots",
  "status": 400,
  "timestamp": "11-07-2021 05:20:14",
  "message": "Bad Request",
  "id": "88e8fd46-8919-4919-be55-1c4a53a05805"
  }
  """
    And match response ==
  """
  {
  "method": "#string",
  "requestUri": "#string",
  "status": "#number",
  "timestamp": "#string",
  "message": "#string",
  "id": "#string"
  }
  """

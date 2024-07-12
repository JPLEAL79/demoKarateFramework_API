Feature: Endpoint POST create token

  Background:
    * url url
    * header Content-Type = 'application/json'

    @token @critico
  Scenario: create token
    * def body =
      """
      {
        "username" : "admin",
        "password" : "password123"
      }
      """
    Given path 'auth'
    And request body
    When method post
    Then status 200



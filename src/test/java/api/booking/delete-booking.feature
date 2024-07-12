Feature: Endpoint DELETE booking

  Background:
    * url url
    Given path 'booking'
    When method get
    Then status 200
    * def id = $[0].bookingid

    * def all = call read('classpath:api/auth/create-token.feature')
    * cookie token = all.response.token
    * header Content-Type = 'application/json'

  Scenario: Eliminar booking
    Given path 'booking' , id
    When method delete
    Then status 201

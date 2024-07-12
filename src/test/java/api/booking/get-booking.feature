Feature: Endpoint GET booking

  Background:
    * url url


  Scenario: Get all booking
    Given path 'booking'
    When method get
    Then status 200
    * def cantidad = response.length
    # devuelve todas las reserva
    * print 'Nro. de booking: ', cantidad
    #Valida el número total de reserva


  Scenario: Get booking details
    #devuelve el detalle del Id espesifico
    * header Accept = 'application/json'
    Given path 'booking' , 3765
    When method get
    Then status 200

    #Devuelve el detalle de cada id
  Scenario Outline: Get booking details table
    * header Accept = 'application/json'
    Given path 'booking' , '<id>'
    When method get
    Then status <status>

    Examples:
      | id    | status |
      | 10153 | 200    |
      | 11210 | 200    |
      | 12648 | 200    |
      | 6287  | 200    |


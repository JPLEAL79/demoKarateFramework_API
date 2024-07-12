Feature: Endpoint POST booking

  Background:
    * url url
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'


  Scenario: Create booking
    * def body = read('post-body.json')
    Given path 'booking'
    And request body
    When method post
    Then status 200
    And match $.booking.firstname contains 'Jim'
    And match $.booking.lastname contains 'Brown'
    And match $.booking.totalprice == 111
    And match $.booking.depositpaid == true
    And match $.booking.bookingdates.checkin contains '2018-01-01'
    And match $.booking.bookingdates.checkout contains '2019-01-01'
    And match $.booking.additionalneeds contains 'Breakfast'




  Scenario Outline: Create booking data table
    * def body = read('post-body.json')
    Given path 'booking'
    And request body
    When method post
    Then status <status>
    And match $.booking.firstname contains '<nombre>'
    And match $.booking.lastname contains '<apellido>'
    And match $.booking.totalprice == <precio>
    And match $.booking.depositpaid == <deposito>
    And match $.booking.bookingdates.checkin contains '<fecha_inicio>'
    And match $.booking.bookingdates.checkout contains '<fecha_fin>'
    And match $.booking.additionalneeds contains '<adicional>'


    Examples:
      | nombre | apellido | precio | deposito | fecha_inicio | fecha_fin  | adicional | status |
      | Juan   | Leal     | 520    | true     | 2022-01-20   | 2022-12-31 | prueba1   | 200    |
      | Jose   | perez    | 850    | true     | 2022-04-20   | 2022-11-30 | prueba2   | 200    |


  Scenario Outline: Create booking data table unhappy
    * def body = read('post-body.json')
    Given path 'booking'
    And request body
    When method post
    Then status <status>

    Examples:
      | nombre   | apellido | precio | deposito | fecha_inicio | fecha_fin  | adicional | status |
      | eqweewqe | perez    | qwer   | true     | 2022-04-20   | 2022-11-30 | prueba3   | 400    |


  Scenario Outline: Create booking data table csv
    * def body = read('post-body.json')
    Given path 'booking'
    And request body
    When method post
    Then status <estado>
    And match $.booking.firstname contains '<nombre>'
    And match $.booking.lastname contains '<apellido>'
    And match $.booking.totalprice == <precio>
    And match $.booking.depositpaid == <deposito>
    And match $.booking.bookingdates.checkin contains '<fecha_inicio>'
    And match $.booking.bookingdates.checkout contains '<fecha_fin>'
    And match $.booking.additionalneeds contains '<adicional>'


    Examples:
      |read('booking-data.csv')|



@token
  Scenario Outline: Create booking data table con Schema
    * def body = read('post-body.json')
    * def data = read('schema-booking.json')

    Given path 'booking'
    And request body
    When method post
    Then status <estado>
    And match $.booking.firstname contains '<nombre>'
    And match $.booking.lastname contains '<apellido>'
    And match $.booking.totalprice == <precio>
    And match $.booking.depositpaid == <deposito>
    And match $.booking.bookingdates.checkin contains '<fecha_inicio>'
    And match $.booking.bookingdates.checkout contains '<fecha_fin>'
    And match $.booking.additionalneeds contains '<adicional>'
    And match response == data


    Examples:
      |read('booking-data.csv')|



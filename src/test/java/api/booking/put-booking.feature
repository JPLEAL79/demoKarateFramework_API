Feature: Endpoint PUT booking

Background:
* url url
* def all = call read('classpath:api/auth/create-token.feature')
* header Content-Type = 'application/json'
* header Accept = 'application/json'
* cookie token = all.response.token
  #* header Authorization = 'Bearer' , token

  Scenario Outline: Update booking
    * def body = read('post-body.json')
    Given path 'booking' , <id>
    And request body
    When method put
    Then status <status>

    Examples:
      | id   | nombre | apellido | precio | deposito | fecha_inicio | fecha_fin  | adicional | status |
      | 5908 | juan   | leal     | 520    | true     | 2022-01-20   | 2022-12-31 | prueba1   | 200    |
      | 7018 | pedro  | vergara  | 850    | true     | 2022-04-20   | 2022-11-30 | prueba2   | 200    |


  Scenario Outline: Partial Update booking
    * def body =
    """
    {
      "firstname" : "<nombre>",
      "lastname" : "<apellido>"
    }
    """
    Given path 'booking' , <id>
    And request body
    When method patch
    Then status <status>

    * header Accept = 'application/json'
    Given path 'booking' , <id>
    When method get
    Then status 200
    And match $.firstname contains '<nombre>'
    And match $.lastname contains '<apellido>'



    Examples:
      | id   | nombre | apellido | precio | deposito | fecha_inicio | fecha_fin  | adicional | status |
      | 5908 | juan   | leal     | 520    | true     | 2022-01-20   | 2022-12-31 | prueba1   | 200    |
      | 7018 | pedro  | vergara  | 850    | true     | 2022-04-20   | 2022-11-30 | prueba2   | 200    |



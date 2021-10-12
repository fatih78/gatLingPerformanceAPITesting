@karate
Feature: Testing UPDATE (GETS) with Two different Assertions

  Background:
    * def baseUrl = 'http://localhost:8000/'
    * def fourth = 4


  Scenario: checking after UPDATE Assertion1
    * call read('d.Drink_PUT.feature@UpdateNewDrink')
    Given url baseUrl + 'drinks/' + 4
    When method get
    Then status 200
    And match $response.name == "UPDATE_Drink"
    And match $response.email == "update@gmail.com"
    * print response
    #after step
    * call read('b.Drink_DELETE.feature@DeleteNewDrink')


  Scenario: checking after UPDATE Assertion2
    * call read('d.Drink_PUT.feature@UpdateNewDrink')
    Given url baseUrl + 'drinks/' + 4
    When method get
    Then status 200
    And match response[*] contains "UPDATE_Drink"
    And match response[*] contains "update@gmail.com"
    * print response
    #after step
    * call read('b.Drink_DELETE.feature@DeleteNewDrink')

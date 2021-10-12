@karate
Feature: Testing DELETE of the CREATED Drinks

  Background:
    * def baseUrl = 'http://localhost:8000/'
    * def fourth = 4


  @DeleteNewDrink
  Scenario: deleting extra set of data
    Given url baseUrl + 'drinks/' + 4
    When method delete
#    Then status 204


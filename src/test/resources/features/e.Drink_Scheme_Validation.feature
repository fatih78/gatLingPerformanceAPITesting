@karate
Feature: Testing SchemeValidation

  Background:
    * url baseUrl

  Scenario: checking SchemeValidation
    * call read('a.Drink_CREATE.feature@CreateNewDrink')
    Given path 'drinks/' + 4
    When method get
    Then status 200
    * print response
    And match response ==
  """
{
  "name" : "#string",
  "sort" : "#string",
  "abv" : "#ignore",
  "email" : "#string",
  "country" : "#ignore",
  "id" : "#number",
  "_links" : {
    "self" : {
      "href" : "#ignore"
    },
    "drink" : {
      "href" : "#ignore"
    }
  }
}
"""
    #after step
    * call read('b.Drink_DELETE.feature@DeleteNewDrink')
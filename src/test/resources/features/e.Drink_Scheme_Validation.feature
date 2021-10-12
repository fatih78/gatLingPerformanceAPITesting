@karate
Feature: Testing SchemeValidation

  Background:
    * def baseUrl = 'http://localhost:8000/'
    * def fourth = 4

  Scenario: checking SchemeValidation
#   The scenario can be runned standAlone by calling the right scenario/feature on which it is depending
    * call read('a.Drink_CREATE.feature@CreateNewDrink')
    Given url baseUrl + 'drinks/' + fourth
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
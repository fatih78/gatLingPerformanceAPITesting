@karate
Feature: Testing CREATE of the Drinks

  Background:
    * def baseUrl = 'http://localhost:8000/'
    * def fourth = 4


  @UpdateNewDrink
  Scenario: PUT changed field on created set of data
    * call read('a.Drink_CREATE.feature@CreateNewDrink')
    Given url baseUrl + 'drinks/' + 4
    And request {"name" : "UPDATE_Drink","sort" : "Non-Alcoholic","abv" : 0.0,"email" : "update@gmail.com","country" : "Turkey","id" : 4,"_links" : {"self" : {"href" : "http://localhost:8000/drinks/4"},"drink" : {"href" : "http://localhost:8000/drinks/4"}}}
    When method put
    Then status 204

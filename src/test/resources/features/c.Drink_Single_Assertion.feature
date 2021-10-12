@karate
#@ignore
Feature: Testing GETS of the CREATED Drinks - SINGLE Line Assertions

  Background:
    * def baseUrl = 'http://localhost:8000/'
    * def fourth = 4

#    Variable's from Helper class 'TestDataGenerator':
    * def testData = Java.type('utils.TestDataGenerator')
    * def newDrink = karate.get('newDrink') != undefined ? newDrink : testData.generateDrink()


  Scenario: checking the extra drink is PRESENT by single assertion
#   The scenario can be runned standAlone by calling the right scenario/feature on which it is depending
    * call read('a.Drink_CREATE.feature@CreateNewDrink')
    Given url baseUrl + 'drinks/' + 4
    When method get
    Then status 200
    And match response[*] contains newDrink
    And match response[*] contains email
    #after step
    * call read('b.Drink_DELETE.feature@DeleteNewDrink')

  Scenario: checking the extra drink is NOT PRESENT anymore in the default data set
#   The scenario can be runned standAlone by calling the right scenario/feature on which it is depending
    * call read('b.Drink_DELETE.feature@DeleteNewDrink')
    Given url baseUrl + 'drinks'
    When method get
    Then status 200
    And match response[*] !contains newDrink
#    will fail!
#    And match response[*] contains newDrink

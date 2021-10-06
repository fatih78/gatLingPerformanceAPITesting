@karate
Feature: Testing CRUD: Create, Check and Delete on endpoint

  Background:
    * def baseUrl = 'http://localhost:8000/'
    * def fourth = 4

#  Data - json files
    * def inputData = read('classpath:inputData/newDrink.json')
    * def outputData = read('classpath:outputData/createdDrink.json')
    * def defaultData = read('classpath:outputData/defaultData.json')

#    Variable's from Helper class 'TestDataGenerator':
    * def testData = Java.type('utils.TestDataGenerator')
    * def newDrink = karate.get('newDrink') != undefined ? newDrink : testData.generateDrink()

  @CreateFantaDrink
  Scenario: creating extra set of data
    Given url baseUrl + 'drinks'
    And request inputData
    And set inputData.name = newDrink
    And set inputData.sort = "Non-Alcoholic"
    And set inputData.country = "America"
    When method post
    Then status 201

  @GetNewDrink
  Scenario: checking extra set of data
#   The scenario can be runned sstandAlone by calling the right scenario/feature on which it is depending
    * call read('karateCRUD.feature@CreateFantaDrink')
    Given url baseUrl + 'drinks/' + 4
    When method get
    Then status 200
    * print response
#   check generated newDrink is in the response
    And match $response.name == newDrink
#   another check by full json comparison
    And match response == outputData

  @DeleteNewDrink
  Scenario: deleting extra set of data
#   The scenario can be runned standAlone by calling the right scenario/feature on which it is depending
    * call read('karateCRUD.feature@GetNewDrink')
    Given url baseUrl + 'drinks/' + 4
    When method delete
    Then status 204


  Scenario: checking the extra drink is not anymore present in the default data set
#   The scenario can be runned standAlone by calling the right scenario/feature on which it is depending
    * call read('karateCRUD.feature@DeleteNewDrink')
    Given url baseUrl + 'drinks'
    When method get
    Then status 200
    And match response[*] !contains newDrink
#    will fail!
#    And match response[*] contains newDrink
    And match response == defaultData
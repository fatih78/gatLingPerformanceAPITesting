@karate
Feature: Testing CRUD: Create, Check and Delete on endpoint

  Background:
    * def baseUrl = 'http://localhost:8000/'
    * def fourth = 4
    * def inputData = read('classpath:inputData/newDrink.json')
    * def outputData = read('classpath:outputData/newDrinkFanta.json')

  @CreateFantaDrink
  Scenario: creating extra set of data
    Given url baseUrl + 'drinks'
    And request inputData
    And set inputData.name = "Fanta"
    And set inputData.sort = "Non-Alcoholic"
    And set inputData.country = "America"
    When method post
    Then status 201

  @GetFantaDrink
  Scenario: checking extra set of data
#   The scenario can be runned sstandAlone by calling the right scenario/feature on which it is depending
    * call read('karateCRUD.feature@CreateFantaDrink')
    Given url baseUrl + 'drinks/' + 4
    When method get
    Then status 200
    And match response contains {"name":'Fanta', "sort":'Non-Alcoholic', "abv":0, "id":4}
#   another check by full json comparison
    And match response == outputData

  Scenario: deleting extra set of data
    #   The scenario can be runned sstandAlone by calling the right scenario/feature on which it is depending
    * call read('karateCRUD.feature@GetFantaDrink')
    Given url baseUrl + 'drinks/' + 4
    When method delete
    Then status 204
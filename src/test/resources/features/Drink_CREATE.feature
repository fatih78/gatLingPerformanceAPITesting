@karate
Feature: Testing CREATE of the Drinks

  Background:
    * def baseUrl = 'http://localhost:8000/'
    * def fourth = 4

#  Data - json files
    * def inputData = read('classpath:inputData/newDrink.json')
    * def jsonCreatedDrink = read('classpath:outputData/createdDrink.json')
    * def enrichedData = read('classpath:outputData/enrichedData.json')
    * def defaultData = read('classpath:outputData/defaultData.json')

#    Variable's from Helper class 'TestDataGenerator':
    * def testData = Java.type('utils.TestDataGenerator')
    * def newDrink = karate.get('newDrink') != undefined ? newDrink : testData.generateDrink()
    * def email = karate.get('email') != undefined ? email : testData.generateRandomEmail()
    * def encodedEmail = karate.get('encodedEmail') != undefined ? encodedEmail : testData.generateEncodedEmail()

  @CreateNewDrink
  Scenario: creating extra set of data
    Given url baseUrl + 'drinks'
    And request inputData
    And set inputData.name = newDrink
    And set inputData.sort = "Non-Alcoholic"
    And set inputData.email = email
    * print email
    And set inputData.country = "America"
    When method post
    Then status 201

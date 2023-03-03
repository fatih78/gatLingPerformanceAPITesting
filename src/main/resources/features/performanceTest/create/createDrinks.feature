@karate
Feature: Testing CREATE of the Drinks

  Background:
    * url baseUrl
#   zonder global config file 'karate-config.js'
#    * def baseUrl = 'http://localhost:8000/'

  #  Data - json files
    * def testData = Java.type('utils.TestDataGenerator')
    * def inputData = read('classpath:helpers/newDrink.json')

#    Variable's from Helper class 'TestDataGenerator':
    * def newDrink = karate.get('newDrink') != undefined ? newDrink : testData.generateDrink()
    * def email = karate.get('email') != undefined ? email : testData.generateRandomEmail()
    * def encodedEmail = karate.get('encodedEmail') != undefined ? encodedEmail : testData.generateEncodedEmail()

  @CreateNewDrink
  Scenario Outline: creating extra set of data
    Given path 'drinks'
    And request inputData
    And set inputData.name = newDrink
    And set inputData.sort = "Non-Alcoholic"
    And set inputData.email = email
    And set inputData.id = <id>
    And set inputData.country = "Holland"
    When method post
    Then status 201
    Examples:
      | id |
      | 4  |
      | 5  |
      | 6  |
      | 7  |
      | 8  |
      | 9  |
      | 10 |
      | 11 |
      | 12 |

  @DeleteNewDrink
  Scenario Outline: deleting extra set of data
    Given path 'drinks/' + <id>
    When method delete
    Then status 204
    Examples:
      | id |
      | 4  |
      | 5  |
      | 6  |
      | 7  |
      | 8  |
      | 9  |
      | 10 |
      | 11 |
      | 12 |

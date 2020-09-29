@karate
Feature: Testing CRUD: Create, Check and Delete on endpoint

  Background:
    * url 'http://localhost:8000/'
    * def fourth = 4

  Scenario: creating extra set of data
    Given path 'drinks'
    And request {"name":'Fanta', "sort":'non-alcoholic', "abv":0, "id":4, "country":'America'}
    When method post
    Then status 201

  Scenario: checking extra set of data
    Given path 'drinks', fourth
    When method get
    Then status 200
    And match response contains {"name":'Fanta', "sort":'non-alcoholic', "abv":0, "id":4}

  Scenario: deleting extra set of data
    Given path 'drinks', fourth
    When method delete
    Then status 204
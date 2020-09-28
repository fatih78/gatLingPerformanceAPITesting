@karate
Feature: Testing valid GET endpoint

  Background:
    * url 'http://localhost:8000/'
    * def first = 1
    * def second = 2
    * def third = 3


  Scenario: Testing valid GET endpoint
    Given path 'drinks'
    When method get
    Then status 200

  Scenario: validating first set of data contains all the values for 'Raki'
    Given path 'drinks', first
    When method get
    Then status 200
    And match response contains {"name":'Raki', "sort":'alcoholic', "abv":20, "id":1, "country":'Turkey'}

  Scenario: validating second set of data contains all the values for 'Cola'
    Given path 'drinks', second
    When method get
    Then status 200
    And match response contains {"name":'Cola', "sort":'non-alcoholic', "abv":0, "id":2, "country":'America'}

  Scenario: validating third set of data contains all the values for 'Gazoz'
    Given path 'drinks', third
    When method get
    Then status 200
    And match response contains {"name":'Gazoz', "sort":'non-alcoholic', "abv":0, "id":3, "country":'Turkey'}








@karate
Feature: Testing2 valid GET endpoint

  Background:
    * url baseUrl
    * def first = 1
    * def second = 2
    * def third = 3


  Scenario: Testing valid GET endpoint - TWO
    Given path 'drinks'
    When method get
    Then status 200
    And print 'Response is: ', response

  Scenario: validating first set of data contains all the values for 'Raki' - TWO
    Given path 'drinks', first
    When method get
    Then status 200
    And match response contains {"name":'Raki', "sort":'alcoholic', "abv":20, "id":1, "country":'Turkey'}
    And print 'Response is: ', response

  Scenario: validating second set of data contains all the values for 'Cola' - TWO
    Given path 'drinks', second
    When method get
    Then status 200
    And match response contains {"name":'Cola', "sort":'non-alcoholic', "abv":0, "id":2, "country":'America'}
    And print 'Response is: ', response

  Scenario: validating third set of data contains all the values for 'Gazoz' - TWO
    Given path 'drinks', third
    When method get
    Then status 200
    And match response contains {"name":'Gazoz', "sort":'non-alcoholic', "abv":0, "id":3, "country":'Turkey'}
    And print 'Response is: ', response







@karate
Feature: Testing valid GET endpoint

Scenario: Testing valid GET endpoint
Given url 'http://localhost:9000/drinks'
When method GET
Then status 200
# README #

This README describes the (API)performance testing done via Gatling using the existing KarateFrameWork.

### What is this repository for? ###

* Version: 0.1
* For these tests both the files in folder 'src/main/resources/features/performanceTest'
* And files in folder 'src/test/java/perf' are used

#### Folder 'src/main/resources/features/performanceTest' ####
* This folder contains the logical testcases for API calls in Karate Format (BDD/Gherkin)
* This folder also contains file 'tasks.gatling.config' which is used to override the default values for the reporting
  * Reports are stored automatically in folder 'build/reports/tasks.gatling'
* This folder includes a json body for creation of subscriptions
* Notes:
  * Testing is done against own endPoint on localhost:8080, see global README for clarification about starting up the endPoint


#### Folder 'src/test/java/uitls' ####
* The 'utils.TestDataGenerator' class is used to generate dynamic data within the Api calls & in the Karate Gherkin files

#### GatLing Test Scripts - simulations.PerfTestCREATEPeak, simulations.PerfTestPeakUsers &  simulations.PerfTestRampUpUsers in 'src/test/java/perf'####
* These scripts are the tasks.gatling performance testscripts written in Scala.
* They contain currently the below scenario's: 
  * simulations.PerfTestCREATEPeak: Create new Drinks on the endPoint with a certain load


#### GatLing Test Scripts - TestRuns ####
* Test runs can be done by the gradle tasks which are included in the 'build.gradle' file
  * task gatlingRunCreatePeak(type: JavaExec)
  * to turn off peformance test runs add or disable following in the 'settings.gradle'
    * startParameter.excludedTaskNames= ["gatlingRunPeakUsers","gatlingRunRampUpUsers","gatlingRunCreatePeak"]
  * the testReports are generated in the build folder after eachr run:  'build/reports/gatling'

#### Reporting - https://gatling.io/2022/01/my-first-gatling-test-report/ ####
* Percentiles
  * How does a response time compare to all the others?
  * All of these statements are saying the same thing:
    * Measured at the 90th percentile, the response time is 3 seconds.
    * A response time of 3 seconds is greater than 90% of all responses.
    * 90% of responses were faster than 3 seconds.
    * 10% of responses were slower than 3 seconds.

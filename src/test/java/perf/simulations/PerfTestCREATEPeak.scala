package simulations

import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder

import scala.concurrent.duration.DurationInt
import scala.language.postfixOps

class PerfTestCREATEPeak extends Simulation {

  before {
    println("Perf tests - Create Drinks - started")
  }


  def successThreshold = 99
  def secondMillis = 1000
  val (p1, p2, p3, p4) = percentiles
  def percentiles: (Int, Int, Int, Int) = {
    ((1.0 * secondMillis).toInt, 1 * secondMillis, 1 * secondMillis, 1 * secondMillis)
  }


  val protocol: KarateProtocol = karateProtocol(
    "https" -> pauseFor("post" -> 200)
  )

  val createDrinks: ScenarioBuilder = scenario("createDrink").group("Create Drinks") {
    exec(karateFeature("classpath:create/createDrinks.feature", "@CreateNewDrink"))
  }



  setUp(
    createDrinks.inject(stressPeakUsers(1).during(1 seconds)).protocols(protocol)
  ).maxDuration(duration = 10 seconds)
    .assertions(
    List(
      global.successfulRequests.percent.gte(successThreshold)
      , global.responseTime.mean.lte(p1)
    ))


  after {
    println("Perf tests - Create Drinks - ended")
  }
}
package runners;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.core.Scenario;
import com.intuit.karate.core.ScenarioResult;
import com.intuit.karate.core.Step;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestRunnerKarate {
    public static Results results;
    static final Logger logger = LoggerFactory.getLogger(runners.TestRunnerKarate.class);

    public static void testParallel() throws InterruptedException {

        System.setProperty("karate.env", "demo"); // ensure reset if other tests (e.g. mock) had set env in CI
        results = Runner
                .path("classpath:features")
                .outputCucumberJson(true)
                .tags("~@ignore")
                .parallel(10);
        retry();

    }

    //  For now a retry mechanism implemented as workAround. It creates a list of failed scenario's & does 1 rerun on failed scenario's
    //  Note: The 'Karate' community is busy with a generic solution for this in the upcoming releases.
    public static void retry() throws InterruptedException {
        Thread.sleep(1000);
        if (results.getFailCount() >= 1) {
            List<ScenarioResult> failed = results.getScenarioResults().filter(sr -> sr.isFailed()).collect(Collectors.toList());
            for (int i = 0; i < failed.size(); i++) {
                Scenario scenario = failed.get(i).getScenario();
                Step step = scenario.getSteps().get(i);
                results.getSuite().retryScenario(scenario);
                logger.error(step.getText());
                assertEquals(0, results.getFailCount());
            }
        } else {
            logger.error("Nothing failed, no need to rerun!");
        }
    }

    public static void main(String[] args) throws InterruptedException {
        TestRunnerKarate.testParallel();
    }
}



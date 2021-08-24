package runners;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.core.Scenario;
import com.intuit.karate.core.ScenarioResult;
import com.intuit.karate.core.Step;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.sorting.SortingMethod;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;

public class TestRunnerKarate {
    public static Results results;
    static final Logger logger = LoggerFactory.getLogger(runners.TestRunnerKarate.class);


    @Test
    public void testParallel() throws InterruptedException {

        System.setProperty("karate.env", "demo"); // ensure reset if other tests (e.g. mock) had set env in CI
        results = Runner
                .path("classpath:features")
                .outputCucumberJson(true)
                .tags("~@ignore")
                .parallel(1);
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
                generateReport(results.getReportDir());
                logger.error(step.getText());
                assertEquals(0, results.getFailCount());
            }
        } else {
            generateReport(results.getReportDir());
            logger.error("Nothing failed, no need to rerun!");
        }
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "KarateAPITest");
        config.setSortingMethod(SortingMethod.ALPHABETICAL);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}



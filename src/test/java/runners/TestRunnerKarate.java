package runners;


import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(
        strict = true,
        features = {"src/test/resources/features/karateGET.feature", "src/test/resources/features/karateCRUD.feature"},
        plugin = {"pretty", "html:target/cucumber-report/jsonfiles", "json:target/cucumber-report/jsonfiles/PatientMS.json"},
        tags = {"@karate"}
        )
public class TestRunnerKarate {
}

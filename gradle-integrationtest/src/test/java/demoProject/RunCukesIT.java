package demoProject;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;


@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"pretty", "html:build/reports/cucumber.html", "json:build/reports/cucumber.json"},
        features = "src/test/resources/",
        tags = "@DemoAPI",snippets = CucumberOptions.SnippetType.CAMELCASE)
public class RunCukesIT {
}

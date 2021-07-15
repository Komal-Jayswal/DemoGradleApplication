package demoProject.steps;


import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import static org.hamcrest.Matchers.containsString;


/**
 * Given step definitions.
 *
 * @author AVM031 - Avinash M
 */

public class stepDefinitions {
    private static final String BASE_URL = "http://localhost:8090/";
    private RequestSpecification request;
    private static Response response;

    @Given("^end point is configured from user$")
    public void end_point_is_configured_from_user() throws Throwable {
        RestAssured.baseURI = BASE_URL;
        request = RestAssured.given();

    }

    @When("^user calls api to get \"([^\"]*)\" details$")
    public void user_calls_api_to_get_something_details(String path) throws Throwable {
        response = request.get(path);
        response.then().log().all();
    }

    @Then("^endpoint respond with status code \"([^\"]*)\"$")
    public void endpoint_respond_with_status_code_something(String statusCode) throws Throwable {

        response.then().statusCode(Integer.parseInt(statusCode));
    }

}




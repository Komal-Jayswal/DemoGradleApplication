package com.apmoller.integrationtest.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class GradleIntegrationTest {

    public static void main(String[] args) {
        SpringApplication.run(GradleIntegrationTest.class, args);
        System.out.println("Gradle Integration Test Demo");
    }
}

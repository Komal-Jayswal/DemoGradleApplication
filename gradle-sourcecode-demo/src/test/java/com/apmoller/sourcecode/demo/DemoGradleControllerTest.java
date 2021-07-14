package com.apmoller.sourcecode.demo;

import com.apmoller.sourcecode.demo.utility.UserList;
import org.junit.jupiter.api.*;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.reactive.AutoConfigureWebTestClient;
import org.springframework.boot.test.context.SpringBootTest;

import org.springframework.test.web.reactive.server.WebTestClient;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.BDDMockito.given;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureWebTestClient
public class DemoGradleControllerTest {

	List<String> userList = new ArrayList<>();

	@Autowired
	private WebTestClient webTestClient;

	@Mock
	UserList userlist;

	@Test
	void justAnExample() {
		System.out.println("This test method should be run");
	}

	@Test
	public void test_ResponseOK() {

		this.webTestClient.get()
				.uri("/users")
				.exchange()
				.expectStatus().isOk()
				.expectBody()
				.equals("Maven,Gradle,Ant");
	}

	/*@Test
	public void test_500_Internal_Server_Error() {

		given(userlist.getDefaultUserList(Mockito.anyList())).willReturn(userList);

		this.webTestClient.get()
				.uri("/users")
				.exchange()
				.expectStatus().is5xxServerError();
	}*/
}
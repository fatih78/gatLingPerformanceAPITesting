package com.example.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.hamcrest.core.StringContains.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
public class DemoApplicationTests {
    @LocalServerPort
    private int port = 8080;

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void endPointShouldContainRaki() throws Exception {
        assertThat(
                this.restTemplate
                        .getForObject("http://localhost:" + port + "/drinks",
                                String.class))
                .contains("Raki");
    }

    @Test
    public void endPointShouldContainAlcoholic() throws Exception {
        assertThat(
                this.restTemplate
                        .getForObject("http://localhost:" + port + "/drinks",
                                String.class))
                .contains("alcoholic");
    }

    @Test
    public void endPointShouldContainNonAlcoholic() throws Exception {
        assertThat(
                this.restTemplate
                        .getForObject("http://localhost:" + port + "/drinks",
                                String.class))
                .contains("non-alcoholic");
    }

    @Test
    public void endPointShouldContainCola() throws Exception {
        assertThat(
                this.restTemplate
                        .getForObject("http://localhost:" + port + "/drinks",
                                String.class))
                .contains("Cola");
    }

    @Test
    public void endPointShouldContainGazoz() throws Exception {
        assertThat(
                this.restTemplate
                        .getForObject("http://localhost:" + port + "/drinks",
                                String.class))
                .contains("Gazoz");
    }

    @Test
    public void shouldReturnStatusOK() throws Exception {
        this.mockMvc
                .perform(get("http://localhost:" + port + "/drinks"))
                .andDo(print())
                .andExpect(status()
                        .isOk())
                .andExpect(content()
                        .string(containsString("Cola")));
    }

}

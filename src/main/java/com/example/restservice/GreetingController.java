package com.example.restservice;

import java.util.concurrent.atomic.AtomicLong;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

	private static final String template = "Hello V28, %s!";

	@Value("${config.parameter}")
	private String configParam;

	private final AtomicLong counter = new AtomicLong();

	@GetMapping(value = "/greeting", produces = MediaType.APPLICATION_JSON_VALUE)
	public String greeting(@RequestParam(value = "name", defaultValue = "World") String name) throws Exception {
		Greeting greeting = new Greeting(counter.incrementAndGet(), String.format(template, name), configParam);
		return new ObjectMapper().writeValueAsString(greeting);
	}
}

package com.example.restservice;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@PropertySource("file:/Users/akshay.bhatt/Documents/flipkart/fk-build-flow-demo/src/main/java/resources/application.properties")
@PropertySource("file:${SERVER_CONFIG}")
public class GreetingController {

	private static final String template = "Hello V24, %s!";

	@Value("${config.parameter}")
	private String configParam;

	private final AtomicLong counter = new AtomicLong();

	@GetMapping("/greeting")
	public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name), configParam);
	}
}

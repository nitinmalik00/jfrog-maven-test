package com.example.restservice;

public class Greeting {
//
	private final long id;
	private final String content;
	private final String staticConfig;

	public Greeting(long id, String content, String staticConfig) {
		this.id = id;
		this.content = content;
		this.staticConfig = staticConfig;
	}

	public long getId() {
		return id;
	}

	public String getContent() {
		return content;
	}

	public String getStaticConfig() {
		return staticConfig;
	}

	@Override
	public String toString() {
		return "Greeting{" +
				"id=" + id +
				", content='" + content + '\'' +
				", staticConfig='" + staticConfig + '\'' +
				'}';
	}
}

package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.library.*;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		new LibraryJar();
		SpringApplication.run(DemoApplication.class, args);
	}

}

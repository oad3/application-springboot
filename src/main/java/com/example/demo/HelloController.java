package com.example.demo;

// import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        String message = "Hello this is environment of ";
        String envVariable = System.getenv("ENVIRONMENT_VALUE");
        if (envVariable != null) {
            System.out.println("ENVIRONMENT_VALUE: " + envVariable);
        } else {
            System.out.println("ENVIRONMENT_VALUE is not set");
        }
        return message + envVariable;
    }
}
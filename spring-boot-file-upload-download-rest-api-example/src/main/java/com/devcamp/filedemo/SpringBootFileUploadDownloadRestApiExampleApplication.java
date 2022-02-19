package com.devcamp.filedemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.devcamp.filedemo.property.FileStorageProperties;

@SpringBootApplication
@EnableConfigurationProperties({
    FileStorageProperties.class
})
public class SpringBootFileUploadDownloadRestApiExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootFileUploadDownloadRestApiExampleApplication.class, args);
	}

}

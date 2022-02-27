package com.devcamp.shop24h;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class Shop24hApplication {

	public static void main(String[] args) {
		SpringApplication.run(Shop24hApplication.class, args);
	}

}

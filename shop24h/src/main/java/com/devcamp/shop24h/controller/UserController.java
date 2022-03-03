package com.devcamp.shop24h.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.devcamp.shop24h.repository.UserRepository;

@CrossOrigin
@RestController
public class UserController {
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/user")
	public ResponseEntity<?> getAllUser() {
		return ResponseEntity.ok( userRepository.findAll());
	}
}

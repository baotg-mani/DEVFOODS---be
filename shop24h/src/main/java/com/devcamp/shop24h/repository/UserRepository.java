package com.devcamp.shop24h.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devcamp.shop24h.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}

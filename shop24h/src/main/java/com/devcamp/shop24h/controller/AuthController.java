package com.devcamp.shop24h.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.devcamp.shop24h.model.Token;
import com.devcamp.shop24h.model.User;
import com.devcamp.shop24h.security.JwtUtil;
import com.devcamp.shop24h.security.UserPrincipal;
import com.devcamp.shop24h.service.TokenService;
import com.devcamp.shop24h.service.UserService;
import com.nimbusds.jwt.JWTClaimsSet;

@RestController
@CrossOrigin
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private JwtUtil jwtUtil;
    

    @PostMapping("/register")
    public User register(@RequestBody User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));

        return userService.createUser(user);
    }

    @PostMapping("/login")
//    @PreAuthorize("hasRole('ROLE_ADMIN') || hasRole('ROLE_CUSTOMER') || hasRole('ROLE_MANAGER')")
    public ResponseEntity<?> login(@RequestBody User user) {
        UserPrincipal userPrincipal = userService.findByUsername(user.getUsername());
        if (null == user || !new BCryptPasswordEncoder().matches(user.getPassword(), userPrincipal.getPassword())) {
            return ResponseEntity.badRequest().body("tài khoản hoặc mật khẩu không chính xác");
        } else {
        	 Token token = new Token();
             token.setToken(jwtUtil.generateToken(userPrincipal));
             token.setTokenExpDate(jwtUtil.generateExpirationDate());
             token.setCreatedBy(userPrincipal.getUserId());
             tokenService.createToken(token);
             
             return ResponseEntity.ok(token.getToken());
        }
    }

//    @GetMapping("/claims/{token}")
//    public JWTClaimsSet getClaims(@PathVariable String token) {
//    	return jwtUtil.getClaimsFromToken(token);
//    }
    
    
	/*
	 * Dùng @PreAuthorize kèm: 
	 * 		hasAnyAuthority 
	 * 		hasAuthority 
	 * 		hasAnyRole 
	 * 		hasRole 
	 * để tùy chọn phân quyền (authorize)
	 */
    
    @GetMapping("/hello")
//    @PreAuthorize("hasAnyAuthority('USER_CREATE', 'USER_UPDATE')")
	@PreAuthorize("hasRole('ROLE_ADMIN') || hasRole('ROLE_CUSTOMER') || hasRole('ROLE_MANAGER')")
    public ResponseEntity<?> hello() {
        return ResponseEntity.ok("hello Admin, Customer and Manager");
    }
    
    @GetMapping("/hello2")
    @PreAuthorize("hasAnyAuthority('USER_DELETE')")
//    @PreAuthorize("hasRole('ROLE_MANAGER') || hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> hello2() {
        return ResponseEntity.ok("hello Manager and Admin");
    }
    
    @GetMapping("/hello3")
    @PreAuthorize("hasAnyRole('ADMIN', 'CUSTOMER')")
    public ResponseEntity<?> hello3() {
        return ResponseEntity.ok("hello Admin and Customer");
    }
    
    @GetMapping("/hello4")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> hello4() {
        return ResponseEntity.ok("hello Admin");
    }
    
    @GetMapping("/hello5")
    @PreAuthorize("hasRole('MANAGER')")
    public ResponseEntity<?> hello5() {
        return ResponseEntity.ok("hello Manager");
    }

    @GetMapping("/hello6")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> hello6() {
        return ResponseEntity.ok("hello Admin");
    }
    
}

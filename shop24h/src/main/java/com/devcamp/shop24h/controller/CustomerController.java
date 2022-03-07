package com.devcamp.shop24h.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.devcamp.shop24h.model.Customer;
import com.devcamp.shop24h.model.User;
import com.devcamp.shop24h.repository.CustomerRepository;
import com.devcamp.shop24h.repository.UserRepository;
import com.devcamp.shop24h.service.CustomerExcelExporter;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@RestController
@CrossOrigin
public class CustomerController {
	
	@Autowired
	private CustomerRepository pCustomerRepository;

	@Autowired
	private UserRepository pUserRepository;

	@GetMapping("/customer/all")
	public ResponseEntity<Object> getAllCustomer() {
		try {
			return new ResponseEntity<>(pCustomerRepository.findAllCustomer(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * Lấy dữ liệu customer theo ID
	 * @param id
	 * @return
	 */
	@GetMapping("/customer/{id}")
	public ResponseEntity<Object> getCustomerById(@PathVariable int id) {
		try {
			return new ResponseEntity<>(pCustomerRepository.findById(id), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * Export dữ liệu Customers ra Excel
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("/export/customers/excel")
	public void exportCustomersToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());
		
		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=customers_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<Customer> customers = new ArrayList<Customer>();

		pCustomerRepository.findAll().forEach(customers::add);

		CustomerExcelExporter excelExporter = new CustomerExcelExporter(customers);

		excelExporter.export(response);
	}

	@PostMapping("/customer")
	public ResponseEntity<Object> createCustomer(@RequestBody @Valid Customer cCustomer) {
		Optional<Customer> customerData = Optional
				.ofNullable((pCustomerRepository.findByPhoneNumber(cCustomer.getPhoneNumber())));
		if (customerData.isPresent()) {
			// update dữ liệu nếu sđt đã có trong DB
			Customer updateObj = customerData.get();

			updateObj.setAddress(cCustomer.getAddress());
			updateObj.setCity(cCustomer.getCity());
			updateObj.setCountry(cCustomer.getCountry());
			updateObj.setCreditLimit(cCustomer.getCreditLimit());
			updateObj.setFirstName(cCustomer.getFirstName());
			updateObj.setLastName(cCustomer.getLastName());
			updateObj.setPhoneNumber(cCustomer.getPhoneNumber());
			updateObj.setPostalCode(cCustomer.getPostalCode());
			updateObj.setSalesRepEmployeeNumber(cCustomer.getSalesRepEmployeeNumber());
			updateObj.setState(cCustomer.getState());
			pCustomerRepository.save(updateObj);

			return new ResponseEntity<>(customerData.get().getId(), HttpStatus.OK);

		} else {
			// nếu không trùng thì thêm mới
			Customer vCustomer = new Customer();

			vCustomer.setAddress(cCustomer.getAddress());
			vCustomer.setCity(cCustomer.getCity());
			vCustomer.setCountry(cCustomer.getCountry());
			vCustomer.setCreditLimit(cCustomer.getCreditLimit());
			vCustomer.setFirstName(cCustomer.getFirstName());
			vCustomer.setLastName(cCustomer.getLastName());
			vCustomer.setPhoneNumber(cCustomer.getPhoneNumber());
			vCustomer.setPostalCode(cCustomer.getPostalCode());
			vCustomer.setSalesRepEmployeeNumber(cCustomer.getSalesRepEmployeeNumber());
			vCustomer.setState(cCustomer.getState());

			pCustomerRepository.save(vCustomer);
			try {
				return new ResponseEntity<>(pCustomerRepository.findAll(), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e.getCause().getCause().getMessage());
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
	}

	/**
	 * Tạo dữ liệu Customer coupling với User theo username
	 * API này dùng trong page Check Out của project
	 * @param cCustomer
	 * @param username
	 * @return
	 */
	@PostMapping("/customer/{username}")
	public ResponseEntity<Object> createCustomerByUsername(@RequestBody @Valid Customer cCustomer,
			@PathVariable String username) {
		Optional<Customer> customerData = Optional
				.ofNullable((pCustomerRepository.findByPhoneNumber(cCustomer.getPhoneNumber())));
		Optional<User> userData = Optional.ofNullable(pUserRepository.findByUsername(username));
		
		if (!customerData.isPresent() && userData.get().getCustomer() == null) {
			// nếu là lần đầu order, sđt đầu tiên sử dụng => thêm mới customer data
			Customer vCustomer = new Customer();

			vCustomer.setAddress(cCustomer.getAddress());
			vCustomer.setCity(cCustomer.getCity());
			vCustomer.setCountry(cCustomer.getCountry());
			vCustomer.setCreditLimit(cCustomer.getCreditLimit());
			vCustomer.setFirstName(cCustomer.getFirstName());
			vCustomer.setLastName(cCustomer.getLastName());
			vCustomer.setPhoneNumber(cCustomer.getPhoneNumber());
			vCustomer.setPostalCode(cCustomer.getPostalCode());
			vCustomer.setSalesRepEmployeeNumber(cCustomer.getSalesRepEmployeeNumber());
			vCustomer.setState(cCustomer.getState());
			vCustomer.setUser(userData.get());

			pCustomerRepository.save(vCustomer);
			try {
				return new ResponseEntity<>(pCustomerRepository.save(vCustomer), HttpStatus.CREATED);
			} catch (Exception e) {
				System.out.println(e.getCause().getCause().getMessage());
				return new ResponseEntity<>("1", HttpStatus.BAD_REQUEST);
			}
		}

		String phoneInDb = userData.get().getCustomer().getPhoneNumber();
		if (!phoneInDb.equals(cCustomer.getPhoneNumber())) {
			// nếu sđt input không trùng với sđt đã có trong DB => báo cho user
			return new ResponseEntity<>("Wrong phone number! Your used phone number is " + phoneInDb, HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			// nếu sđt input trùng với sđt đã có trong DB, update dữ liệu 
			Customer updateObj = customerData.get();

			updateObj.setAddress(cCustomer.getAddress());
			updateObj.setCity(cCustomer.getCity());
			updateObj.setCountry(cCustomer.getCountry());
			updateObj.setCreditLimit(cCustomer.getCreditLimit());
			updateObj.setFirstName(cCustomer.getFirstName());
			updateObj.setLastName(cCustomer.getLastName());
			updateObj.setPhoneNumber(cCustomer.getPhoneNumber());
			updateObj.setPostalCode(cCustomer.getPostalCode());
			updateObj.setSalesRepEmployeeNumber(cCustomer.getSalesRepEmployeeNumber());
			updateObj.setState(cCustomer.getState());
			updateObj.setUser(userData.get());
			pCustomerRepository.save(updateObj);
			try {
				return new ResponseEntity<>(customerData.get().getId(), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e.getCause().getCause().getMessage());
				return new ResponseEntity<>("2", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
	}

	@PutMapping("/customer/{id}")
	public ResponseEntity<Object> updateCustomer(@PathVariable Integer id, @RequestBody Customer cCustomer) {
		Optional<Customer> customerData = pCustomerRepository.findById(id);
		if (customerData.isPresent()) {
			try {
				Customer newUpdate = customerData.get();
				newUpdate.setAddress(cCustomer.getAddress());
				newUpdate.setCity(cCustomer.getCity());
				newUpdate.setCountry(cCustomer.getCountry());
				newUpdate.setCreditLimit(cCustomer.getCreditLimit());
				newUpdate.setFirstName(cCustomer.getFirstName());
				newUpdate.setLastName(cCustomer.getLastName());
				newUpdate.setPhoneNumber(cCustomer.getPhoneNumber());
				newUpdate.setPostalCode(cCustomer.getPostalCode());
				newUpdate.setSalesRepEmployeeNumber(cCustomer.getSalesRepEmployeeNumber());
				newUpdate.setState(cCustomer.getState());

				return new ResponseEntity<>(pCustomerRepository.save(newUpdate), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e.getCause().getCause().getMessage());
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			System.out.println("Customer not found by ID");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@DeleteMapping("/customer/delete/{id}")
	public ResponseEntity<Object> deleteCustomerById(@PathVariable Integer id) {
		if (pCustomerRepository.findById(id).isPresent()) {
			try {
				pCustomerRepository.deleteById(id);
				return new ResponseEntity<>(pCustomerRepository.findAll().size(), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e);
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			System.out.println("Id not found");
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}
	}
	
	/**
	 * method này dùng trong project, không dùng đc deleteById (default) 
	 * vì quan hệ customer vs user (1-1) ngầm là Eager nên vẫn persist không xóa được
	 * @param id
	 * @return
	 */
	@DeleteMapping("/customer/{id}")
	public ResponseEntity<Object> deleteCustomerOfUser(@PathVariable Integer id) {
		pCustomerRepository.delById(id);
		return new ResponseEntity<Object> ("deleted successfully", HttpStatus.OK);
	}
}

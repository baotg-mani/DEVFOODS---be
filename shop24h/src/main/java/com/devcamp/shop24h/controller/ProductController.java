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
import org.springframework.data.domain.PageRequest;
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

import com.devcamp.shop24h.model.OrderDetail;
import com.devcamp.shop24h.model.Product;
import com.devcamp.shop24h.model.ProductLine;
import com.devcamp.shop24h.repository.ProductLineRepository;
import com.devcamp.shop24h.repository.ProductRepository;
import com.devcamp.shop24h.service.OrderDetailExcelExporter;
import com.devcamp.shop24h.service.ProductExcelExporter;

@RestController
@CrossOrigin
public class ProductController {
	
	@Autowired
	private ProductRepository pProductRepository;

	@Autowired
	private ProductLineRepository pProductLineRepository;

	@GetMapping("/product/all")
	public ResponseEntity<Object> getAllProduct() {
		try {
			return new ResponseEntity<>(pProductRepository.findAllProduct(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	
	@GetMapping("/product/{id}")
	public ResponseEntity<Object> getProductById(@PathVariable int id) {
		try {
			return new ResponseEntity<>(pProductRepository.findById(id), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/product/productLineId/{productLineId}")
	public ResponseEntity<Object> getOrdersByCustomerId(@PathVariable int productLineId) {
		try {
			return new ResponseEntity<>(pProductRepository.findProductsByProductLineId(productLineId, null),
					HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// get all product size M for 1st page
	@GetMapping("/product/shop/page1")
	public ResponseEntity<Object> getProductsForPage1() {
		try {
			return new ResponseEntity<>(pProductRepository.findProduct4Page1(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// get all product size M for 2nd page
	@GetMapping("/product/shop/page2")
	public ResponseEntity<Object> getProductsForPage2() {
		try {
			return new ResponseEntity<>(pProductRepository.findProduct4Page2(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// get all product size M for 3rd page
	@GetMapping("/product/shop/page3")
	public ResponseEntity<Object> getProductsForPage3() {
		try {
			return new ResponseEntity<>(pProductRepository.findProduct4Page3(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// get Vegetables
	@GetMapping("/product/vegetables")
	public ResponseEntity<Object> getVegetables() {
		return new ResponseEntity<>(pProductRepository.findVegetables(), HttpStatus.OK);
	}

	// get Fruits
	@GetMapping("/product/fruits")
	public ResponseEntity<Object> getFruits() {
		return new ResponseEntity<>(pProductRepository.findFruits(), HttpStatus.OK);
	}

	// get Juice
	@GetMapping("/product/juice")
	public ResponseEntity<Object> getJuice() {
		return new ResponseEntity<>(pProductRepository.findJuice(), HttpStatus.OK);
	}

	// get Dried
	@GetMapping("/product/dried")
	public ResponseEntity<Object> getDried() {
		return new ResponseEntity<>(pProductRepository.findDried(), HttpStatus.OK);
	}
	
	// get Product by productName and size
	@GetMapping("/product/{productName}/{size}")
	public ResponseEntity<Object> getProductByNameAndSize(@PathVariable("productName") String productName, @PathVariable("size") String size) {
		return new ResponseEntity<>(pProductRepository.timProductByNameAndSize(productName, size), HttpStatus.OK);
	}
 
	/**
	 * Export Products data to Excel
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("/export/products/excel")
	public void exportOrderDetailsToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=products_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<Product> products = new ArrayList<Product>();

		pProductRepository.findAll().forEach(products::add);

		ProductExcelExporter excelExporter = new ProductExcelExporter(products);

		excelExporter.export(response);
	}
	
	
	@PostMapping("/product/{productLineId}")
	public ResponseEntity<Object> createProductByProductLineId(@Valid @RequestBody Product cProduct,
			@PathVariable Integer productLineId) {
		Optional<ProductLine> productLineData = pProductLineRepository.findById(productLineId);
		if (productLineData.isPresent()) {

			Product vProduct = new Product();
			vProduct.setBuyPrice(cProduct.getBuyPrice());
			vProduct.setOrderDetails(cProduct.getOrderDetails());
			vProduct.setProductCode(cProduct.getProductCode());
			vProduct.setProductName(cProduct.getProductName());
			vProduct.setProductDescription(cProduct.getProductDescription());
			vProduct.setProductSize(cProduct.getProductSize());
			vProduct.setImage(cProduct.getImage());
			vProduct.setProductVendor(cProduct.getProductVendor());
			vProduct.setQuantityInStock(cProduct.getQuantityInStock());
			vProduct.setProductLineObj(productLineData.get()); // memo!
			pProductRepository.save(vProduct);
			try {
				return new ResponseEntity<>(pProductRepository.findAll(), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e.getCause().getCause().getMessage());
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			System.out.println("Product Line not found by ID");
			return new ResponseEntity<>("Product line ID NOT_FOUND, enter again!", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PutMapping("/product/{id}")
	public ResponseEntity<Object> updateProduct(@Valid @PathVariable Integer id, @RequestBody Product cProduct) {
		Optional<Product> productData = pProductRepository.findById(id);
		if (productData.isPresent()) {
			Product newUpdate = productData.get();
			newUpdate.setBuyPrice(cProduct.getBuyPrice());
			newUpdate.setProductCode(cProduct.getProductCode());
			newUpdate.setProductName(cProduct.getProductName());
			newUpdate.setProductDescription(cProduct.getProductDescription());
			newUpdate.setImage(cProduct.getImage());
			newUpdate.setProductVendor(cProduct.getProductVendor());
			newUpdate.setQuantityInStock(cProduct.getQuantityInStock());

			try {
				return new ResponseEntity<>(pProductRepository.save(newUpdate), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e.getCause().getCause().getMessage());
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			System.out.println("Product not found by ID");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@DeleteMapping("/product/{id}")
	public ResponseEntity<Object> deleteProductById(@PathVariable Integer id) {
		if (pProductRepository.findById(id).isPresent()) {
			try {
				pProductRepository.deleteById(id);
				return new ResponseEntity<>(pProductRepository.findAll(), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e);
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			System.out.println("Id not found");
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}
	}
}

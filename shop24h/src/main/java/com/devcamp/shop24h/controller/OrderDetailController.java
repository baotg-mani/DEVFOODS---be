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

import com.devcamp.shop24h.model.Order;
import com.devcamp.shop24h.model.OrderDetail;
import com.devcamp.shop24h.model.Product;
import com.devcamp.shop24h.repository.OrderDetailRepository;
import com.devcamp.shop24h.repository.OrderRepository;
import com.devcamp.shop24h.repository.ProductRepository;
import com.devcamp.shop24h.service.OrderDetailExcelExporter;
import com.devcamp.shop24h.service.OrderExcelExporter;

@RestController
@CrossOrigin
public class OrderDetailController {

	@Autowired
	private ProductRepository pProductRepository;

	@Autowired
	private OrderRepository pOrderRepository;

	@Autowired
	private OrderDetailRepository pOrderDetailRepository;

	@GetMapping("/order-detail/all")
	public ResponseEntity<Object> getAllOrderDetail() {
		try {
			return new ResponseEntity<>(pOrderDetailRepository.findAllOrderDetail(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/order-detail/{id}")
	public ResponseEntity<Object> getOrderDetailById(@PathVariable int id) {
		try {
			return new ResponseEntity<>(pOrderDetailRepository.findById(id), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/order-detail/orderId/{orderId}")
	public ResponseEntity<Object> getOrderDetailsByOrderId(@PathVariable int orderId) {
		try {
			return new ResponseEntity<>(pOrderDetailRepository.findOrderDetailsByOrderId(orderId, null), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Get data cho b??o c??o t???ng ti???n theo ng??y trong tu???n g???n nh???t (bar chart)
	@GetMapping("/order-detail/days")
	public ResponseEntity<Object> getDataBarChartByDay() {
		try {
			return new ResponseEntity<>(pOrderDetailRepository.findDataBarChartByDay(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Get data cho b??o c??o t???ng ti???n theo 4 tu???n g???n nh???t (bar chart)
	@GetMapping("/order-detail/weeks")
	public ResponseEntity<Object> getDataBarChartByWeek() {
		try {
			return new ResponseEntity<>(pOrderDetailRepository.findDataBarChartByWeek(), HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	
	/**
	 * Export Order Details data to Excel
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("/export/orderDetails/excel")
	public void exportOrderDetailsToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=order-details_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();

		pOrderDetailRepository.findAll().forEach(orderDetails::add);

		OrderDetailExcelExporter excelExporter = new OrderDetailExcelExporter(orderDetails);

		excelExporter.export(response);
	}

	@PostMapping("/order-detail/{orderId}/{productId}")
	public ResponseEntity<Object> createOrderDetailByOrderIdAndProductId(@Valid @PathVariable Integer orderId,
			@PathVariable Integer productId, @RequestBody @Valid OrderDetail cOrderDetail) {
		Optional<Order> orderData = pOrderRepository.findById(orderId);
		Optional<Product> productData = pProductRepository.findById(productId);
		if (orderData.isPresent() && productData.isPresent()) {
			try {
				OrderDetail vOrderDetail = new OrderDetail();
				vOrderDetail.setPriceEach(cOrderDetail.getPriceEach());
				vOrderDetail.setQuantityOrder(cOrderDetail.getQuantityOrder());
				vOrderDetail.setOrder(orderData.get()); // memo! l???y theo order id
				vOrderDetail.setProduct(productData.get()); // memo! l???y theo product id

				pOrderDetailRepository.save(vOrderDetail);
				return new ResponseEntity<>(pOrderDetailRepository.findAll(), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e.getCause().getCause().getMessage());
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			System.out.println("Order or Product not found by id, check again");
			return new ResponseEntity<>("orderId or productId NOT_FOUND, enter again!", HttpStatus.NOT_FOUND);
		}
	}

	@PutMapping("/order-detail/{id}")
	public ResponseEntity<Object> updateOrderDetail(@Valid @PathVariable Integer id,
			@RequestBody OrderDetail cOrderDetail) {
		Optional<OrderDetail> orderDetailData = pOrderDetailRepository.findById(id);
		if (orderDetailData.isPresent()) {
			try {
				OrderDetail newUpdate = orderDetailData.get();
				newUpdate.setPriceEach(cOrderDetail.getPriceEach());
				newUpdate.setQuantityOrder(cOrderDetail.getQuantityOrder());

				return new ResponseEntity<>(pOrderDetailRepository.save(newUpdate), HttpStatus.OK);
			} catch (Exception e) {
				System.out.println(e.getCause().getCause().getMessage());
				return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			System.out.println("OrderDetail not found by ID");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@DeleteMapping("/order-detail/{id}")
	public ResponseEntity<Object> deleteOrderDetailById(@PathVariable Integer id) {
		if (pOrderDetailRepository.findById(id).isPresent()) {
			try {
				pOrderDetailRepository.deleteById(id);
				return new ResponseEntity<>(pOrderDetailRepository.findAll(), HttpStatus.OK);
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

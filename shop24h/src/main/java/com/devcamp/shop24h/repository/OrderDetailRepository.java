package com.devcamp.shop24h.repository;

import org.springframework.data.domain.Pageable;
import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.devcamp.shop24h.model.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{

	// JPA Query Native SQL
		@Query(value = "SELECT * FROM order_details  WHERE order_id LIKE :orderId OR product_id LIKE :productId", nativeQuery = true)
		List<OrderDetail> findOrderDetailByOrderIdOrProductId(@Param("orderId") Integer param1, @Param("productId") Integer param2);
		
		@Query(value = "SELECT * FROM order_details WHERE quantity_order LIKE :paramQuantity ORDER BY order_details.id DESC", nativeQuery = true)
		List<OrderDetail> findOrderDetailByQuantityOrder(@Param("paramQuantity") Integer paramQuantity, Pageable pageable);
		
		@Transactional
		@Modifying
		@Query(value = "UPDATE order_details SET price_each = 'paramPrice' WHERE price_each IS NULL;", nativeQuery = true)
		int updatePriceForNull(@Param("paramPrice") BigDecimal paramPrice);

		@Query(value = "SELECT * FROM order_details ORDER BY order_details.id DESC", nativeQuery = true)
		List<OrderDetail> findAllOrderDetail();
		
		@Query(value = "SELECT * FROM order_details WHERE order_details.order_id LIKE :paramOrderId ORDER BY order_details.id DESC", nativeQuery = true)
		List<OrderDetail> findOrderDetailsByOrderId(@Param("paramOrderId") Integer orderId, Pageable pageable);
		
		@Query(value = "SELECT DAYOFWEEK(o.order_date), o.order_date, od.product_id, SUM(od.price_each * od.quantity_order) AS price_all FROM order_details AS od\r\n"
				+ "JOIN orders AS o ON od.order_id = o.id GROUP BY o.order_date ORDER BY o.order_date DESC LIMIT 0, 7", nativeQuery = true)
		List<Object> findDataBarChartInWeek();
}

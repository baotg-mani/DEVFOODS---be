package com.devcamp.shop24h.repository;

import org.springframework.data.domain.Pageable;
import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.devcamp.shop24h.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

	// JPA Query Native SQL
	@Query(value = "SELECT * FROM orders  WHERE customer_id LIKE :cusParam", nativeQuery = true)
	List<Order> findOrderByCustomerId(@Param("cusParam") Integer cusParam);

	@Query(value = "SELECT * FROM orders  WHERE order_date LIKE :dateParam", nativeQuery = true)
	List<Order> findOrderByOrderDate(@Param("dateParam") Timestamp orderDateParam, Pageable pageable);

	@Query(value = "SELECT * FROM orders WHERE status LIKE :statusParam ORDER BY orders.id DESC", nativeQuery = true)
	List<Order> findOrderByStatus(@Param("statusParam") String statusParam, Pageable pageable);

	@Transactional
	@Modifying
	@Query(value = "UPDATE orders SET comments = 'cmtParam' WHERE comments IS NULL;", nativeQuery = true)
	int updateCommentsForNull(@Param("cmtParam") String cmtParam);

	@Query(value = "SELECT * FROM orders ORDER BY orders.id DESC", nativeQuery = true)
	List<Order> findAllOrder();

	@Query(value = "SELECT * FROM orders WHERE orders.customer_id LIKE :paramCustomerId ORDER BY orders.id DESC", nativeQuery = true)
	List<Order> findOrdersByCustomerId(@Param("paramCustomerId") Integer cusId, Pageable pageable);

	@Query(value = "SELECT o.id, pr.product_name, CONCAT(cu.first_name, ' ', cu.first_name) AS fullname_customer FROM orders AS o JOIN order_details AS od ON od.order_id = o.id JOIN customers AS cu ON cu.id = o.customer_id JOIN products AS pr ON pr.id = od.product_id ORDER BY o.id DESC", nativeQuery = true)
	List<Object> findOrdersByCustomerName();
	
	// method get data (Customer by Order & Payment) by query SQL
	@Query(value = "SELECT o.customer_id, o.id as order_id, CONCAT( cu.last_name ,' ', cu.first_name ) AS fullname, COUNT(o.customer_id), SUM( od.price_each * od.quantity_order ) AS price_all FROM orders AS o JOIN customers AS cu ON o.customer_id = cu.id JOIN order_details AS od ON od.order_id = o.id GROUP BY o.customer_id ORDER BY COUNT(o.customer_id) ASC", nativeQuery = true)
	List<Object> findCustomer();
	

}

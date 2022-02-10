package com.devcamp.shop24h.repository;

import org.springframework.data.domain.Pageable;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.devcamp.shop24h.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	// JPA Query Native SQL
	@Query(value = "SELECT * FROM products  WHERE city LIKE :paramProName ORDER BY product_name DESC", nativeQuery = true)
	List<Product> findProductByProName(@Param("paramProName") String paramProName, Pageable pageable);

	@Query(value = "SELECT * FROM products  WHERE product_code LIKE :paramProCode", nativeQuery = true)
	List<Product> findProductByProCode(@Param("paramProCode") String paramProCode, Pageable pageable);

	@Query(value = "SELECT * FROM products WHERE product_line_id LIKE :paramProLineId ORDER BY product_name DESC", nativeQuery = true)
	List<Product> findProductByProLineId(@Param("paramProLineId") Integer paramProLineId, Pageable pageable);

	@Transactional
	@Modifying
	@Query(value = "UPDATE products SET product_vendor = 'paramProductVender' WHERE product_vendor IS NULL;", nativeQuery = true)
	int updateVendorForNull(@Param("paramProductVender") String paramProductVender);

	@Query(value = "SELECT * FROM products ORDER BY id DESC", nativeQuery = true)
	List<Product> findAllProduct();

	@Query(value = "SELECT * FROM products AS p WHERE p.product_line_id LIKE :paramProductLineId ORDER BY p.id DESC", nativeQuery = true)
	List<Product> findProductsByProductLineId(@Param(value = "paramProductLineId") Integer productLineId,
			Pageable pageable);

	// get data product size M for 1st page
	@Query(value = "SELECT * FROM products WHERE product_size LIKE 'M' LIMIT 0,12;", nativeQuery = true)
	List<Product> findProduct4Page1();

	// get data product size M for 2nd page
	@Query(value = "SELECT * FROM products WHERE product_size LIKE 'M' LIMIT 12,12;", nativeQuery = true)
	List<Product> findProduct4Page2();

	// get data product size M for 3rd page
	@Query(value = "SELECT * FROM products WHERE product_size LIKE 'M' LIMIT 25,12;", nativeQuery = true)
	List<Product> findProduct4Page3();

	// get data product of line Vegetables
	@Query(value = "SELECT * FROM products WHERE product_line_id LIKE 1 AND product_size LIKE 'M' LIMIT 0,12;", nativeQuery = true)
	List<Product> findVegetables();

	// get data product of line Fruits
	@Query(value = "SELECT * FROM products WHERE product_line_id LIKE 2 AND product_size LIKE 'M' LIMIT 0,12;", nativeQuery = true)
	List<Product> findFruits();

	// get data product of line Juice
	@Query(value = "SELECT * FROM products WHERE product_line_id LIKE 3 AND product_size LIKE 'M' LIMIT 0,12;", nativeQuery = true)
	List<Product> findJuice();

	// get data product of line Dried
	@Query(value = "SELECT * FROM products WHERE product_line_id LIKE 4 AND product_size LIKE 'M' LIMIT 0,12;", nativeQuery = true)
	List<Product> findDried();

	// get data product by productName and size
	@Query(value = "SELECT * FROM products AS pro WHERE pro.product_name LIKE :productName AND pro.product_size LIKE :size", nativeQuery = true)
	Product timProductByNameAndSize(@Param(value = "productName") String productName,
			@Param(value = "size") String size);
}

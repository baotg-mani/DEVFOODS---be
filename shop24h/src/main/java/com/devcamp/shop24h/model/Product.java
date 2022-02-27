package com.devcamp.shop24h.model;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JsonIgnoreProperties(value = "product")
	private List<OrderDetail> orderDetails;
	
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JsonIgnoreProperties(value = "product")
	private List<ProductImage> productImages;
	
	@Column(name = "product_code", nullable = false)
	private String productCode;
	
	@Column(name = "product_name", nullable = false)
	private String productName;
	
	@Column(name = "product_description", nullable = false)
	private String productDescription;
	
//	Khi dùng @JsonIgnoreProperties thì bên n-1 không được dùng 'fetch = FetchType.LAZY', nếu dùng sẽ không hiện obj của FK bên n-1
	@ManyToOne( cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "product_line_id", nullable = false)
	@JsonIgnoreProperties(value = "products")
	private ProductLine productLineObj;
	
	@Column(name = "product_size", nullable = false)
	private String productSize;
	
	@Column(name = "product_vendor")
	private String productVendor;
	
	@Column(name = "quantity_in_stock", nullable = false)
	private int quantityInStock;
	
	@Column(name = "buy_price", nullable = false)
	private BigDecimal buyPrice;
	
	@Column(name = "image", nullable = false)
	private String image;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the orderDetails
	 */
	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	/**
	 * @param orderDetails the orderDetails to set
	 */
	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	/**
	 * @return the productImages
	 */
	public List<ProductImage> getProductImages() {
		return productImages;
	}

	/**
	 * @param productImages the productImages to set
	 */
	public void setProductImages(List<ProductImage> productImages) {
		this.productImages = productImages;
	}

	/**
	 * @return the productCode
	 */
	public String getProductCode() {
		return productCode;
	}

	/**
	 * @param productCode the productCode to set
	 */
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the productDescription
	 */
	public String getProductDescription() {
		return productDescription;
	}

	/**
	 * @param productDescription the productDescription to set
	 */
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	/**
	 * @return the productLineObj
	 */
	public ProductLine getProductLineObj() {
		return productLineObj;
	}

	/**
	 * @param productLineObj the productLineObj to set
	 */
	public void setProductLineObj(ProductLine productLineObj) {
		this.productLineObj = productLineObj;
	}

	/**
	 * @return the productSize
	 */
	public String getProductSize() {
		return productSize;
	}

	/**
	 * @param productSize the productSize to set
	 */
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	/**
	 * @return the productVendor
	 */
	public String getProductVendor() {
		return productVendor;
	}

	/**
	 * @param productVendor the productVendor to set
	 */
	public void setProductVendor(String productVendor) {
		this.productVendor = productVendor;
	}

	/**
	 * @return the quantityInStock
	 */
	public int getQuantityInStock() {
		return quantityInStock;
	}

	/**
	 * @param quantityInStock the quantityInStock to set
	 */
	public void setQuantityInStock(int quantityInStock) {
		this.quantityInStock = quantityInStock;
	}

	/**
	 * @return the buyPrice
	 */
	public BigDecimal getBuyPrice() {
		return buyPrice;
	}

	/**
	 * @param buyPrice the buyPrice to set
	 */
	public void setBuyPrice(BigDecimal buyPrice) {
		this.buyPrice = buyPrice;
	}

	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}
}

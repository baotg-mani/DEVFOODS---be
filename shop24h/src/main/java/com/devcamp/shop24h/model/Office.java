package com.devcamp.shop24h.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "offices")
public class Office {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "city", nullable = false)
	private String city;
	
	@Column(name = "phone", nullable = false)
	private String phone;
	
	@Column(name = "address_line", nullable = false)
	private String addressLine;
	
	private String state;
	
	@Column(name = "country", nullable = false)
	private String country;
	
	@Column(name = "territory", nullable = false)
	private String territory;

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
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the addressLine
	 */
	public String getAddressLine() {
		return addressLine;
	}

	/**
	 * @param addressLine the addressLine to set
	 */
	public void setAddressLine(String addressLine) {
		this.addressLine = addressLine;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**
	 * @return the territory
	 */
	public String getTerritory() {
		return territory;
	}

	/**
	 * @param territory the territory to set
	 */
	public void setTerritory(String territory) {
		this.territory = territory;
	}

	
}

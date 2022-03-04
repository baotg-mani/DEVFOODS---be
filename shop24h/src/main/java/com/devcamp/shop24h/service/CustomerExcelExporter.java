package com.devcamp.shop24h.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.devcamp.shop24h.model.Customer;

/**
 * Contructor khởi tạo server export dành cho Customer
 * @param customers
 */
public class CustomerExcelExporter {
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private List<Customer> customers;
	
	/**
	 * Contructor khởi tạo server export dành cho Customer
	 * @param customers
	 */
	public CustomerExcelExporter(List<Customer> customers) {
		this.customers = customers;
		workbook = new XSSFWorkbook();
	}
	
	/**
	 * Method tạo các ô cho excel file
	 * @param row
	 * @param columnCount
	 * @param value
	 * @param style
	 */
	public void createCell(Row row, int columnCount, Object value, CellStyle style) {
		sheet.autoSizeColumn(columnCount);
		Cell cell = row.createCell(columnCount);
		if (value instanceof Integer) {
			cell.setCellValue((Integer) value);
		} else if (value instanceof Boolean) {
			cell.setCellValue((Boolean) value);
		} else if (value instanceof Long) {
			cell.setCellValue((Long) value);
		} else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(style);
	}
	
	// Khai báo cho sheet và dòng Header đầu tiên
	private void writeHeaderLine() {
		this.sheet = workbook.createSheet("Customers");
		
		Row row = this.sheet.createRow(0);
		
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(16);
		style.setFont(font);
		
		createCell(row, 0, "Customer ID", style);
		createCell(row, 1, "address", style);
		createCell(row, 2, "city", style);
		createCell(row, 3, "country", style);
		createCell(row, 4, "creditLimit", style);
		createCell(row, 5, "firstName", style);
		createCell(row, 6, "lastName", style);
		createCell(row, 7, "phoneNumber", style);
		createCell(row, 8, "postalCode", style);
		createCell(row, 9, "user_id", style);
		createCell(row, 10, "salesRepEmployeeNumber", style);
		createCell(row, 11, "state", style);
	}
	
	// fill dữ liệu cho dòng tiếp theo
	private void writeDataLines() {
		int rowCount = 1;
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		style.setFont(font);
		
		for (Customer cus: this.customers) {
			Row row = sheet.createRow(rowCount++);
			int columnCount = 0;
			
			createCell(row, columnCount++, cus.getId(), style);
			createCell(row, columnCount++, cus.getAddress(), style);
			createCell(row, columnCount++, cus.getCity(), style);
			createCell(row, columnCount++, cus.getCountry(), style);
			createCell(row, columnCount++, cus.getCreditLimit(), style);
			createCell(row, columnCount++, cus.getFirstName(), style);
			createCell(row, columnCount++, cus.getLastName(), style);
			createCell(row, columnCount++, cus.getPhoneNumber(), style);
			createCell(row, columnCount++, cus.getPostalCode(), style);
			createCell(row, columnCount++, cus.getUser().getId(), style);
			createCell(row, columnCount++, cus.getSalesRepEmployeeNumber(), style);
			createCell(row, columnCount++, cus.getState(), style);
		}
	}
	
	/**
	 * xuất dữ liệu ra dạng file
	 * @param response
	 * @throws IOException
	 */
	public void export(HttpServletResponse response) throws IOException {
		writeHeaderLine();
		writeDataLines();
		
		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();
		
		outputStream.close();
	}
	
}


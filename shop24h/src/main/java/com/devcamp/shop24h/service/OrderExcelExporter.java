package com.devcamp.shop24h.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.devcamp.shop24h.model.Order;

public class OrderExcelExporter {
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private List<Order> orders;
	
	/**
	 * Contructor khởi tạo server export dành cho Order
	 * @param customers
	 */
	public OrderExcelExporter(List<Order> orders) {
		this.orders = orders;
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
		} else if (value instanceof Timestamp) {
			cell.setCellValue((Timestamp) value);
		} else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(style);
	}
	
	// Khai báo cho sheet và dòng Header đầu tiên
	private void writeHeaderLine() {
		this.sheet = workbook.createSheet("Orders");
		
		Row row = this.sheet.createRow(0);
		
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(16);
		style.setFont(font);
		
		createCell(row, 0, "Order ID", style);
		createCell(row, 1, "comments", style);
		createCell(row, 2, "orderDate", style);
		createCell(row, 3, "requiredDate", style);
		createCell(row, 4, "shippedDate", style);
		createCell(row, 5, "status", style);
		createCell(row, 6, "customer's fullname", style);
	}
	
	// fill dữ liệu cho dòng tiếp theo
	private void writeDataLines() {
		int rowCount = 1;
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		style.setFont(font);
		
		for (Order cus: this.orders) {
			Row row = sheet.createRow(rowCount++);
			int columnCount = 0;
			
			createCell(row, columnCount++, cus.getId(), style);
			createCell(row, columnCount++, cus.getComments(), style);
			createCell(row, columnCount++, cus.getOrderDate(), style);
			createCell(row, columnCount++, cus.getRequiredDate(), style);
			createCell(row, columnCount++, cus.getShippedDate(), style);
			createCell(row, columnCount++, cus.getStatus(), style);
			createCell(row, columnCount++, cus.getCustomer().getFirstName() + " " + cus.getCustomer().getLastName(), style);
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

package com.devcamp.shop24h.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.devcamp.shop24h.model.OrderDetail;

public class OrderDetailExcelExporter {
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private List<OrderDetail> orderDetails;
	
	/**
	 * Contructor khởi tạo server export dành cho Customer
	 * @param customers
	 */
	public OrderDetailExcelExporter(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
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
		} else if (value instanceof BigDecimal) {
			cell.setCellValue(value.toString());
		} else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(style);
	}
	
	// Khai báo cho sheet và dòng Header đầu tiên
	private void writeHeaderLine() {
		this.sheet = workbook.createSheet("Order Details");
		
		Row row = this.sheet.createRow(0);
		
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(16);
		style.setFont(font);
		
		createCell(row, 0, "orderDetail ID", style);
		createCell(row, 1, "quantityOrder", style);
		createCell(row, 2, "priceEach", style);
		createCell(row, 3, "order-id", style);
		createCell(row, 4, "product name", style);
	}
	
	// fill dữ liệu cho dòng tiếp theo
	private void writeDataLines() {
		int rowCount = 1;
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		style.setFont(font);
		
		for (OrderDetail cus: this.orderDetails) {
			Row row = sheet.createRow(rowCount++);
			int columnCount = 0;
			
			createCell(row, columnCount++, cus.getId(), style);
			createCell(row, columnCount++, cus.getQuantityOrder(), style);
			createCell(row, columnCount++, cus.getPriceEach(), style);
			createCell(row, columnCount++, cus.getOrder().getId(), style);
			createCell(row, columnCount++, cus.getProduct().getProductName(), style);
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

package com.devcamp.shop24h.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.devcamp.shop24h.model.Product;

public class ProductExcelExporter {
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private List<Product> products;

	/**
	 * Contructor khởi tạo server export dành cho Customer
	 * 
	 * @param customers
	 */
	public ProductExcelExporter(List<Product> products) {
		this.products = products;
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
		} else if(value instanceof Timestamp) { 
			cell.setCellValue((Timestamp) value);
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

		createCell(row, 0, "Product ID", style);
		createCell(row, 1, "productCode", style);
		createCell(row, 2, "productName", style);
		createCell(row, 3, "productDescription", style);
		createCell(row, 4, "product_line_id", style);
		createCell(row, 5, "productSize", style);
		createCell(row, 6, "image", style);
		createCell(row, 7, "productVendor", style);
		createCell(row, 8, "quantityStock", style);
		createCell(row, 9, "buyPrice", style);
	}

	// fill dữ liệu cho dòng tiếp theo
	private void writeDataLines() {
		int rowCount = 1;
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		style.setFont(font);

		for (Product cus : this.products) {
			Row row = sheet.createRow(rowCount++);
			int columnCount = 0;

			createCell(row, columnCount++, cus.getId(), style);
			createCell(row, columnCount++, cus.getProductCode(), style);
			createCell(row, columnCount++, cus.getProductName(), style);
			createCell(row, columnCount++, cus.getProductDescription(), style);
			createCell(row, columnCount++, cus.getProductLineObj().getId(), style);
			createCell(row, columnCount++, cus.getProductSize(), style);
			createCell(row, columnCount++, cus.getImage(), style);
			createCell(row, columnCount++, cus.getProductVendor(), style);
			createCell(row, columnCount++, cus.getQuantityInStock(), style);
			createCell(row, columnCount++, cus.getBuyPrice(), style);
		}
	}

	/**
	 * xuất dữ liệu ra dạng file
	 * 
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

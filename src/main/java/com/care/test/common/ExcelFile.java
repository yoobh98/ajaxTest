package com.care.test.common;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.util.StringUtils;


public class ExcelFile {
	
	private SXSSFWorkbook workBook;
	private Sheet sheet;
	private Row row;
	private Cell cell;
	private Class<?> type;
	private List<?> list;
	
	//엑셀 파일 생성, 헤더/바디 값 입력
	public ExcelFile(Class<?> type,List<?> list) throws Exception {
		System.out.println("엑셀 파일 생성 시작");
		workBook = new SXSSFWorkbook();
		//System.out.println("workBook 생성");
		sheet = workBook.createSheet();
		//System.out.println("sheet 생성");
		this.type = type;
		this.list = list;
		setExcelHeader();
		//System.out.println("헤더 지정완료");
		setExcelBody();
		//System.out.println("바디 지정완료");
	}
	
	public ExcelFile(String[] header) {
		workBook = new SXSSFWorkbook();
		sheet = workBook.createSheet();
		setExcelSampleHeader(header);
	}
	

	//샘플 헤더 값 입력
	private void setExcelSampleHeader(String[] header) {
		row = sheet.createRow(0);
		Font fontHeader = workBook.createFont();
		CellStyle headerCellStyle = workBook.createCellStyle();
		headerCellStyle.setFont(fontHeader);
		//아래는 css 적용 해주는 느낌인거 같고
		headerCellStyle.setAlignment(HorizontalAlignment.CENTER);
		headerCellStyle.setFillForegroundColor(IndexedColors.CORNFLOWER_BLUE.getIndex());
		headerCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		for(int i = 0 ; i < header.length; i++) {
			((SXSSFSheet) sheet).trackAllColumnsForAutoSizing();
			sheet.autoSizeColumn(i);
			sheet.setColumnWidth(i, sheet.getColumnWidth(i)+2048);
			cell = row.createCell(i);
			cell.setCellStyle(headerCellStyle);
			cell.setCellValue(header[i]);
		}
	}
	//Could not auto-size column. 에러 발생 -> 오토사이즈 지정하는 부분 없애서 해결
	private void setExcelHeader() {
		System.out.println("헤더 지정시작..");
		row = sheet.createRow(0);
		//System.out.println("로우 가져오고..");
		Field[] fields = type.getDeclaredFields();
		//System.out.println("필드 가져오고..");
		Font fontHeader = workBook.createFont();
		//System.out.println("폰트 가져오고..");
		CellStyle headerCellStyle = workBook.createCellStyle();
		headerCellStyle.setFont(fontHeader);
		headerCellStyle.setAlignment(HorizontalAlignment.CENTER);
		headerCellStyle.setFillForegroundColor(IndexedColors.CORNFLOWER_BLUE.getIndex());
		headerCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		for(int i = 0 ; i < fields.length ;i++) {
			System.out.println("for 문 시작");
			ExcelColumn excelColumn = fields[i].getAnnotation(ExcelColumn.class);
			System.out.println("ExcelColumn 생성..");
			// @ExcelColumn 어노테이션 붙어있는 값만 가져와서 입력
			if(excelColumn != null) {
				//System.out.println("if문 실행 성공");
				int num = excelColumn.headerNum();
				//sheet.autoSizeColumn(num);
				//System.out.println("오토사이즈 지정..");
				sheet.setColumnWidth(num, (sheet.getColumnWidth(num))+2048);
				//System.out.println("넓이 지정..");
				cell = row.createCell(num);
				//System.out.println("셀 지정..");
				cell.setCellStyle(headerCellStyle);
				//System.out.println("셀 스타일 지정..");
				cell.setCellValue(excelColumn.headerName());
				//System.out.println("셀 값 지정..");
				//System.out.println("if문 종료");
			}
		}
	}		
	
	//바디 값 입력
	private void setExcelBody() throws Exception {
		System.out.println("바디 지정시작..");
		for (int i = 0; i < list.size(); i++) {
			//sheet에서 로우 하나더 만들어주고
			row = sheet.createRow(i + 1);
			int rowNum = 0;
			
			Field[] fields = type.getDeclaredFields();
			for (int j = 0; j < fields.length; j++) {
				//cell 추가해주기
				cell = row.createCell(rowNum);
				ExcelColumn excelColumn = fields[j].getAnnotation(ExcelColumn.class);
				// @ExcelColumn 어노테이션 붙어있는 값만 가져와서 입력
				if (excelColumn != null) {
					String methodName = fields[j].getName();
					methodName = StringUtils.capitalize(methodName);
					Method method = type.getMethod("get" + methodName);
					Object object = method.invoke(list.get(i));
					if (object != null) {
						cell.setCellValue(object.toString());
					}
					rowNum++;
				}
			}
		}
	}
	
	public void write(OutputStream out) throws IOException {
		System.out.println("write!");
		workBook.write(out);
		//System.out.println("작성 끝!");
		workBook.close();
	}
}

package com.care.test.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import com.care.test.common.ExcelFile;
import com.care.test.dto.ExcelVO;
import com.care.test.service.ExcelService;

@Controller
public class ExcelController {
	
	@Autowired//(required=false)
	ExcelService excelService;
	
	//기본 페이지
	@GetMapping("goExcel")
	public String goExcel() {
		return "excel/excelTest";
	}
	
	//전체 리스트 다운
	@GetMapping("getAllUserList")
	public void getAllUserList(HttpServletResponse res) {
		List<ExcelVO> list = excelService.getAllUserList();
		ExcelFile excelFile;
		try {
			excelFile = new ExcelFile(ExcelVO.class, list);
			res.setContentType("application/vnd.ms-excel");
			res.setHeader("Content-Disposition", "attachment;filename=allUserList.xls");
			excelFile.write(res.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//이름 입력받아서 다운
	@GetMapping("getSearchUserList")
	public void getSearchUserList(HttpServletResponse res,String userName) throws Exception{
		System.out.println("==================== getSearchUserList START========================");
		List<ExcelVO> list = excelService.getSearchUserList(userName);
		System.out.println("리스트 가져오고");
		ExcelFile excelFile= new ExcelFile(ExcelVO.class, list);
		System.out.println("파일 만들고");
		res.setContentType("application/vnd.ms-excel");
		System.out.println("컨텐트 타입 지정");
		res.setHeader("Content-Disposition", "attachment;filename=userList.xls");
		System.out.println("헤더 지정");
		excelFile.write(res.getOutputStream());
		System.out.println("==================== getSearchUserList END ========================");
	}
	
	
	//샘플 양식 다운
	@GetMapping("sampleDownload")
	public void SampleDownload(HttpServletResponse res) throws Exception {
		// 헤더 설정
		final String[] header = {
				"닉네임","직업","레벨","이메일","주스텟"
		};
		ExcelFile excelFile= new ExcelFile(header);
		
		res.setContentType("application/vnd.ms-excel");
		res.setHeader("Content-Disposition", "attachment;filename=Sample.xlsx");
		excelFile.write(res.getOutputStream());
	}
	
	@PostMapping("excelUpload")
	public String ExcelUpload(@RequestBody MultipartFile file) throws IOException {
		DataFormatter formatter = new DataFormatter();
		Workbook workBook = new XSSFWorkbook(file.getInputStream());
		ExcelVO excel = new ExcelVO();
		System.out.println("들어온녀석 : "+file.getOriginalFilename());
		
		Sheet sheet = workBook.getSheetAt(0);
			for(int i = 1 ; i < sheet.getPhysicalNumberOfRows(); i++) {
				Row row = sheet.getRow(i);
				System.out.println("머선일이 : "+sheet.getRow(i));
				//여기서 엑셀 생성해줌?
				if(formatter.formatCellValue(row.getCell(0)).equals("")
					|| formatter.formatCellValue(row.getCell(1)).equals("")) {
					//비어있으면 멈추나봄
					break;
				}else {
					excel.setUserNick(formatter.formatCellValue(row.getCell(0)));// n 번째 셀
					System.out.println(excel.getUserNick());
					excel.setUserJob(formatter.formatCellValue(row.getCell(1)));
					System.out.println(excel.getUserJob());
					excel.setUserLv(Integer.parseInt(formatter.formatCellValue(row.getCell(2))));
					String cellValue = formatter.formatCellValue(row.getCell(3));
					excel.setUserStat(Integer.parseInt(formatter.formatCellValue(row.getCell(4))));
					
					System.out.println(cellValue);//이메일임
					//셀이 비어있을경우 null
					if(formatter.formatCellValue(row.getCell(3)).equals("")) {
						cellValue=null;
					}
					excel.setUserEmail(cellValue);
					excelService.insertExcel(excel);
					System.out.println("else 문 끝");
				}	
			}
		workBook.close();
		return "excel/excelTest";
	}
	
}

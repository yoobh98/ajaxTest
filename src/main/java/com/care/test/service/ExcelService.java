package com.care.test.service;

import java.util.List;

import com.care.test.dto.ExcelVO;

public interface ExcelService {
	
	//업로드
	public int insertExcel(ExcelVO excel);
	
	//검색시 해당 유저
	public List<ExcelVO> getSearchUserList(String userName);
	
	//모든 유저
	public List<ExcelVO> getAllUserList();

}

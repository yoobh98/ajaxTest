package com.care.test.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.care.test.dto.ExcelVO;

@Repository
public interface ExcelMapper {

	public int insertExcel(ExcelVO excel);
	public List<ExcelVO> getSearchUserList(String userName);
	public List<ExcelVO> getAllUserList();
}

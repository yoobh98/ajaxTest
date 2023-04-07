package com.care.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.test.dto.ExcelVO;
import com.care.test.mapper.ExcelMapper;

@Service
public class ExcelServiceImpl implements ExcelService{
	
	@Autowired ExcelMapper dao;
	
	@Override
	public int insertExcel(ExcelVO excel) {
		return dao.insertExcel(excel);
	}

	@Override
	public List<ExcelVO> getSearchUserList(String userName) {
		System.out.println("서비스는 문제 없겠고");
		return dao.getSearchUserList(userName);
	}

	@Override
	public List<ExcelVO> getAllUserList() {
		return dao.getAllUserList();
	}

}

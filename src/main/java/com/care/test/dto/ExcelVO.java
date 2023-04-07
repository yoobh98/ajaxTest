package com.care.test.dto;

import com.care.test.common.ExcelColumn;

import lombok.Data;

// @ToString @Setter @Getter => @Data
@Data
public class ExcelVO {
	@ExcelColumn(headerName="닉네임", headerNum = 0)
	private String userNick;
	@ExcelColumn(headerName="레벨", headerNum = 1)
	private int userLv;
	@ExcelColumn(headerName="직업", headerNum = 2)
	private String userJob;
	@ExcelColumn(headerName="주스텟", headerNum = 3)
	private int userStat;
	@ExcelColumn(headerName="이메일", headerNum = 4)
	private String userEmail;
}

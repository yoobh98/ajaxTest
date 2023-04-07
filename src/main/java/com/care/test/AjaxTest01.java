package com.care.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxTest01 {
	
	@GetMapping("goHome")
	public String goHome() {
		return "testFolder/test";
	}
	
	@GetMapping("goCallBackTest")
	public String goCallBackTest() {
		return "testFolder/callBackTest";
	}
	
	@ResponseBody
	@PostMapping("goCallBack")
	public String goCallBack() {
		return "testFolder/callBackTest";
	}
	
	

}

package com.care.ajax;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping("non_ajax")
	public String non_ajax() {
		return "ajax/non_ajax";
	}
	
	@GetMapping("ajax01")
	public String ajax01() {
		System.out.println("좋아요+1");
		return "ajax/ajax";
	}
	
	@GetMapping("ajax02")
	public String ajax02() {
		System.out.println("좋아요+2");
		return "ajax/ajax02";
	}
	
	static int cnt = 0;
	@GetMapping("ajax_result02")
	@ResponseBody // 돌려주는 값이 jsp 페이지가 아니라 데이터를 넘기려면 이 어노테이션이 필수.
	public String ajax_result02() {
		return ++cnt+"";
	}
	
	@GetMapping("ajax03")
	public String ajax03() {
		return "ajax/ajax03";
	}
	
	@PostMapping(value="ajax_result03",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public InfoDTO ajax_result03(@RequestBody InfoDTO dto) {
		System.out.println("이름 : "+dto.getName());
		System.out.println("나이 : "+dto.getAge());
		return dto;
	}
	
	@GetMapping("ajax04")
	public String ajax04() {
		return "ajax/ajax04";
	}
	
	@PostMapping(value="ajax_result04",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map ajax_result04(@RequestBody Map dto) {//받아줄때  dto에 형식이 없다면 Map으로 가능
		System.out.println("이름 : "+dto.get("name"));//key 값으로 value 꺼내오기 쌉가능
		System.out.println("나이 : "+dto.get("age"));
		System.out.println("주소 : "+dto.get("addr"));
		return dto;
	}
	
	@GetMapping("rest01")
	public String rest01(){
		return "ajax/rest01";
	}
	
	@GetMapping("getuser")
	public String getuser() {
		return "ajax/getuser";
	}
	
	
	
	
}

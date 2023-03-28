package com.care.ajax;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

//#스케줄링
//-- 매일 오전 몇시에 어떤 값을 얻어올것이다 이럴때 사용

@Configuration
@EnableScheduling
public class MyScheduler {
	//@Scheduled(cron = "0-59 * * * * *")//시간 설정 , 스프링 스케줄러 cron 검색해서 알아보고 사용
	public void test() {
		System.out.println("매초 실행 됩니다.");
	}
}

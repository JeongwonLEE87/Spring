package com.java.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 경로 com.java.spring.controller.JqueryController 
// 스프링에서 사용하는 어노테이션 @Controller 입니다.
@Controller // 특정 class에 주입을 하면 스프링이 알 수가 있습니다.
public class JqueryController {

	// 스프링에서 사용하는 어노테이션 @RequestMpping 입니다.
	@RequestMapping("/jquery") // 특정 메소드에 주입을 하면 URL 정보를 매칭합니다.
	public String jquery(){
		return "jquery/index"; // view를 정의 하는 부분 jquery/index.jsp 를 나타낸다.
	}
	// 5 -> 1 -> 2 -> 4 -> 6 -> 3
	/* URL : http://localhost:8080/spring/jquery
	 * 1 -> 2 -> 5 -> 4 -> 6 -> 3
	 * */
}

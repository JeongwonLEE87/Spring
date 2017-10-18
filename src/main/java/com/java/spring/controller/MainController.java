package com.java.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.util.HttpUtil;

@Controller
public class MainController {
	
	@RequestMapping("/Main")
	public ModelAndView main(ModelAndView mav){
		mav.setViewName("main/main");
		return mav;
	}
	
	@RequestMapping("/Login")
	public void login(HttpServletRequest req, HttpServletResponse resp){
		HashMap<String, Object> param = HttpUtil.getParameterMap(req);
		System.out.println(param);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(!("").equals(param.get("email"))){
			map.put("email", param.get("email"));
			map.put("stat", true);
		}else {
			map.put("stat", false);
		}
		HttpUtil.sendResponceToJson(resp, map);
	}
}

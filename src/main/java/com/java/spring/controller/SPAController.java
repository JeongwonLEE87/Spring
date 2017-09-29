package com.java.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SPAController {
	@RequestMapping("/SPA")
	public ModelAndView spa(ModelAndView mav){
		mav.setViewName("spa/main");
		return mav;
	}
}

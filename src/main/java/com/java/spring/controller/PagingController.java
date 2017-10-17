package com.java.spring.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.spring.service.PagingServiceInterface;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class PagingController {
	
	@Autowired
	PagingServiceInterface psi;
	
	@RequestMapping("/listView")
	public ModelAndView listView(ModelAndView mav){
		mav.setViewName("paging/list");
		return mav;
	}
	
	@RequestMapping("/listData")
	public ModelAndView listData(ModelAndView mav){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", 0);
		param.put("viewRow", 10);
		
		// 디비에서 받아 온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(psi.select(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
}

package com.bi.billage.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GroupController {

	@RequestMapping("list.gr")
	public ModelAndView selectGroup(@RequestParamModelAndView mv) {
		return mv;
	}
	
	
	
}

package com.bi.billage.follow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FollowController {
	
	@RequestMapping("select.fo")
	public String selectFollowList() {
		
		return "follow/followListView";
	}
	

}

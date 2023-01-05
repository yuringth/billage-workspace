package com.bi.billage.user.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class UserController {
	
	@RequestMapping("admin.ad")
	public String adminPage() {
		return "admin/adminPage";
	}
}
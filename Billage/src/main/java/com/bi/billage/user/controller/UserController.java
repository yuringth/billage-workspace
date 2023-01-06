package com.bi.billage.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	// 包府磊 包访
	
	@RequestMapping("admin.ad")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping("enroll.iq")
	public String enrollInquiry() {
		return "admin/inqEnrollForm";
	}
	
	// 包府磊 包访 场
	
	@RequestMapping("userEnrollForm.me")
	public String userEnrollForm() {
		return "user/userEnrollForm";
	}
}
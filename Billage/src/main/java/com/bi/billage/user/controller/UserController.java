package com.bi.billage.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	// 관리자 관련
	
	// 관리자 페이지
	@RequestMapping("admin.ad")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	// 1:1문의 신청폼
	@RequestMapping("enroll.iq")
	public String enrollInquiry() {
		return "admin/inqEnrollForm";
	}
	
	// 연재 요청폼
	@RequestMapping("request.se")
	public String requestSerial() {
		return "admin/serialRequestForm";
	}
	
	@RequestMapping("enrollForm.nv")
	public String enrollNovel() {
		return "admin/novelEnrollForm";
	}
	
	// 관리자 관련 끝
	
	@RequestMapping("userEnrollForm.me")
	public String userEnrollForm() {
		return "user/userEnrollForm";
	}
	
	@RequestMapping("mypage.me")
	public String myPage() {
		return "user/myPage";
	}
	
}
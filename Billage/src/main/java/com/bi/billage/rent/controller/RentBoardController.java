package com.bi.billage.rent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bi.billage.rent.model.service.RentBoardService;

@Controller
public class RentBoardController {
	
	@Autowired
	private RentBoardService rentBoardService;
	
	// 대여게시판으로 이동
	@RequestMapping("list.rt")
	public String rentBoardView() {
		return "board/rentBoard/rentBoardView";
	}
	
	// 대여게시판 글 작성으로 이동
	@RequestMapping("enrollForm.rt")
	public String insertRent() {
		return "board/rentBoard/rentEnrollForm";
	}
	
	// 대여
	
}

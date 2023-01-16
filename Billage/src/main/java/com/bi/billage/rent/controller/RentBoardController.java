package com.bi.billage.rent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentBoardController {
	
	@RequestMapping("list.rt")
	public String rentBoardView() {
		return "board/rentBoard/rentBoardView";
	}
	
	@RequestMapping("insert.rt")
	public String insertRent() {
		return "board/rentBoard/rentEnrollForm";
	}
}

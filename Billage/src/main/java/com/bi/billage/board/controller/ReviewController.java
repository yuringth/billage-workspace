package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	@RequestMapping("list.re")
	public String reviewBoardList() {
		return "board/reviewBoard/reviewBoardList";
	}
	
	
}

package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentBoardController {
	
	@RequestMapping("list.rt")
	public String rentBoardView() {
		return "board/rentBoard/rentBoardView";
	}
}

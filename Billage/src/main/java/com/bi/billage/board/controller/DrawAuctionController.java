package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DrawAuctionController {
	
	@RequestMapping("main.ma")
	public String maingogo() {
		return "redirect:/";
	}

	@RequestMapping("list.dr")
	public String drawBoardList() {
		return "board/drawBoard/drawBoardListView";
	}
	
	@RequestMapping("list.ac")
	public String auctionBoardList() {
		return "board/auctionBoard/auctionBoardListView";
	}
	
	@RequestMapping("insert.dr")
	public String drawEnrollForm() {
		return "board/drawBoard/drawBoardEnrollForm";
	}
	
	@RequestMapping("insert.ac")
	public String auctionEnrollForm() {
		return "board/auctionBoard/auctionBoardEnrollForm";
	}
}

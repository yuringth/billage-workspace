package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DrawAuctionController {
	
	@RequestMapping("list.dr")
	public String drawBoardList() {
		return "board/drawBoard/drawBoardListView";
	}
	
	@RequestMapping("list.ac")
	public String auctionBoardList() {
		return "board/auctionBoard/auctionBoardListView";
	}
	
	@RequestMapping("enrollForm.dr")
	public String drawEnrollForm() {
		return "board/drawBoard/drawBoardEnrollForm";
	}
	
	@RequestMapping("enrollForm.ac")
	public String auctionEnrollForm() {
		return "board/auctionBoard/auctionBoardEnrollForm";
	}
	
	@RequestMapping("detail.dr")
	public String drawDetailView() {
		return "board/drawBoard/drawDetailView";
	}

	@RequestMapping("detail.dr")
	public String auctionDetailView() {
		return "board/auctionBoard/auctionDetailView";
	}
}

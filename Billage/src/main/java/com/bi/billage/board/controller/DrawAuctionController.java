package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DrawAuctionController {

	@RequestMapping("list.dr")
	public String drawBoardList() {
		return "board/drawBoard/drawBoardListview";
	}
	
}

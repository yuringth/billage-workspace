package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardController {
	
	@RequestMapping("select.bo")
	public String selectBoardList() {
		return "board/freeBoard/boardListView";
	}
}

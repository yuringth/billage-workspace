package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardController {
	
	@RequestMapping("list.bo")
	public String selectBoardList() {
		return "board/freeBoard/boardListView";
	}
	
	@RequestMapping("detail.bo")
	public String selectBoardDetail() {
		return "board/freeBoard/boardDetailView";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard() {
		return "board/freeBoard/boardEnrollForm";
	}
}

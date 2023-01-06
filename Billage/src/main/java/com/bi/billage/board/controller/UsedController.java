package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsedController {

	// 리뷰게시판 목록 조회 화면
	@RequestMapping("list.ud")
	public String usedBoardList() {
		return "board/usedBoard/usedListView";
	}
	
	
	
}

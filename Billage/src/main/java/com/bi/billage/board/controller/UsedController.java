package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsedController {

	// 중고게시판 목록 조회 화면
	@RequestMapping("list.ud")
	public String usedBoardList() {
		return "board/usedBoard/usedListView";
	}
	
	
	
	// 중고게시판 -> 글쓰기버튼 클릭 시 -> 중고게시판 글작성 폼화면으로 이동
	@RequestMapping("enrollForm.ud")
	public String usedEnrollForm() {
		return "board/usedBoard/usedEnrollForm";
	}
	
	
	
}

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
	@RequestMapping("insert.ud")
	public String usedInsertForm() {
		return "board/usedBoard/usedEnrollForm";
	}
	
	
	// 중고게시판 -> 글 상세정보 조회 
	@RequestMapping("detail.ud")
	public String usedDetailView() {
		return "board/usedBoard/usedDetailView";
	}
	
	// 중고게시판 -> 글수정 -> 수정폼 화면
	@RequestMapping("update.ud")
	public String usedUpdateForm() {
		return "board/usedBoard/usedUploadForm";
	}
	
	
}

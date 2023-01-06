package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	// 작품 리스트 화면
	@RequestMapping("list.nv")
	public String novelListView() {
		return "board/novelBoard/novelListView";
	}
	
	// 연재 리스트 화면
	@RequestMapping("list.se")
	public String serialListView() {
		return "board/serialBoard/serialListView";
	}
	
	// 연재 상세보기 화면
	@RequestMapping("detail.se")
	public String serialDetailView() {
		return "board/serialBoard/serialDetailView";
	}
	
	// 연재 작성 화면
	@RequestMapping("enrollForm.se")
	public String serialEnroll() {
		return "board/serialBoard/serialEnrollForm";
	}

}

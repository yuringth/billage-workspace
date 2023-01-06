package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	// 리뷰게시판 목록 조회 화면
	@RequestMapping("list.re")
	public String reviewBoardList() {
		return "board/reviewBoard/reviewListView";
	}
	
	
	// 리뷰게시판 -> 글쓰기버튼 클릭 시 -> 리뷰게시판 글작성 폼화면으로 이동
	@RequestMapping("enrollForm.re")
	public String reviewEnrollForm() {
		return "board/reviewBoard/reviewEnrollForm";
	}
	
	
	// 리뷰게시판 -> 게시글 상세보기 
	@RequestMapping("detail.re")
	public String reviewDetail() {
		return "board/reviewBoard/reviewDetailView";
	}
	
	
	// 리뷰게시판 -> 상품 검색 api 페이지 나옴
	@RequestMapping("search.re")
	public String reviewSearchForm() {
		return "board/reviewBoard/reviewSearchView";
	}
	
	
}

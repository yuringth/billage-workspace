package com.bi.billage.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.UsedBoard;

@Controller
public class UsedController {
	
	
	@Autowired // 2. 객체를 bean으로 등록해줌
	private BoardService boardService; // 1. 의존성 주입
	

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
	
	
	// 글작성
	@RequestMapping("upload.ud")
	public String usedUpload(UsedBoard b, MultipartFile upfile) {
		System.out.println(b);
		System.out.println(upfile);
		
		
		
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

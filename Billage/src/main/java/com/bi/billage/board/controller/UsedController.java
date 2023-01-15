package com.bi.billage.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.UsedBoard;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.common.template.Pagination;

@Controller
public class UsedController {
	
	
	@Autowired // 2. 객체를 bean으로 등록해줌
	private BoardService boardService; // 1. 의존성 주입
	

	// 중고게시판 목록 조회 화면
	@RequestMapping("list.ud") 
	public ModelAndView usedBoardList(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectListUsedCount(), currentPage, 10, 3);
		
		// System.out.println(currentPage);
		// System.out.println("pi : " + pi);
		
		
//		키 == 밸류
		mv.addObject("pi", pi).addObject("list", boardService.usedBoardList(pi)).setViewName("board/usedBoard/usedListView");
		System.out.println(mv); // list가 안담김
		// ModelAndView는 메소드체인이 가능해서 코드의 길이가 짧아진다 => 그래서 String으로 사용했을 때 보다 좋다
		return mv;
//		클라이언트의 요청에 응답을 해주는 것
		
	}
	
	/*
	@RequestMapping("list.ud")
	public String usedBoardList() {
		
		
		boardService.usedBoardList();
		
		return "board/usedBoard/usedListView";
	}
	*/
	
	// 중고게시판 -> 글쓰기버튼 클릭 시 -> 중고게시판 글작성 폼화면으로 이동
	@RequestMapping("insert.ud")
	public String usedInsertForm() {
		return "board/usedBoard/usedEnrollForm";
	}
	
	
	// 글작성
	@RequestMapping("upload.ud")
	public String insertUsedBoard(UsedBoard b, MultipartFile upfile,  HttpSession session, Model model) {
		
		System.out.println("중고게시판 : " + b);
		System.out.println(upfile);
		
		if(!upfile.getOriginalFilename().equals("")) { // => 파일이 있을 경우. //getOriginalFilename == filename필드의 값을 반환함
			
			//saveFile(upfile, session); //=> changeName => 이게 왜???????????????
			String changeName = SaveFile.getSaveFile(upfile, session);
			b.setOriginName(upfile.getOriginalFilename()); // 원본명
			b.setChangeName(changeName); // 저장경로(경로+changeName)
		}
		

		// case1. 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// case2. 넘어온 첨부파일이 있는 경우 b : 제목, 작성자, 내용 + 파일원본명, 파일저장경로
		if(boardService.insertUsedBoard(b) > 0) { // 성공 => 게시글 리스트 페이지
			
			System.out.println("성공 시 b의 리스트 : " + b);
			session.setAttribute("alertMsg", "게시글등록성공");
			// return "reviewBoard/reviewListView"; 
			// => 안됨. list를 가져오지 않았기때문임 => db에 들려서 list를 조회해서 가져와야함. 즉 sendRedirect사용해야함
			return "redirect:list.ud";
			
		} else { // 실패 => 에러페이지
			model.addAttribute("errorMsg","게시글 작성에 실패함 ㅠ");
			return "common/errorPage";
		}
	
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

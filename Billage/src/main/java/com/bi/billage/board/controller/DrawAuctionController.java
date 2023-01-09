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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.ADBoard;

@Controller
public class DrawAuctionController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.dr")
	public ModelAndView drawBoardList(ModelAndView mv) {
		mv.addObject("list", boardService.selectDrawBoardList()).setViewName("board/drawBoard/drawBoardListView");
		return mv;
	}
	
	@RequestMapping("list.ac")
	public String auctionBoardList() {
		return "board/auctionBoard/auctionBoardListView";
	}
	
	@RequestMapping("enrollForm.dr")
	public String drawEnrollForm() {
		return "board/drawBoard/drawBoardEnrollForm";
	}
	
	@RequestMapping("enrollForm.ac")
	public String auctionEnrollForm() {
		return "board/auctionBoard/auctionBoardEnrollForm";
	}
	
	@RequestMapping("detail.dr")
	public ModelAndView drawDetailView(int bno,ModelAndView mv) {
		
		if(boardService.increaseCount(bno) > 0) {
			mv.addObject("b", boardService.selectDrawBoard(bno)).setViewName("board/drawBoard/drawDetailView");
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}

	@RequestMapping("detail.ac")
	public String auctionDetailView() {
		return "board/auctionBoard/auctionDetailView";
	}
	
	@RequestMapping("insert.dr")
	public String insertDrawBoard(ADBoard b, MultipartFile upFile, HttpSession session, Model model) {
		
		if(!upFile.getOriginalFilename().equals("")) { // getOriginalFileName == filename필드의 값을 반환함
			
			/*
			
			// 파일명 수정 작업 후 서버에 업로드 시키기("image.png" =. 202212123141.png)
			// "20221226103530" (년월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String originName = upfile.getOriginalFilename();
			
			// 12321(5자리 랜덤값)
			int ranNum = (int)(Math.random()*90000 + 10000);
			
			// 확장자
			String ext = originName.substring(originName.lastIndexOf(".")); // 마지막 .을 기준으로 뒤에만 자르겠다
			
			String changeName = currentTime + ranNum + ext; //변경된 파일 이름
			
			// 업로드시키고자하는 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
			
			try {
				upfile.transferTo(new File(savePath + changeName)); //서버에 파일을 업로드 해주는 메소드 파일경로랑 이름을 적어야한다 (실질적으로 업로드 하는 녀석)
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			*/
			
			
			b.setOriginName(upFile.getOriginalFilename()); //원본명
			b.setChangeName("resources/uploadFiles/" + saveFile(upFile, session));
			
		} 
		// 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// 넘어온 첨부파일이 있는 경우 b : 제목, 작성자, 내용 + 파일 원본명, 파일 저장경로

		if(boardService.insertDrawBoard(b) > 0) { //성공 => 게시글 리스트 페이지
			//포워딩 => boardListView.jsp => 리스트를 안불러와서 리다이렉트를 해야함
			return "redirect:list.bo";
		} else {
			model.addAttribute("errorMsg", "게시글 작성에 실패했어용 ㅠ");
			return "common/errorPage";
		}
	}
	
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
		
		// 파일명 수정 작업 후 서버에 업로드 시키기("image.png" =. 202212123141.png)
		// "20221226103530" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String originName = upfile.getOriginalFilename();
		
		// 12321(5자리 랜덤값)
		int ranNum = (int)(Math.random()*90000 + 10000);
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf(".")); // 마지막 .을 기준으로 뒤에만 자르겠다
		
		String changeName = currentTime + ranNum + ext; //변경된 파일 이름
		
		// 업로드시키고자하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName)); //서버에 파일을 업로드 해주는 메소드 파일경로랑 이름을 적어야한다 (실질적으로 업로드 하는 녀석)
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@RequestMapping("delete.dr")
	public ModelAndView deleteDraw(int boardNo, ModelAndView mv) {
		if(boardService.deleteDrawBoard(boardNo) > 0) {
			mv.setViewName("board/drawBoard/drawBoardListView");
		} else {
			mv.addObject("errorMsg", "게시글 삭제 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
}

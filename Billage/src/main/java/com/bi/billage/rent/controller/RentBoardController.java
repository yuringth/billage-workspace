package com.bi.billage.rent.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.rent.model.service.RentBoardService;
import com.bi.billage.rent.model.vo.RentBoard;

@Controller
public class RentBoardController {
	
	@Autowired
	private RentBoardService rentBoardService;
	
	// 대여게시판으로 이동 화면
	@RequestMapping("list.rt")
	public ModelAndView rentBoardView(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(rentBoardService.selectRentBoardListCount(), currentPage, 10, 5);
		mv.addObject("pi", pi).addObject("list", rentBoardService.selectRentBoardList(pi)).setViewName("board/rentBoard/rentBoardView");
		
		return mv;
	}
	
	// 대여게시판 글 작성으로 이동
	@RequestMapping("enrollForm.rt")
	public String insertRent() {
		return "board/rentBoard/rentEnrollForm";
	}
	
	// 대여게시글 작성
	@RequestMapping("insert.rt")
	public String insertRentBoard(RentBoard rb, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.getSaveFile(upfile, session);
			rb.setChangeName(changeName);
			//System.out.println(changeName);
		
			
		}
		if(rentBoardService.insertRentBoard(rb) > 0) {
			System.out.println(rb);
			session.setAttribute("alertMsg", "게시글 등록 성공");
			return "redirect:list.rt";
		} else {
			model.addAttribute("alertMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	
}

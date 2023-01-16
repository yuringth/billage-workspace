package com.bi.billage.rent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.rent.model.service.RentBoardService;

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
	
	// 대여
	
}

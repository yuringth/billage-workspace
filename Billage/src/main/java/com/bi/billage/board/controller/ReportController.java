package com.bi.billage.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.user.model.vo.User;

@Controller
public class ReportController {
	
	@Autowired
	private BoardService boardService;
	
	/*
	@RequestMapping("list.ro")
	public String selectReportList() {
		return "board/reportBoard/reportBoardListView";
	}
	*/
	
	//reportBoard 목록 띄우기
	@RequestMapping("list.ro")
	public ModelAndView selectReportList(ModelAndView mv) {
		
		ArrayList<ReportBoard> list = boardService.selectReportList();
		
		mv.addObject("list", boardService.selectReportList()).setViewName("board/reportBoard/reportBoardListView");
		
		
		return mv;
		
	}
	
	//reportBoard 작성 페이지
	@RequestMapping("insertForm.ro")
	public String insertReportForm(/*int boardNo ,*/HttpSession session) {
		
		
		 int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		 System.out.println(userNo);
		 session.setAttribute("boardNo", 6);
		 session.setAttribute("userNo", userNo);
		
		return"board/reportBoard/reportEnrollForm";
	}
	
	//reporBoard insert
	@RequestMapping("insert.ro")
	public String insertReport(ReportBoard r, Model model ) {
		
		System.out.println(r);
		
		int result = boardService.insertReport(r);
		
		if(result > 0) {
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "신고 실패");
			
			return "common/errorPage";
		}
		
	}
	
	//reportBoard 상세페이지
	@RequestMapping("detail.ro")
	public ModelAndView selectReportDetail(int rno, ModelAndView mv) {
		
		System.out.println(rno);
		ReportBoard r = boardService.selectReport(rno);
		
		System.out.println(r);
		
		mv.addObject("r",r).setViewName("board/reportBoard/reportBoardDetailView");
		
		return mv;
	}
	
	
}

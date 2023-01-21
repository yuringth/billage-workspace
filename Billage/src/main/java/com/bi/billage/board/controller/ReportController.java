package com.bi.billage.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.user.model.vo.User;
import com.google.gson.Gson;

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
	public String insertReportForm(int reviewNo, HttpSession session) {
		
		 session.setAttribute("reviewNo", reviewNo);
		 session.setAttribute("userNo", ((User)session.getAttribute("loginUser")).getUserNo());
		
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
		
		ReportBoard r = boardService.selectReport(rno);
				
		mv.addObject("r",r).setViewName("board/reportBoard/reportBoardDetailView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="update.ro" ,produces ="application/json; charset=UTF-8" )
	public String updateReportStatus(int reviewNo) {
		
		int result =0;
		
		if(boardService.updateReviewStatus(reviewNo) > 0) {
			result = boardService.updateReportStatus(reviewNo);			
		}
		
		
		return new Gson().toJson(result);
		
	}
}

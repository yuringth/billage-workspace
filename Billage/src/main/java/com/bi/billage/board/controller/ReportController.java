package com.bi.billage.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.ReportBoard;

@Controller
public class ReportController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.ro")
	public String selectReportList() {
		return "board/reportBoard/reportBoardListView";
	}
	
	@RequestMapping("detail.ro")
	public String selectReportDetail() {
		return"board/reportBoard/reportBoardDetailView";
	}
	
	@RequestMapping("insertForm.ro")
	public String insertReportForm(/*int boardNo ,*/HttpSession session) {
		
		session.setAttribute("boardNo", 6);
		
		return"board/reportBoard/reportEnrollForm";
	}
	
	@RequestMapping("insert.ro")
	public String insertReport(ReportBoard r, Model model ) {
		
		int result = boardService.insertReport(r);
		
		if(result > 0) {
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "신고 실패");
			
			return "common/errorPage";
		}
		
		}
	@RequestMapping("list.ro")
	public String selectReportList(Model model) {
		
		ArrayList<ReportBoard> list = boardService.selectReportList();
		
		return "board/reportBoard/reportListView";
		
	}
}

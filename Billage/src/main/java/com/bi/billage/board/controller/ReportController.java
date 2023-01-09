package com.bi.billage.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bi.billage.board.model.vo.ReportBoard;

@Controller
public class ReportController {
	
	@RequestMapping("list.ro")
	public String selectReportList() {
		return "board/reportBoard/reportBoardListView";
	}
	
	@RequestMapping("detail.ro")
	public String selectReportDetail() {
		return"board/reportBoard/reportBoardDetailView";
	}
	
	@RequestMapping("insertForm.ro")
	public String insertReportForm(int boardNo, HttpSession session) {
		
		session.setAttribute("boardNo", boardNo);
		
		return"board/reportBoard/reportEnrollForm";
	}
	
	@RequestMapping("insert.ro")
	public String insertReport(ReportBoard r) {
		
		return"main";
		
	}
}

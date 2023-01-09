package com.bi.billage.board.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	// 작품 리스트 화면 +페이징처리
	@RequestMapping("list.nv")
	public ModelAndView selectNovelList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectNovelListCount(), currentPage, 10, 12);
		mv.addObject("pi", pi).addObject("list", boardService.selectNovelList(pi)).setViewName("board/novelBoard/novelListView");
		
		return mv;
	}
	
	// 연재 리스트 화면 +페이징처리
	@RequestMapping("list.se")
	public ModelAndView selectSerialList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, int nno) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectSerialListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi).addObject("list", boardService.selectSerialList(pi, nno)).setViewName("board/serialBoard/serialListView");
		
		return mv;
	}
	
	// 연재 상세보기 화면
	@RequestMapping("detail.se")
	public ModelAndView selectSerialDetail(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, @Param("novelNo") int nno, @Param("serialNo") String sno) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectSerialListCount(), currentPage, 10, 5);
		mv.addObject("pi", pi).addObject("list", boardService.selectSerialDetail(pi, nno, sno)).setViewName("board/serialBoard/serialDetailView");
		
		return mv;
	}
	
	// 연재 작성 화면
	@RequestMapping("enrollForm.se")
	public String serialEnroll() {
		return "board/serialBoard/serialEnrollForm";
	}

}

package com.bi.billage.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.group.model.service.GroupService;

@Controller
public class GroupController {
	
	//@Autowired
	//private GroupService groupService;
	
	//등록된 모임 리스트를 가지고 와야 함 , 페이징 처리 필요
	@RequestMapping("list.gr")
	public /*ModelAndView*/String selectGroup(/*@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv*/) {
		
		//PageInfo pi = pagination.
		//mv.setViewName("group/groupListView");
		//return mv;
		return "group/groupListView";
	}
	
	
	// 모임 상세보기 메소드 
	@RequestMapping("detail.gr")
	public String selectDetailGroup(/*게시글 번호*/) {
		//게시글 번호 조회 
		return "group/groupDetailView";
	}
	
	// 마이페이지에서 모임 개설하기 클릭시 실행되는 메소드 
	@RequestMapping("enrollForm.gr")
	public String enrollGroup() {
		return "group/groupEnrollForm";
	}
	
	
	
}

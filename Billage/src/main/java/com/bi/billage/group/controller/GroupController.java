package com.bi.billage.group.controller;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.group.model.service.GroupService;
import com.bi.billage.group.model.vo.Group;

@Controller
public class GroupController {
	
	// API serviceKey
	private static final String serviceKey = "B15BD225-F8CB-34E6-9DC3-A77C2FE5F5A9";
	
	@Autowired
	private GroupService groupService;
	
	//등록된 모임 리스트를 가지고 와야 함 , 페이징 처리 필요
	@RequestMapping("list.gr")
	public ModelAndView selectGroup(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(groupService.selectListCount(), currentPage, 10, 9);
		
		mv.addObject("pi", pi);
		mv.addObject("groupList", groupService.selectList(pi));
		
		mv.setViewName("group/groupListView");
		return mv;
	}
	
	
	// 모임 상세보기 메소드 
	@RequestMapping("detail.gr")
	public String selectDetailGroup(/*게시글 번호*/) {
		//게시글 번호 조회 
		return "group/groupDetailView";
	}
	

	
	
	// 지역을 찾는 API을 구현 함 
	@ResponseBody
	@RequestMapping(value="searchAddr.gr", produces = "application/json; charset=UTF-8")
	public String ajaxSearchAddr(String keyword) throws IOException {
		
		String url = "http://api.vworld.kr/req/search";
			  url += "?key=" + serviceKey;
			  url += "&query=" + keyword;
			  url += "&type=address";
			  url += "&category=road";
			  url += "&request=search";
			  url += "&size=100";
			  
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET"); 
		
		BufferedReader br = new BufferedReader(new InputStreamReader (urlConnection.getInputStream()));
		
		String responseText = "";
		String line; 
		
		while((line = br.readLine()) != null ) {
			responseText += line; 
		}
			  
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
	
	
	// 마이페이지에서 모임 개설하기 클릭시 실행되는 메소드  -- 모임등록폼 작성 페이지 
	@RequestMapping("enrollForm.gr")
	public String enrollGroup() {
		return "group/groupEnrollForm";
	}
	
	// 모임등록 하면 값 들어오는 메소드 --------------------------------- 기능 구현 필요함 
	@RequestMapping("create.gr")
	public String insertGroup(Model model, Group group, MultipartFile upfile, HttpSession session) {
		//System.out.println(group);
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.getSaveFile(upfile, session);
			group.setGroupImg(changeName);
		}
		
		if(0 < groupService.insertGroup(group)) {
			
			return "group/groupAdminView";
		} else {
			model.addAttribute("errorMsg", "그룹 인설트 오류");
			return "common/errorPage";
		}
	}
	
	
}

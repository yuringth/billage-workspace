package com.bi.billage.club.controller;

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

import com.bi.billage.club.model.service.ClubService;
import com.bi.billage.club.model.vo.Club;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.user.model.vo.User;
import com.google.gson.Gson;

@Controller
public class ClubController {
	
	// API serviceKey
	private static final String serviceKey = "B15BD225-F8CB-34E6-9DC3-A77C2FE5F5A9";
	
	@Autowired
	private ClubService clubService;
	
	//등록된 모임 리스트를 가지고 와야 함 , 페이징 처리 필요
	@RequestMapping("list.cl")
	public ModelAndView selectGroup(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(clubService.selectListCount(), currentPage, 10, 9);
		
		mv.addObject("pi", pi);
		mv.addObject("groupList", clubService.selectList(pi));
		
		mv.setViewName("club/clubListView");
		return mv;
	}
	
	
	// 모임 상세보기 메소드 
	@RequestMapping("detail.cl")
	public ModelAndView selectDetailGroup(int clubNo, String newCount, ModelAndView mv) {
		
		//게시글 번호 들고 가서 group_count증가 
		if(clubService.increaseCount(clubNo) > 0) {
			Club club = clubService.selectDetailGroup(clubNo);
			club.setNewCount(newCount);
			//게시글 번호로 해당 글 상세 조회 
			mv.addObject("club", club);
			mv.setViewName("club/clubDetailView");
			return mv;
			
		} else {
			mv.addObject("group", "group게시글 조회에 실패했습니다").setViewName("common/errorPage");
			return mv;
		} 
	}
	
	
	// 모임 마이페이지에서 <일반 >
	@RequestMapping("general.cl")
	public ModelAndView clubGeneral(HttpSession session, ModelAndView mv) {
		
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		mv.addObject("clubList", clubService.clubGeneral(userNo));
		mv.setViewName("club/clubGeneralView");
		
		return mv;
	}
	
	
	// 모임 마이페이지에서 <일반> 모임가입자 모임 탈퇴하기
	@ResponseBody
	@RequestMapping(value="ajaxDeleteClub.cl", produces="application/json; charset=UTF-8")
	public String ajaxDeleteClub(Club club, Model model) {
		
		/*
		 * int clubNo, int userNo
		HashMap<String, String> map = new HashMap();
		map.put("clubNo", clubNo);
		map.put("userNo", userNo);
		
		Club club = new Club();
		club.setClubNo(clubNo);
		club.setUserNo(userNo);
		 */

		return new Gson().toJson(clubService.ajaxDeleteClub(club));
	}
	
	
	
	// 모임 마이페이지에서 <모임장>
	@RequestMapping("admin.cl")
	public String groupAdmin() {
		return "club/clubAdminView";
	}
	

	

	
	
	// 지역을 찾는 API을 구현 함 
	@ResponseBody
	@RequestMapping(value="searchAddr.cl", produces = "application/json; charset=UTF-8")
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
	@RequestMapping("enrollForm.cl")
	public String enrollGroup() {
		return "club/clubEnrollForm";
	}
	
	// 모임등록 하면 값 들어오는 메소드 --------------------------------- 기능 구현 필요함 
	@RequestMapping("create.cl")
	public String insertGroup(Model model, Club club, MultipartFile upfile, HttpSession session) {
		//System.out.println(group);
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.getSaveFile(upfile, session);
			club.setClubImg(changeName);
		}
		
		if(0 < clubService.insertGroup(club)) {
			
			return "club/clubAdminView";
		} else {
			model.addAttribute("errorMsg", "그룹 인설트 오류");
			return "common/errorPage";
		}
	}
	
	
}

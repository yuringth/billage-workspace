package com.bi.billage.club.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.bi.billage.club.model.vo.ClubOpen;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.message.model.service.MessageService;
import com.bi.billage.message.model.vo.Message;
import com.bi.billage.user.model.vo.User;
import com.google.gson.Gson;

@Controller
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private MessageService messageService;
	
	
	//API serviceKey
	private static final String serviceKey = "B15BD225-F8CB-34E6-9DC3-A77C2FE5F5A9";
	
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

	
	//등록된 모임 리스트를 가지고 와야 함 , 페이징 처리 필요
	@RequestMapping("list.cl")
	public ModelAndView selectGroup(@RequestParam(value="cpage", defaultValue="1")int currentPage
								   ,String condition, ModelAndView mv, HttpSession session ) {

		PageInfo pi = Pagination.getPageInfo(clubService.selectListCount(), currentPage, 10, 9);
		mv.addObject("pi", pi);

		mv.addObject("clubList", clubService.selectList(pi, condition));
	
		if(null != session.getAttribute("loginUser")) {
			mv.addObject("likeList", clubService.selectClubLike(((User)session.getAttribute("loginUser")).getUserNo()));
		}
		
		mv.addObject("condition", condition);
		mv.setViewName("club/clubListView");
		return mv;
	}
	
	
	//keyword and condition에 따른 검색 
	@RequestMapping("search.cl")
	public ModelAndView selectSearch(ModelAndView mv, @RequestParam(value="cpage", defaultValue="1") int currentPage,
									 String condition, String keyword, HttpSession session){
		
		System.out.println(condition);
		System.out.println(keyword);
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		
		PageInfo pi = Pagination.getPageInfo(clubService.searchCount(map), currentPage, 10, 9);
		System.out.println(clubService.searchCount(map));
		
		mv.addObject("pi", pi);
		ArrayList<Club> list = clubService.selectSearchList(pi, map);
		mv.addObject("clubList", clubService.selectSearchList(pi, map));
		
		if(null != session.getAttribute("loginUser")) {
			mv.addObject("likeList", clubService.selectClubLike(((User)session.getAttribute("loginUser")).getUserNo()));
		}
		
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		mv.setViewName("club/clubListView");
		return mv;
	}
	
	
	// 모임 상세보기 메소드 
	@RequestMapping("detail.cl")
	public ModelAndView selectDetailClub(Club club, String newCount, ModelAndView mv,  HttpSession session) {
		
		int clubNo = club.getClubNo();
		
		//게시글 번호 들고 가서 group_count증가 
		int result = clubService.increaseCount(club);
		
		if(result > 0) {
			if(null != session.getAttribute("loginUser")) {
				club.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
				((User)session.getAttribute("loginUser")).setClubNo(clubNo);
			} 
		
			//게시글 번호로 해당 글 상세 조회 
			club = clubService.selectDetailClub(club);
			club.setNewCount(newCount);				
			ArrayList<ClubOpen> clubOpen = clubService.clubOpenSelectAdmin(clubNo);
			ArrayList<Club> ClubMemberList = clubService.clubMemberSelectAdmin(clubNo);
			
			mv.addObject("club", club);
			mv.addObject("clubOpenList", clubOpen);
			mv.addObject("memberList", ClubMemberList);
			
			
			mv.setViewName("club/clubDetailView");
			return mv;
			
		} else {
			mv.addObject("errorMsg", "club게시글 조회에 실패했습니다").setViewName("common/errorPage");
			return mv;
		} 
	}

	
	//clubBoardForm
	@RequestMapping("board.cl")
	public String clubBoardForm(int clubNo, Model model) {
		model.addAttribute("clubNo", clubNo);
		return "club/clubBoardEnrollForm";
	}
	
	
	//selectParticipantList ajax
	@ResponseBody
	@RequestMapping(value="ajaxMemList.cl", produces="application/json; charset=UTF-8")
	public String ajaxClubMemberList(int clubNo) {
		return new Gson().toJson(clubService.clubMemberSelectAdmin(clubNo));
	}
	
	
	// like ajax 
	@ResponseBody
	@RequestMapping(value="clubLike.cl", produces = "application/json; charset=UTF-8")
	public String clubLike(Club club, int likeStatus) {
		
		// 0보다 크면 찜하기 취소  | 0이면 찜하기 신청 
		
		int[] result = new int[2];
		
		// club좋아요 삭제 여부 
		if(likeStatus > 0) {
			result[0] = (clubService.clubLikeDelete(club) > 0 )? 0 : -1;
		} else {
			result[0] = (clubService.clubLikeInsert(club) > 0 )? 1 : -1;
		} 
		
		result[1] = clubService.selectClubLikeCount(club);

		return new Gson().toJson(result);
	}
		
	
	// parti ajax
	@ResponseBody
	@RequestMapping(value="clubMember.cl", produces = "application/json; charset=UTF-8")
	public String clubParticipate(Club club, int partiStatus) {
		
		//System.out.println(partiStatus);
		int result = 0;

		if(partiStatus > 0) {
			result = (clubService.ajaxDeleteClub(club) > 0)? 0 : -1;
		} else {
			result = (clubService.ajaxInsertClub(club) > 0)? 1 : -1;
		}
	
		//System.out.println(result);
		return new Gson().toJson(result);
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
	
	
	// 클럽에 가입한 회원 다수 삭제 
	@ResponseBody
	@RequestMapping(value="ajaxDeleteClubs.cl", produces="application/json; charset=UTF-8")
	public String ajaxDeleteClubs(int[] userNo, int clubNo, Model model) {
		
		ArrayList<Club> deleteList = new ArrayList();
		
		for(int i = 0; i < userNo.length; i++) {
			Club club = new Club();
			
			club.setClubNo(clubNo);
			club.setUserNo(userNo[i]);
			
			deleteList.add(club);
		}
		
		return new Gson().toJson(clubService.ajaxDeleteClubs(deleteList));
	}
	
	
	//ajaxInsertClubOpen.cl
	@ResponseBody
	@RequestMapping("ajaxOpenInsert.cl")
	public String ajaxInsertOpenMem(ClubOpen clubOpen) {
		
		//System.out.println(clubOpen.getClubNo());
		
		int result = 0;
		
		if( clubService.ajaxInsertOpenMem(clubOpen) > 0 ) {
			result = clubService.selectOpenMemNum(clubOpen);
		}
		
		return new Gson().toJson(result);
	}
	
	
	// 모임 마이페이지에서 <모임장> 페이지 넘어가기 
	@RequestMapping("admin.cl")
	public ModelAndView clubAdmin(HttpSession session, ModelAndView mv) {
		
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		mv.addObject("clubList",  clubService.clubAdmin(userNo));
		mv.setViewName("club/clubAdminView");
		
		return mv;
	}
	

	// 모임 회원 관리 clubMemAdmin.cl
	@RequestMapping("clubMemAdmin.cl")
	public ModelAndView clubMemberSelectAdmin(int clubNo, ModelAndView mv) {
		
		ArrayList<Club> ClubMemberList = clubService.clubMemberSelectAdmin(clubNo);
		
		mv.addObject("clubNo", clubNo);
		mv.addObject("memberList", ClubMemberList);
		mv.setViewName("club/clubMemberAdminView");
		
		return mv;
	}
	
	// 요청을 받고 보낼 때 값에 문제가 발생해서 강제 형변환 해놓음 
	//@RequestParam(value="clubNo", defaultValue="0")
	//clubNo = (int)clubNo;
	
	@RequestMapping("message.cl")
	public String clubMessageInsert(Model model, int userNo, int[] userNo2, String messageContent, long clubNo) {
		
		ArrayList<Message> messageList = new ArrayList();
		
		for(int i = 0; i < userNo2.length; i++) {
			Message message = new Message();
			message.setUserNo(userNo);
			message.setUserNo2(userNo2[i]);
			message.setMessageContent(messageContent);

			messageList.add(message);
		}
		
		if(messageService.insertClubMessage(messageList) > 0 ) {
			return "redirect:clubMemAdmin.cl?clubNo=" + (int)clubNo;
			
		} else {
			model.addAttribute("errorMsg", "메세지 전송 실패");
			return "common/errorPage";
			
		}
				
	}
	
	
	// 마이페이지에서 모임 개설하기 클릭시 실행되는 메소드  -- 모임등록폼 작성 페이지 
	@RequestMapping("enrollForm.cl")
	public String enrollGroup() {
		return "club/clubEnrollForm";
	}
	
	
	// club 등록 후 club 모임장 club Member로 Insert 
	@RequestMapping("create.cl")
	public String insertclub(Model model, Club club, MultipartFile upfile, HttpSession session) {
		//System.out.println(group);
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.getSaveFile(upfile, session);
			club.setClubImg(changeName);
		}
		
		if(0 < clubService.insertClub(club)) {
			if( 0 < clubService.insertClubAdmin(club)) {
				return "redirect:admin.cl";
			} else {
				model.addAttribute("errorMsg", "club인설트 후 모임장 멤버 등록 실패");
				return "common/errorPage";
			}
		} else {
			model.addAttribute("errorMsg", "그룹 인설트 오류");
			return "common/errorPage";
		}
	}
	
	
	//모임 관리자 페이지에서 활동 클릭 하면 해당 클럽활동 오픈 리스트 화면으로 로딩 시키기
	@RequestMapping("clubOpenAdmin.cl")
	public ModelAndView clubOpenSelectAdmin(Model model, ModelAndView mv, int clubNo) {
		
		mv.addObject("clubOpenList", clubService.clubOpenSelectAdmin(clubNo));
		model.addAttribute("clubNo", clubNo);
		mv.setViewName("club/clubOpenListAdminView");
		
		return mv;
	}
	
	
	// club 활동 개설 화면 전환 
	@RequestMapping("clubEnroll.cl")
	public String clubOpenEnrollForm(int clubNo, Model model){
		model.addAttribute("clubNo", clubNo);
		return "club/clubIOpenEnrollForm";
	}
	
	
	// club Open 등록폼 Insert
	@RequestMapping("createOpen.cl")
	public String insertClubOpen(int clubNo, ClubOpen clubOpen, Model model){
		
		if(clubService.insertClubOpen(clubOpen) > 0) {
			return "redirect:clubOpenAdmin.cl?clubNo=" + (int)clubNo;
		} else {
			model.addAttribute("errorMsg", "클럽 액티비티 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	
	
		
	
	
	
	
}

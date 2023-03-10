package com.bi.billage.rent.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.point.model.service.PointService;
import com.bi.billage.point.model.vo.Point;
import com.bi.billage.rent.model.service.RentBoardService;
import com.bi.billage.rent.model.vo.RentBoard;
import com.bi.billage.user.model.service.UserService;
import com.bi.billage.user.model.vo.User;

@Controller
public class RentBoardController {
	
	@Autowired
	private RentBoardService rentBoardService;
	@Autowired
	private UserService userService;
	
	@Autowired
	private PointService pointService;
	
	// 대여게시판으로 이동 화면
	@RequestMapping("list.rt")
	public ModelAndView rentBoardView(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(rentBoardService.selectRentBoardListCount(), currentPage, 10, 8);
		mv.addObject("pi", pi).addObject("list", rentBoardService.selectRentBoardList(pi)).setViewName("board/rentBoard/rentBoardView");
		
		return mv;
	}
	
	// 대여게시판 글 작성으로 이동
	@RequestMapping("enrollForm.rt")
	public String insertRent() {
		return "board/rentBoard/rentEnrollForm";
	}
	
	// 대여게시글 작성
	@RequestMapping("insert.rt")
	public String insertRentBoard(RentBoard rb, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.getSaveFile(upfile, session);
			rb.setChangeName(changeName);
			//System.out.println(changeName);
		}
		
		if(rentBoardService.insertRentBoard(rb) > 0) {
			
			//1. 작성한 글 세션에 +1 하기
	         ((User)session.getAttribute("loginUser"))
	         .setBoardCount(((User)session.getAttribute("loginUser")).getBoardCount() + 1);
	         
	         //2. 등급 별로 조건 넘어가면 등급 +1 하기
	         
	         //등급이 3일때
	         if(((User)session.getAttribute("loginUser")).getUserGrade() == 3) {
	            
	            if(((User)session.getAttribute("loginUser")).getBoardCount() == 10){
	               
	               //등급 +1 하는 메소드
	               userService.updateGrade(((User)session.getAttribute("loginUser")).getUserNo());
	               
	               //등급 +1 하고 세션에 업데이트 된 등급 넣기
	               ((User)session.getAttribute("loginUser"))
	               .setUserGrade(((User)session.getAttribute("loginUser")).getUserGrade() + 1);
	               
	               session.setAttribute("alertMsg", "게시글 등록 완료! 축하합니다 등급이 상승되었습니다");
	               // 여기에 alertMessage 축하합니다 등급이 ~등급으로 올랐습니다 세션 하실분 하세요
	               return "redirect:list.rt";
	            }
	         }
	         
	         //등급이 4일때
	         if(((User)session.getAttribute("loginUser")).getUserGrade() == 4) {
	            
	            if(((User)session.getAttribute("loginUser")).getBoardCount() == 30){
	               
	               //등급 +1 하는 메소드
	               userService.updateGrade(((User)session.getAttribute("loginUser")).getUserNo());
	               
	               //등급 +1 하고 세션에 업데이트 된 등급 넣기
	               ((User)session.getAttribute("loginUser"))
	               .setUserGrade(((User)session.getAttribute("loginUser")).getUserGrade() + 1);
	               
	               
	               // 여기에 alertMessage 축하합니다 등급이 ~등급으로 올랐습니다 세션 하실분 하세요
	               session.setAttribute("alertMsg", "게시글 등록 완료! 축하합니다 등급이 상승되었습니다");
	               return "redirect:list.rt";
	            }
	         }
	         
			session.setAttribute("alertMsg", "게시글 등록 성공");
			return "redirect:list.rt";
		} else {
			model.addAttribute("alertMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	// 대여게시글 상세보기
	@RequestMapping("detail.rt")
	public ModelAndView detailRentBoard(ModelAndView mv, int rentNo) {
		
		if(rentBoardService.detailRentBoard(rentNo) != null) {
			mv.addObject("rb", rentBoardService.detailRentBoard(rentNo)).setViewName("board/rentBoard/rentDetailView");
		} else {
			mv.addObject("errorMsg", "조회실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/*
	// 대여 신청 서비스
	@RequestMapping("apply.rt")
	public ModelAndView applyRent(ModelAndView mv, RentBoard rb, HttpSession session) {
		
		rb.setRentUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		int result = rentBoardService.updatePoint(rb);
	}
	*/
	
	// 대여 신청 서비스
	@RequestMapping("apply.rt")
	public String applyRent(HttpSession session, RentBoard rb) {
		User loginUser = (User)session.getAttribute("loginUser");
		// 빌리는 사람 유저넘버
		int renterNo = loginUser.getUserNo();
		rb.setRentUserNo(renterNo);
		Point renter = new Point();	// 빌리는 사람
		Point writer = new Point();	// 빌려주는 사람(글 작성자)
		
		if(rentBoardService.updateStatus(rb) > 0) {
		
			renter.setUserNo(renterNo);
			renter.setPointAdd(rb.getRentPoint() * (-1));
			renter.setPointStatus("사용");
		
			writer.setUserNo(rb.getUserNo());
			writer.setPointAdd(rb.getRentPoint());
			writer.setPointStatus("적립");
			
			if(loginUser.getPoint() > rb.getRentPoint()) {
				pointService.addPoint(renter);
				pointService.addPoint(writer);
				return "board/rentBoard/chkApply";
			} else {
				session.setAttribute("alertMsg", "포인트가 충분하지 않습니다.");
				return "redirect:detail.rt?rentNo=" + rb.getRentNo();
			} 
		} else {
			session.setAttribute("alertMsg", "대여 신청에 실패했습니다.");
			return "redirect:detail.rt?rentNo=" + rb.getRentNo();
					
		}
		
		// 유저의 포인트가 렌트포인트보다 낮으면 버튼이 안눌림
		
	}
	
	// 마이페이지 대여 목록
	@RequestMapping("rentMypageList.rt")
	public ModelAndView rentMypageList(HttpSession session, ModelAndView mv) {
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<RentBoard> list = rentBoardService.selectRentMypageList(userNo);
		mv.addObject("list", list);
		mv.setViewName("board/rentBoard/rentMypageList");
		
		return mv;
		
	}
	
}

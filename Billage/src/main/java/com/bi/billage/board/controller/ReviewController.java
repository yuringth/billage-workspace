package com.bi.billage.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.Book;
import com.bi.billage.board.model.vo.ReviewBoard;
import com.bi.billage.board.model.vo.ReviewReply;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.heart.model.vo.ReviewLike;
import com.bi.billage.point.model.service.PointService;
import com.bi.billage.point.model.vo.Point;
import com.bi.billage.user.model.service.UserService;
import com.bi.billage.user.model.vo.User;
import com.google.gson.Gson;

@Controller
public class ReviewController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private PointService pointService;
	
	@Autowired
	private UserService userService;

	
	// API 오픈 키 => 나중에 알라딘 API 오픈키 발급받아서 serviceKey에 업데이트 하기
	private static final String serviceKey="ttbiuui12341246001";

	
	
	// API(책이름 검색)
	@ResponseBody
	@RequestMapping(value="search.bk", produces="application/json; charset=UTF-8")
	public String reviewApi (String title) throws IOException {
		
		// BOOK테이블에서 책제목과 일치하는 ISBN을 select 한 후 isbn변수로 지정
		Book isbn = boardService.selectIsbn(title);
		
		String url ="http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
		url += "?ttbkey=" + serviceKey; // 부여받은 TTBKey값
		url += "&itemIdType=ISBN"; 
		url += "&ItemId=" + isbn.getIsbn(); // 출력방법 => json이니까 produces추가
		url += "&output=js";
		url += "&Version=20131101";
		url += "&OptResult=ebookList,usedList,reviewList";
		
		URL requestUrl = new URL(url); 
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection(); 
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = br.readLine();
		
		br.close();
		urlConnection.disconnect(); 
		
		return responseText; // 응답데이터 	@ResponseBody
	}
	
	
	
	// API(ISBN 검색)
	@ResponseBody
	@RequestMapping(value="searchBook.bk", produces="application/json; charset=UTF-8")
	public String reviewBookApi (String keyword) throws IOException {
		
		// System.out.println(keyword);
		String url2 ="http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
		url2 += "?ttbkey=" + serviceKey; 
		url2 += "&itemIdType=ISBN"; 
		url2 += "&ItemId=" + keyword; 
		url2 += "&output=js";
		url2 += "&Version=20131101";
		url2 += "&OptResult=ebookList,usedList,reviewList";
		
		//System.out.println(url2);
		
		URL requestUrl2 = new URL(url2); 
		HttpURLConnection urlConnection2 = (HttpURLConnection)requestUrl2.openConnection(); 
		urlConnection2.setRequestMethod("GET");
		
		BufferedReader br2 = new BufferedReader(new InputStreamReader(urlConnection2.getInputStream()));
		
		String responseText = br2.readLine();
		
		br2.close();
		urlConnection2.disconnect(); 
		
		return responseText; 
	}
	
	
	
	//  게시판 list 조회 화면 => ModelAndView 사용 => 메소드체인이 가능해서 코드의 길이가 짧아진다
	@RequestMapping("list.re")
	public ModelAndView reviewBoardList(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv) {

		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(), currentPage, 10, 4);
		
		mv.addObject("pi", pi).addObject("list", boardService.reviewBoardList(pi)).setViewName("board/reviewBoard/reviewListView");
		
		return mv;
	}
	
	
	
	// 글작성 
	@RequestMapping("insertBoard.re")
	public String insertReviewBoard(ReviewBoard b,  Model model, HttpSession session, ModelAndView mv) {
		
		// 내가 넘긴 b의 정보를 담은 것 
		
		// 1) 중복되는 책 있는지 select 하여 확인
		if(boardService.selectBookTitle(b) == null) {
			
			Point p = new Point();
			// 글 작성시 현재 포인트에서 증가
			p.setUserNo(b.getUserNo());
			p.setPointAdd(10);
			p.setPointStatus("적립");
			
			// 2) 중복 된 책 없으면 insert + point 적립
			if(pointService.addPoint(p) * boardService.insertReviewBoard(b) > 0) {
				// 포인트 적립, 리뷰 등록 성공
				((User)session.getAttribute("loginUser")).setPoint(pointService.selectPoint(b.getUserNo()));
				
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
		               
		               return "redirect:list.re";
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
		               
		               return "redirect:list.re";
		            }
		         }
		        
		        session.setAttribute("alertMsg", "10포인트 적립 되었습니다");
				return "redirect:list.re";
				
			} else { // 뭐든 실패
				mv.addObject("errorMsg", "오류발생");
				return "common/errorPage";
			}
			
		} else {
			session.setAttribute("alertMsg", "동일한 도서는 작성할 수 없습니다");
			return "redirect:list.re";
		}
	}
			

	
	// 글쓰기버튼 클릭 시 -> 리뷰게시판 글작성 폼화면으로 이동
	@RequestMapping("insert.re")
	public String reviewInsertForm() {
		return "board/reviewBoard/reviewEnrollForm";
	}
	
	
	// 게시글 상세보기 : boardNo를 식별값으로 사용할것이기에 가져와야함
	@RequestMapping("detail.re")
	public String reviewDetail(int reviewNo, Model model) {
		
		// 조회수 증가
		if(boardService.increaseReviewCount(reviewNo) > 0) { // 조회수 증가 성공 시 => 상세보기 들어감
			// 조회 성공 시 => DB에서 데이터를 가져옴
			ReviewBoard b = boardService.selectReviewBoard(reviewNo);
			model.addAttribute("b", b);
			return "board/reviewBoard/reviewDetailView";
		} 
		else {
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
		}
	}
	

	
	// 글삭제
	@RequestMapping("delete.re")
	public String deleteReviewBoard(ReviewBoard b, Model model,  HttpSession session) {
		
		Point p = new Point();
		//글 삭제 시 현재 포인트에서 차감
		p.setUserNo(b.getUserNo());
		p.setPointAdd(-10);
		p.setPointStatus("취소");
			
		if(pointService.addPoint(p) * boardService.deleteReviewBoard(b) > 0) {
			((User)session.getAttribute("loginUser")).setPoint(pointService.selectPoint(b.getUserNo()));
			return "redirect:list.re";
		} 
		else {
			model.addAttribute("errorMsg","게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
	
	// 글수정 누를 시 -> 수정폼 화면 나옴
	@RequestMapping("enrollForm.re")
	public ModelAndView reviewEnrollForm(int reviewNo, ModelAndView mv) {
		mv.addObject("b", boardService.selectReviewBoard(reviewNo)).setViewName("board/reviewBoard/reviewUploadForm");
		return mv;
	}
	
	
	
	// 글 수정
	@RequestMapping("updateReview.re")
	public String updateReviewBoard(ReviewBoard b, Model model, HttpSession session) {
	
//		System.out.println("수정한 뒤 책정보 " + b);
		
		// 1) 리뷰넘버로 책제목조회
		// 수정 책 제목 == 기존 db의 책 타이틀
		// 수정할 책제목과 비교
		// 똑같은 책이면 UPDATE 
		// 1_책 정보는 그대로 두되 내용만 수정하고싶을 경우
		ReviewBoard reviewBoard = boardService.selectBookTitle2(b);
//		System.out.println("책 중복되는지 확인(리뷰넘버로 책제목조회) "+ reviewBoard);
	
		if(b.getBookTitle().equals(reviewBoard.getBookTitle())) { 
			// 1_ 책 정보는 그대로 두되 내용만 수정하고싶을 경우
			// select 해온 책 제목 == 수정할 책제목과 일치하면 update 가능 => 내용만 수정가능
			
			boardService.updateReviewBoard(b);
//			System.out.println("내용만 수정 : " + b);
			
			return "redirect:detail.re?reviewNo=" + b.getReviewNo();

		} else if(boardService.selectBookTitle(b) == null) {
			// 근데 똑같은 책이 아닐경우
			
			boardService.updateReviewBoard(b);
//			System.out.println("책/내용 변경 후 : " + b);
			return "redirect:detail.re?reviewNo=" + b.getReviewNo();
			
		} else { // 이미 작성한 책정보가 있을 경우 => 수정 불가
			session.setAttribute("alertMsg", "동일한 책은 작성할 수 없습니다");
			return "redirect:enrollForm.re?reviewNo=" + b.getReviewNo();
			// return "reviewBoard/reviewListView"; 
			// => 안됨. list를 가져오지 않았기때문임 => db에 들려서 list를 조회해서 가져와야함. 즉 sendRedirect사용해야함
		}
	}
	
	
	
	// 댓글 list 띄워주기
	@ResponseBody
	@RequestMapping(value = "rlist.re", produces = "application/json; charset=UTF-8")
	public String selectReviewReplyList(int reviewNo) {
		// 자바에서 쓰는 객체를 자바스크립트에서 사용하려면 
		return new Gson().toJson(boardService.selectReviewReplyList(reviewNo));
	}

	
	
	// 댓글작성
	@ResponseBody
	@RequestMapping(value = "rInsert.re", produces = "text/html; charset=UTF-8")
	public String insertReviewReply(int reviewNo, String replyContent, HttpSession session) {
		
		ReviewReply r = new ReviewReply();
		r.setReviewNo(reviewNo);
		r.setReplyContent(replyContent);
		r.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		
		if(boardService.insertReviewReply(r) > 0) {
			return "1";
			//응답데이터가 많을 때 gson/json을 사용 => 나는 1만 보내주면 되니까 1을 리턴하면 됨
		} else {
			session.setAttribute("alertMsg", "댓글 작성할 수 없습니다");
			return "redirect:detail.re?reviewNo=" + reviewNo;
		}
	}
	
		
	
	// 댓글 삭제
	@RequestMapping("rdelete.re")
	public String deleteReply(int replyNo, int reviewNo, Model model) {
		
		ReviewReply r = new ReviewReply();

		r.setReplyNo(replyNo);
		r.setReviewNo(reviewNo);
		
		if(boardService.deleteReviewReply(r) > 0) {
			return "redirect:detail.re?reviewNo=" + reviewNo;
		} else {
			model.addAttribute("errorMsg", "댓글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
	
	// 댓글 수정 (구현 못함)
	@RequestMapping("rUpdate.re")
	public String updateReviewReply(int rno, String content) {
		
		System.out.println("댓글넘버" + rno);
		System.out.println("댓글 내용" + content);
		
		return null;
	}
	
	
	
	// 댓글수정 (구현 못함)
//	@ResponseBody
//	@RequestMapping(value = "rUpdate.re", produces = "application/json; charset=UTF-8")
//	public String updateReviewReply(int reviewNo, int replyNo, HttpSession session) {
//		
//		System.out.println("reviewNo  : " + reviewNo);
//		System.out.println("replyNo  : " + replyNo);
//		
//		
//		ReviewReply r = new ReviewReply();
//		r.setReviewNo(reviewNo);
//		r.setReplyNo(replyNo);
//		
//		System.out.println("수정r : " + r);
//		
//		
//		if(boardService.updateReviewReply(r) > 0 ) {
//			return new Gson().toJson(boardService.updateReviewReply(r));
//			
//		} else {
//			
//			session.setAttribute("alertMsg", "댓글 수정할 수 없습니다");
//			return "redirect:detail.re?reviewNo=" + reviewNo;
//		}
//	}	

	
	
	
}

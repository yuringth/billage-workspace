package com.bi.billage.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

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
	
	
	
	// api 오픈 키 => 나중에 알라딘 api 발급받아서 serviceKey에 업데이트 하세용
	private static final String serviceKey="ttbiuui12341246001";
	
	// api도전
	@ResponseBody
	@RequestMapping(value="search.bk", produces="application/json; charset=UTF-8")
	public String reviewApi (String title) throws IOException {
		
		
		Book isbn = boardService.selectIsbn(title);
		
		//System.out.println(isbn);
		
		// url은 손으로 한땀한땀 작성하는게 좋다
		// 인증서 => 브라우저에 있음 => 우리는 http로 작성할것임! https안됨!!
		String url ="http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
		url += "?ttbkey=" + serviceKey; // 부여받은 TTBKey값
		url += "&itemIdType=ISBN"; 
		url += "&ItemId=" + isbn.getIsbn(); // 출력방법 => json이니까 produces추가해야함!!
		url += "&output=js";
		url += "&Version=20131101";
		url += "&OptResult=ebookList,usedList,reviewList";
		
		
		//System.out.println(url);
		
		URL requestUrl = new URL(url); // 부모클래스(?)
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection(); // 부모가 자식한테 어케 들어가 하고 다운캐스팉 해주기
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = br.readLine();
		
		br.close();//버퍼더리더 반납
		urlConnection.disconnect(); // 뭐지?
		
		return responseText; // 응답데이터임!! 	@ResponseBody
	}
	
	
	// 리뷰게시판 -> 상품 검색 api 페이지 나옴 => 삭제함
	/*
	@RequestMapping("search.re")
	public String reviewSearchForm() {
		return "board/reviewBoard/reviewSearchView";
	}
	 */
	
	
	// 리뷰게시판 목록 조회 화면 => 몰라 안됨 ㅡㅡ
	/*
	@RequestMapping("list.re")
	public String reviewBoardList(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		
		System.out.println(currentPage);
		System.out.println(model);
		
		// int listCount, int currentPage, int pageLimit, int boardLimit
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(), currentPage, 10, 4);
		
		// (페이징 pi를 가지고)게시글 리스트 조회
		// ArrayList<ReviewBoard> list = boardService.selectList(pi);
		model.addAttribute("list", boardService.selectList(pi)); // Model은 단지 담는 용도
		model.addAttribute("pi", pi);
		
		// model에 담았으니까 포워딩해주기(/WEB-INF/views/		board/reviewBoard/reviewListView	.jsp
		return "board/reviewBoard/reviewListView";
	}
	*/
	
	// ModelAndView로 바꿔보기 => 리뷰게시판 목록 조회 화면
	@RequestMapping("list.re")
	public ModelAndView reviewBoardList(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(), currentPage, 10, 4);
		
		mv.addObject("pi", pi).addObject("list", boardService.reviewBoardList(pi)).setViewName("board/reviewBoard/reviewListView");
		// ModelAndView는 메소드체인이 가능해서 코드의 길이가 짧아진다 => 그래서 String으로 사용했을 때 보다 좋다
		return mv;
		
	}
	
	
	
	// 리뷰게시판 -> 글작성 
	@RequestMapping("insertBoard.re")
	public String insertReviewBoard(ReviewBoard b,  Model model, HttpSession session, ModelAndView mv) {
		// 내가 넘긴 b의 정보를 담은 것 
		
//		System.out.println("리뷰보드 : " + b);
//		System.out.println("model : " + model);
		
		// 1) 책 중복되는지 확인 select
		if(boardService.selectBookTitle(b) == null) {
			
		
			Point p = new Point();
			//응모포인트만큼 현재 포인트에서 차감
			p.setUserNo(b.getUserNo());
			p.setPointAdd(10);
			p.setPointStatus("적립");
			
			// 2) 중복 된 책 없으면 insert + point
			if(pointService.addPoint(p) * boardService.insertReviewBoard(b) > 0) {
				// 포인트 적립, 리뷰 등록 성공
				((User)session.getAttribute("loginUser")).setPoint(pointService.selectPoint(b.getUserNo()));
		//		System.out.println("응모 성공, 남은 포인트 :" + ((User)session.getAttribute("loginUser")).getPoint());
				
				
				
				// 등급추가 => 했지만 어디서 확인함???????????????????????????????????/
				
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
		               
		               
		               // 여기에 alertMessage 축하합니다 등급이 ~등급으로 올랐습니다 세션 하실분 하세요
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
		               
		               
		               // 여기에 alertMessage 축하합니다 등급이 ~등급으로 올랐습니다 세션 하실분 하세요
		               return "redirect:list.re";
		            }
		         }
		        
		        session.setAttribute("alertMsg", "10포인트 적립 되었습니다");
				return "redirect:list.re";
				
				
			} else { //뭐든 실패
				//session.setAttribute("alertMsg", "동일한 책은 작성할 수 없습니다");
				//return "redirect:enrollForm.re?reviewNo=" + b.getReviewNo();
				mv.addObject("errorMsg", "무슨에러인진모름");
				return "common/errorPage";
			}
			
		} else {
			session.setAttribute("alertMsg", "동일한 도서는 작성할 수 없습니다");
			return "redirect:list.re";
//			model.addAttribute("errorMsg","동일한 도서 게시글 작성 실패2");
//			return "common/errorPage";
		}
	}

			
/*			
 * 	포인트 적립 너무 길어서 짧게 줄임
			// 2) 중복 된 책 없으면 insert
			//boardService.insertReviewBoard(b);
			if(boardService.insertReviewBoard(b) > 0) {
				
				Point p = new Point();
				//응모포인트만큼 현재 포인트에서 차감
				p.setUserNo(b.getUserNo());
//				p.setPointAdd(b.getBookPoint());
				p.setPointAdd(10);
				p.setPointStatus("적립");
				
				// 3) 글작성 성공 시 포인트 insert
				if(pointService.addPoint(p) > 0) {
					// b를 넘기는 이유는 어떤 reviewNo에 point적립을 하는지 알아야해서
					((User)session.getAttribute("loginUser")).setPoint(pointService.selectPoint(b.getUserNo()));
					return "redirect:list.re";
					
				} else {
					
					// 포인트 실패시
					model.addAttribute("errorMsg","게시글 상세조회 실패");
					return "common/errorPage";
				}
			} else {
				// 중복 된 책 없으면 insert의 실패
				model.addAttribute("errorMsg","게시글 상세조회 실패");
				return "common/errorPage";
			}
		} else {
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
		}
	}
			
 */

			
			// ===============
			/*
			// 3) 포인트 insert
			Point p = new Point();
			//응모포인트만큼 현재 포인트에서 차감
			p.setUserNo(b.getUserNo());
			p.setPointAdd(b.getBookPoint());
			p.setPointStatus("적립");
			
			if(pointService.addBookPoint(p) * boardService.insertReviewBoard(b) > 0) {
				// 포인트 적립, 리뷰 등록 성공
				((User)session.getAttribute("loginUser")).setPoint(pointService.selectPoint(b.getUserNo()));
//				System.out.println("응모 성공, 남은 포인트 :" + ((User)session.getAttribute("loginUser")).getPoint());
				return "redirect:detail.dr?bno=" + b.getBoardNo();
			} else { //뭐든 실패
				mv.addObject("errorMsg", "응모 실패");
				return "common/errorPage";
			}

			// ===============
			*/
	
	
	
	// 리뷰게시판 -> 글쓰기버튼 클릭 시 -> 리뷰게시판 글작성 폼화면으로 이동
	@RequestMapping("insert.re")
	public String reviewInsertForm() {
		return "board/reviewBoard/reviewEnrollForm";
	}
	
	
	// 리뷰게시판 -> 게시글 상세보기 : boardNo를 식별값으로 사용할것이기에 가져와야함
	@RequestMapping("detail.re")
	public String reviewDetail(int reviewNo, Model model) {
		
		// System.out.println(reviewNo); 리뷰번호 잘 가져옴
		
		// 조회수 증가
		if(boardService.increaseReviewCount(reviewNo) > 0) { // 조회수 성공 시 => 상세보기 들어감
			// >> 성공적으로 조회수 증가
			// 	>> reviewDetailView.jsp상에 필요한 데이터를 조회(게시글 상세정보 조회용 서비스 호출)
			//		>> 조회된 데이터를 담아서 board/reviewBoard/reviewDetailView로 포워딩
			
			// 조회 성공 시 => db에서 데이터를 가져와야한다.
			ReviewBoard b = boardService.selectReviewBoard(reviewNo);
			
			model.addAttribute("b", b);
			
			return "board/reviewBoard/reviewDetailView";
		} 
		else {
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
		}
		
	}
	

	/*
	// 리뷰게시판 => 글삭제
	@RequestMapping("delete.re")
	public String deleteReviewBoard(int reviewNo) {
		
		if(boardService.deleteReviewBoard(reviewNo) > 0) {
			
			return "redirect:list.re";
			
		}
		
		// 왜 포워딩으로 보내면 안되는거지?? db에 들려서 status를 'Y'로 고쳐서 그런가??	
	}
	*/
	
	// 리뷰게시판 => 글삭제
	@RequestMapping("delete.re")
	public String deleteReviewBoard(ReviewBoard b, Model model,  HttpSession session) {
		
//		System.out.println(b);
//		System.out.println(model);
		
		// 포인트 insert
		Point p = new Point();
		//응모포인트만큼 현재 포인트에서 차감
		p.setUserNo(b.getUserNo());
		p.setPointAdd(-10);
		p.setPointStatus("취소");
			
		if(pointService.addPoint(p) * boardService.deleteReviewBoard(b) > 0) {
			
			((User)session.getAttribute("loginUser")).setPoint(pointService.selectPoint(b.getUserNo()));

			return "redirect:list.re";
			
		} 
		
		else {
			
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
		}
		// 왜 포워딩으로 보내면 안되는거지?? db에 들려서 status를 'Y'로 고쳐서 그런가??	
	}
	
	
	
	// 리뷰게시판 -> 글수정 누를 시 -> 수정폼 화면 나옴
	@RequestMapping("enrollForm.re")
	public ModelAndView reviewEnrollForm(int reviewNo, ModelAndView mv) {
		
		mv.addObject("b", boardService.selectReviewBoard(reviewNo)).setViewName("board/reviewBoard/reviewUploadForm");
//		System.out.println("글 수정 누를 시 mv 정보 : " + mv);
//		System.out.println("글 수정 게시글 번호 : " + reviewNo);
		return mv;
	}
	
	
	// 리뷰게시판 => 글 수정
	@RequestMapping("updateReview.re")
	public String updateReviewBoard(ReviewBoard b, Model model, HttpSession session) {
	
//		System.out.println("수정한 뒤 책정보 " + b);
		
		
		// 1) 리뷰넘버로 책제목조회
		// 수정 책 제목 == 기존 db의 책 타이틀
		// 수정할 책제목과 비교
		// 똑같은 책이면 UPDATE => 
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
		} else {
			// 근데 이미 작성한 책정보가 있을 경우 => 수정 불가
			/*
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
			*/
			
			session.setAttribute("alertMsg", "동일한 책은 작성할 수 없습니다");
			// return "reviewBoard/reviewListView"; 
			// => 안됨. list를 가져오지 않았기때문임 => db에 들려서 list를 조회해서 가져와야함. 즉 sendRedirect사용해야함
			return "redirect:enrollForm.re?reviewNo=" + b.getReviewNo();
		}
			
			
			/*
			// 근데 똑같은 책이 아닐경우
			if(boardService.selectBookTitle(b) == null) {
			
				// 2) 중복 된 책 없으면 insert
				boardService.insertReviewBoard(b);
				
				//return "board/reviewBoard/reviewListView";
				return "redirect:list.re";
			} else {
				// 근데 똑같은 책 일경우 => 책정보를 바꿨을 때 수정 불가
				model.addAttribute("errorMsg","게시글 상세조회 실패");
				return "common/errorPage";
			}
			*/
		
		
		
		
		/*
		
		if(reviewBoard == null) { // 책 중복이면
		
			
			
		} else if(b.getBookTitle().equals(reviewBoard.getBookTitle())){
			
			// 2) 중복 된 책 없으면 update
			boardService.updateReviewBoard(b);
			
			return "redirect:detail.re?reviewNo=" + b.getReviewNo();
			
		} 
		model.addAttribute("errorMsg","게시글 상세조회 실패");
		return "common/errorPage";
		
		*/
		
		/* 글만 수정 가능
		if(boardService.updateReviewBoard(b) > 0 ) { // 수정 성공 시
			return "redirect:detail.re?reviewNo=" + b.getReviewNo();
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
		*/
	
	}
	
	
	
	
	// 리뷰게시판 댓글 list 띄워주기
	@ResponseBody
	@RequestMapping(value = "rlist.re", produces = "application/json; charset=UTF-8")
	public String selectReviewReplyList(int reviewNo/*, Model model ajax여서 모델에 담을 필요없음*/) {
		
//		System.out.println("reviewNo  : " + reviewNo);
		
	//	ArrayList<ReviewReply> list = boardService.selectReviewReplyList(reviewNo);
		
//		model.addAttribute("list", list); 필요없음
//		System.out.println("model :" + model); 필요없음
		
		// 자바에서 쓰는 객체를 자바스크립트에서 사용하려면 
		return new Gson().toJson(boardService.selectReviewReplyList(reviewNo));

	}
	
	
	// 리뷰게시판 댓글 삭제
	@RequestMapping("rdelete.re")
	public String deleteReply(int replyNo, int reviewNo, Model model) {
		
		// 삭제를 눌러야지 값이 뜬다. 
//		System.out.println("replyNo : " +replyNo);
//		System.out.println("reviewNo : " +reviewNo);
		
		ReviewReply r = new ReviewReply();

		r.setReplyNo(replyNo);
		r.setReviewNo(reviewNo);
//		System.out.println("r : "+ r);
		
		if(boardService.deleteReviewReply(r) > 0) {
			
			return "redirect:detail.re?reviewNo=" + reviewNo;
			
		} else {
			// 에러페이지
			model.addAttribute("errorMsg", "댓글삭제실패");
			return "common/errorPage";
		}
	}
	
	

	// 안만들었음 => 수정버튼 클릭시 돌아가는거
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

	
	// 댓글 수정 (사용안함 지우자)
//	@ResponseBody
//	@RequestMapping(value = "formReply.re", produces = "application/json; charset=UTF-8")
//	public String reviewFormReply(ReviewReply r, HttpSession session) {
//		// 스프링이 알아서 값을 가져와서 setㅎㅐ줌
//		
//		
//		
//		return null;
//	}
	
	
	// 댓글 찐 수정
	
	
	
	
	
	// "text/html; charset=UTF-8"
	// "application/json; charset=UTF-8"
	// 댓글작성
	@ResponseBody
	@RequestMapping(value = "rInsert.re", produces = "text/html; charset=UTF-8")
	public String insertReviewReply(int reviewNo, String replyContent, HttpSession session) {
		
		
		ReviewReply r = new ReviewReply();
		r.setReviewNo(reviewNo);
		r.setReplyContent(replyContent);
		//r.setUserNo(userNo);
		r.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		
		System.out.println("r의정보 :" + r);
		
		
		if(boardService.insertReviewReply(r) > 0) {
			return "1";
			//응답데이터가 많을 때 gson/json을 쓴다=>나는 1만 보내주면 되니까 이렇게 작성하면 된다
		} else {
			session.setAttribute("alertMsg", "댓글 작성할 수 없습니다");
			return "redirect:detail.re?reviewNo=" + reviewNo;
		}
		
		
	}
	
	
	
	
}

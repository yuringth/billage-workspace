package com.bi.billage.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

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
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.template.Pagination;

@Controller
public class ReviewController {

	@Autowired
	private BoardService boardService;

	
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
	public String insertReviewBoard(ReviewBoard b,  Model model) {
		
		System.out.println("리뷰보드 : " + b);
		System.out.println("model : " + model);
		
		// 1) 책 중복되는지 확인 select
		if(boardService.selectBookTitle(b) == null) {
		
			
			// 2) 중복 된 책 없으면 insert
			boardService.insertReviewBoard(b);
			
			//return "board/reviewBoard/reviewListView";
			return "redirect:list.re";
			
		} else {
			
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
		}
		
	}
	
	
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
	

	
	// 리뷰게시판 => 글삭제
	@RequestMapping("delete.re")
	public String deleteReviewBoard(int reviewNo) {
		
		boardService.deleteReviewBoard(reviewNo);
		
		return "redirect:list.re";
		// 왜 포워딩으로 보내면 안되는거지?? db에 들려서 status를 'Y'로 고쳐서 그런가??		
	}
	
	
	
	// 리뷰게시판 -> 글수정 누를 시 -> 수정폼 화면 나옴
	@RequestMapping("enrollForm.re")
	public ModelAndView reviewEnrollForm(int reviewNo, ModelAndView mv) {
		mv.addObject("b", boardService.selectReviewBoard(reviewNo)).setViewName("board/reviewBoard/reviewUploadForm");
		System.out.println(mv);
		System.out.println(reviewNo);
		return mv;
	}
	
	
	// 리뷰게시판 => 글 수정
	@RequestMapping("updateReview.re")
	public String updateReviewBoard(ReviewBoard b, Model model) {
	
		// System.out.println(b);
		
		
		// 1) 책 중복되는지 확인 select
		// 글만 수정 안됨,,, 수정해야한다!!!
		if(boardService.selectBookTitle(b) == null) {
		
			
			// 2) 중복 된 책 없으면 insert
			boardService.updateReviewBoard(b);
			
			return "redirect:detail.re?reviewNo=" + b.getReviewNo();
			
		} else {
			
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
		}
		
		
		
		/* 글만 수정 가능
		if(boardService.updateReviewBoard(b) > 0 ) { // 수정 성공 시
			return "redirect:detail.re?reviewNo=" + b.getReviewNo();
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
		*/
	
	}
	
	
	
	
	
}

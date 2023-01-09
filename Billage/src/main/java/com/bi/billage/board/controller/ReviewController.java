package com.bi.billage.board.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	private static final String serviceKey="ttbiuui12341246001";

	
	
	// 리뷰게시판 목록 조회 화면
	@RequestMapping("list.re")
	public String reviewBoardList() {
		return "board/reviewBoard/reviewListView";
	}
	
	
	// 리뷰게시판 -> 글쓰기버튼 클릭 시 -> 리뷰게시판 글작성 폼화면으로 이동
	@RequestMapping("insert.re")
	public String reviewInsertForm() {
		return "board/reviewBoard/reviewEnrollForm";
	}
	
	
	// 리뷰게시판 -> 게시글 상세보기 
	@RequestMapping("detail.re")
	public String reviewDetail() {
		return "board/reviewBoard/reviewDetailView";
	}
	
	
	// 리뷰게시판 -> 상품 검색 api 페이지 나옴
	@RequestMapping("search.re")
	public String reviewSearchForm() {
		return "board/reviewBoard/reviewSearchView";
	}
	
	
	// 리뷰게시판 -> 글수정 누를 시 -> 수정폼 화면 나옴
	@RequestMapping("enrollForm.re")
	public String reviewEnrollForm() {
		return "board/reviewBoard/reviewUploadForm";
	}
	
	
	
	
	
	
	
	// api도전
	/*
	@RequestMapping(value="taste.do", produces="application/json; charset=UTF-8")
	public String reviewApi () {
		
		// url은 손으로 한땀한땀 작성하는게 좋다
		// 인증서 => 브라우저에 있음 => 우리는 http로 작성할것임! https안됨!!
		String url ="http://www.aladin.co.kr/ttb/api/ItemList.aspx";
		url += "?serviceKey=" + serviceKey;
		url += "&MaxResults=" + 10;
		url += "&Output=json"; // json이니까 produces추가해야함!!
		url += "&pageNo=" + page;
			   
			   
		// System.out.println(url);
		
	    URL requestUrl = new URL(url); // 부모클래스(?)
	    HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection(); // 부모가 자식한테 어케 들어가 하고 다운캐스팉 해주기
	    urlConnection.setRequestMethod("GET");
	    
	    BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
	    
	    String responseText = br.readLine();
	    
	    br.close();//버퍼더리더 반납
	    urlConnection.disconnect(); // 뭐지?
	    
	    return responseText; // 응답데이터임!! 	@ResponseBody
	    
		
		
	}
	*/
	
	
	
	
	
}

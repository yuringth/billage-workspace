package com.bi.billage.board.controller;

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

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.UsedBoard;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.common.template.Pagination;
import com.google.gson.Gson;

@Controller
public class UsedController {
	
	
	@Autowired // 2. 객체를 bean으로 등록해줌
	private BoardService boardService; // 1. 의존성 주입
	

	// 중고게시판 목록 조회 화면
	@RequestMapping("list.ud") 
	public ModelAndView usedBoardList(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectListUsedCount(), currentPage, 10, 3);
		
		// System.out.println(currentPage);
		// System.out.println("pi : " + pi);
		
		/*
		 * ArrayList<UsedBoard> list = boardService.usedBoardList(pi); 
		 * for(UsedBoard l : list) { System.out.println("리스트 :" +l);
		 * 
		 * }
		 */
		
//		키 == 밸류
		mv.addObject("pi", pi).addObject("list", boardService.usedBoardList(pi)).setViewName("board/usedBoard/usedListView");
//		System.out.println(mv); // list가 안담김
		// ModelAndView는 메소드체인이 가능해서 코드의 길이가 짧아진다 => 그래서 String으로 사용했을 때 보다 좋다
		return mv;
//		클라이언트의 요청에 응답을 해주는 것
		
	}
	
	/*
	@RequestMapping("list.ud")
	public String usedBoardList() {
		
		
		boardService.usedBoardList();
		
		return "board/usedBoard/usedListView";
	}
	*/
	
	// 중고게시판 -> 글쓰기버튼 클릭 시 -> 중고게시판 글작성 폼화면으로 이동
	@RequestMapping("insert.ud")
	public String usedInsertForm() {
		return "board/usedBoard/usedEnrollForm";
	}
	
	
	// 중고게시판 => 글작성
	@RequestMapping("upload.ud")
	public String insertUsedBoard(UsedBoard b, MultipartFile upfile,  HttpSession session, Model model) {
		
//		System.out.println("중고게시판 : " + b);
//		System.out.println(upfile);
		
		if(!upfile.getOriginalFilename().equals("")) { // => 파일이 있을 경우. //getOriginalFilename == filename필드의 값을 반환함
			
			//saveFile(upfile, session); //=> changeName => 이게 왜???????????????
			String changeName = SaveFile.getSaveFile(upfile, session);
			b.setOriginName(upfile.getOriginalFilename()); // 원본명
			b.setChangeName(changeName); // 저장경로(경로+changeName)
		}
		

		// case1. 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// case2. 넘어온 첨부파일이 있는 경우 b : 제목, 작성자, 내용 + 파일원본명, 파일저장경로
		if(boardService.insertUsedBoard(b) > 0) { // 성공 => 게시글 리스트 페이지
			
//			System.out.println("성공 시 b의 리스트 : " + b);
			session.setAttribute("alertMsg", "게시글등록성공");
			// return "reviewBoard/reviewListView"; 
			// => 안됨. list를 가져오지 않았기때문임 => db에 들려서 list를 조회해서 가져와야함. 즉 sendRedirect사용해야함
			return "redirect:list.ud";
			
		} else { // 실패 => 에러페이지
			model.addAttribute("errorMsg","게시글 작성에 실패함 ㅠ");
			return "common/errorPage";
		}
	
	}
	
	
	
	
	
	
	// 중고게시판 -> 글 상세정보 조회 
	@RequestMapping("detail.ud")
	public String usedDetailView(int usedNo, Model model) {
		// 식별값으로 usedNo가져옴
//		System.out.println(usedNo);
		
		// 1) 조회수 증가
		if(boardService.increaseUsedCount(usedNo) > 0) {
			
			// 2) db에서 정보 들고 와서 뿌려주기
			UsedBoard b = boardService.selectUsedBoard(usedNo);
			
			//System.out.println("게시판 디테일 정보:"+b);
			
			model.addAttribute("b", b);
			
			return "board/usedBoard/usedDetailView";
			
		} else {
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
		}
	}
	
	
	//중고게시판 => 게시글 삭제 
	@RequestMapping("delete.ud")
	public String deleteUsedBoard(int usedNo, Model model) {
		
		if(boardService.deleteUsedBoard(usedNo) > 0) {
			return "redirect:list.ud";
		} else {
			model.addAttribute("errorMsg","게시글 상세조회 실패");
			return "common/errorPage";
		}
	}
	
	
	
	// 중고게시판 -> 글수정 버튼 클릭시 -> 수정폼 화면뜨면서 기존 데이터 가져오기
	@RequestMapping("enrollUsedForm.ud")
	public ModelAndView selectUpdateUsedBoard(int usedNo, ModelAndView mv) {
		
		// 게시판 번호를 식별자로 DB에서 select해옴
		// boardService.selectUpdateUsedBoard(usedNo);
		mv.addObject("b", boardService.selectUpdateUsedBoard(usedNo)).setViewName("board/usedBoard/usedUploadForm");
		
		// mv.addObject("data", "12341234"); // 뷰로 보낼 데이터 값
		// mv.setViewName("/board/content"); // 뷰의 이름
		
		return mv;

	}
	
	
	// 중고게시판 -> 글수정 버튼 눌렀을때
	@RequestMapping("update.ud")
	public String usedUpdate(UsedBoard b, MultipartFile reUpfile, HttpSession session, Model model) {
		
		System.out.println("db갔다오지 않은 b의 값 : " + b);
		System.out.println("reUpfile : " + reUpfile);
		
		// 2. 새로 첨부된 파일x, 기존 첨부파일 o  내용만 수정 => origin : 기존 첨부파일 이름, change : 기존첨부파일 경로
		// 3. 새로 첨부된 파일o, 기존 첨부파일 x 파일첨부 변경 시 => origin : 새로 첨부파일 이름, change : 새로 첨부파일 경로

		
		
/* 배우지않았다!!!!!!!!!!!!!!!!!1
		// 새로 첨부파일이 넘어온 경우 
		if(!reUpfile.getOriginalFilename().equals("")) {
			// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일을 삭제
			
			// 히든으로 오리진네임을 넘겼으니까 board에 setter 주입되서 들어가있을것임
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			
			// 새로 넘어온 첨부파일 서버에 업로드 시키기
			// saveFile() 호출해서 첨부파일 업로드
			String changeName = saveFile(reUpfile, session);
			
			// 첨부파일에 새로 업로드를 했으니, b라는 Board객체에 새로운정보(원본명, 저장경로) 담기
			b.setOriginName(reUpfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);
		}
*/
		
		
		if(boardService.usedUpdate(b) > 0) {
			System.out.println("sql다녀와서 컨트롤러" + b);
			return "redirect:detail.ud?usedNo=" + b.getUsedNo();
		} else {
			model.addAttribute("errorMsg","게시글 수정 실패");
			return "common/errorPage";
		}
		
		
	}
	
	
	
	
	// 중고게시판 => topn분석
	@ResponseBody
	@RequestMapping(value = "topList.ud", produces = "application/json; charset=UTF-8")
	public String ajaxTopUsedList() {
		return new Gson().toJson(boardService.selectTopUsed());
	}
	
	
	// 중고게시판 => 검색기능
	@RequestMapping("searchForm.ud")
	public String searchUsedList(String condition, String keyword, Model model) {
		//@RequestParam(value="currentPage", defaultValue="1") 

		HashMap<String, String> map = new HashMap();
		map.put("condition", condition); // key는 value : "nickname", "bookTitle", "usedContent"
		map.put("keyword", keyword); // "사용자가 입력한 키워드"
		
//		System.out.println("컨디션"+condition);
//		System.out.println("키워드"+keyword);
		
		// 페이징처리
		int searchCount = boardService.selectSearchCount(map);  // 현재 검색 결과에 맞는 게시글의 총 개수 => db가서 조회
		
//		System.out.println("게시글 총 수:"+ searchCount);
		
		int currentPage = 1; // 현재페이지의 값을 가져오기
		
//		System.out.println("1:"+ currentPage);
		
//		int currentPage = RequestParam(value="cPage", defaultValue="1"); // 현재페이지의 값을 가져오기
//		int currentPage = Integer.parseInt(request.getParameter("cPage"));
		int pageLimit = 10;
//		System.out.println("pageLimit"+pageLimit);
		
		int boardLimit = 5;
//		System.out.println("boardLimit" +boardLimit);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit,boardLimit);
//		System.out.println("페이지 잘 가져오는지 확인 : " + pi);
		
		
		// 검색한 결과를 뿌려주는거...select해서 가져오는데 몇개있는지 모르니 arrayList로 뿌리기
		ArrayList<UsedBoard> list = boardService.selectSearchList(map, pi);
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "board/usedBoard/usedListView";
	}
	
	
	
	
	
	
	
	
	
	
}

package com.bi.billage.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.UsedBoard;

@Controller
public class UsedController {
	
	
	@Autowired // 2. 객체를 bean으로 등록해줌
	private BoardService boardService; // 1. 의존성 주입
	

	// 중고게시판 목록 조회 화면
	@RequestMapping("list.ud")
	public String usedBoardList() {
		return "board/usedBoard/usedListView";
	}
	
	
	// 중고게시판 -> 글쓰기버튼 클릭 시 -> 중고게시판 글작성 폼화면으로 이동
	@RequestMapping("insert.ud")
	public String usedInsertForm() {
		return "board/usedBoard/usedEnrollForm";
	}
	
	
	// 글작성
	@RequestMapping("upload.ud")
	public String insertUsedBoard(UsedBoard b, MultipartFile upfile,  HttpSession session, Model model) {
		System.out.println(b);
		System.out.println(upfile);
		
		if(!upfile.getOriginalFilename().equals("")) { // => 파일이 있을 경우. //getOriginalFilename == filename필드의 값을 반환함
			
			/*
			// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" => 20221238123123.png)
			String originName = upfile.getOriginalFilename();
			
			// "20221226104430"(년월일시분초)
			// Date import => util
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // new Date():오늘날짜
			// 12321(5자리 랜덤값)
			int ranNum = (int)(Math.random() * 90000 + 10000);
			// 확장자 땡겨오기
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
			// 업로드 시키고자하는 폴더의 물리적인 경로 알아내기 session.getServletContext() == application
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			try {
				// transferTo() : 서버에 파일을 업로드해주는 메소드
				// 무조건 File 객체를 만들어야함
				// 파일경로+변경된이름을 가지고 서버에 파일을 업로드 하겠다
				upfile.transferTo(new File(savePath + changeName)); // 경로 + 파일명 => 경로가 존재 안할수도있기에 예외처리
			} catch (IOException e) {
				e.printStackTrace();
			} 
			// 이렇게하면 파일이 잘 올라감
			// 근데 맘에 안드는게 생김 => Template으로 만들어서 공유하는게 좋다
			 */
			
			//saveFile(upfile, session); //=> changeName => 이게 왜???????????????
			b.setOriginName(upfile.getOriginalFilename()); // 원본명
			b.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로(경로+changeName)
			
			
		}
		

		// case1. 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// case2. 넘어온 첨부파일이 있는 경우 b : 제목, 작성자, 내용 + 파일원본명, 파일저장경로
		if(boardService.insertUsedBoard(b) > 0) { // 성공 => 게시글 리스트 페이지
			
			session.setAttribute("alertMsg", "게시글등록성공");
			// return "reviewBoard/reviewListView"; 
			// => 안됨. list를 가져오지 않았기때문임 => db에 들려서 list를 조회해서 가져와야함. 즉 sendRedirect사용해야함
			return "redirect:list.ud";
			
		} else { // 실패 => 에러페이지
			model.addAttribute("errorMsg","게시글 작성에 실패함 ㅠ");
			return "common/errorPage";
		}
	
	}
	

	// 첨부파일 공용으로 사용
	// @ 요청 받지 않은 것도 메소드로 사용가능하다는 것을 보여줌
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드까지
		
		// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" => 20221238123123.png)
		String originName = upfile.getOriginalFilename();
		
		// "20221226104430"(년월일시분초)
		// Date import => util
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 12321(5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 확장자 땡겨오기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			// transferTo() : 서버에 파일을 업로드해주는 메소드
			upfile.transferTo(new File(savePath + changeName)); // 경로 + 파일명 => 경로가 존재 안할수도있기에 예외처리
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		return changeName; // 갑자기 이걸 왜 반환함??????????????????????????????????????????????????
		
	}
	
	
	
	
	
	
	
	// 중고게시판 -> 글 상세정보 조회 
	@RequestMapping("detail.ud")
	public String usedDetailView() {
		return "board/usedBoard/usedDetailView";
	}
	
	// 중고게시판 -> 글수정 -> 수정폼 화면
	@RequestMapping("update.ud")
	public String usedUpdateForm() {
		return "board/usedBoard/usedUploadForm";
	}
	
	
}

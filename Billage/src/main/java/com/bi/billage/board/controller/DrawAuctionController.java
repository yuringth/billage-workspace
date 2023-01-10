package com.bi.billage.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.ADBoard;

import javafx.scene.chart.PieChart.Data;

@Controller
public class DrawAuctionController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.dr")
	public ModelAndView drawBoardList(ModelAndView mv) throws ParseException {
		
		ArrayList<ADBoard> list = boardService.selectDrawBoardList();
		
		//날짜 형식
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 현재 시간
		Date date = new Date();
		//남은 시간 넣을 곳
		String remaindTime = "";
		
		for(int i = 0; i < list.size(); i++) {
			// Db에서 가져온 값을 Date타입으로 바꾼다
			Date setDate = format.parse(list.get(i).getCloseDate());
			// 마감시간 - 현재시간
			long closeTime = setDate.getTime() - date.getTime();
			// 남은 시간을 초단위로 바꾼다
			int sec = (int)(closeTime / 1000);
			
			int day = sec / (60 * 60 * 24);
			int hour = (sec - day * 60 * 60 * 24) / (60 * 60); 
			int minute = (sec - day * 60 * 60 * 24 - hour * 3600) / 60; 
			int second = sec % 60;
			
			
			if(closeTime / (1000*24*60*60) > 1) { //하루 넘게 남았을 때
				remaindTime = day + "일 " + hour + ":" + minute  + ":" + second;	
				
			} else { // 하루도 안 남았을 때
				remaindTime = hour + ":" + minute  + ":" + second;
			}
			list.get(i).setRemaindTime(remaindTime);
		}
		mv.addObject("list", list).setViewName("board/drawBoard/drawBoardListView");
		return mv;
	}
	
	
	@RequestMapping("list.ac")
	public ModelAndView auctionBoardList(ModelAndView mv) {
		mv.addObject("list", boardService.selectAuctionBoardList()).setViewName("board/auctionBoard/auctionBoardListView");
		return mv;
	}
	
	@RequestMapping("enrollForm.dr")
	public String drawEnrollForm() {
		return "board/drawBoard/drawBoardEnrollForm";
	}
	
	@RequestMapping("enrollForm.ac")
	public String auctionEnrollForm() {
		return "board/auctionBoard/auctionBoardEnrollForm";
	}
	
	@RequestMapping("detail.dr")
	public ModelAndView drawDetailView(int bno, ModelAndView mv) throws ParseException {
		
		if(boardService.drawIncreaseCount(bno) > 0) {
			ADBoard b =  boardService.selectDrawBoard(bno);
			//날짜 형식
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// 현재 시간
			Date date = new Date();
			//남은 시간 넣을 곳
			String remaindTime = "";
			
			// Db에서 가져온 값을 Date타입으로 바꾼다
			Date setDate = format.parse(b.getCloseDate());
			// 마감시간 - 현재시간
			long closeTime = setDate.getTime() - date.getTime();
			// 남은 시간을 초단위로 바꾼다
			int sec = (int)(closeTime / 1000);
			
			int day = sec / (60 * 60 * 24);
			int hour = (sec - day * 60 * 60 * 24) / (60 * 60); 
			int minute = (sec - day * 60 * 60 * 24 - hour * 3600) / 60; 
			int second = sec % 60;
			
			
			if(closeTime / (1000*24*60*60) > 1) { //하루 넘게 남았을 때
				remaindTime = day + "일 " + hour + ":" + minute  + ":" + second;	
				
			} else { // 하루도 안 남았을 때
				remaindTime = hour + ":" + minute  + ":" + second;
			}
			b.setRemaindTime(remaindTime);
			mv.addObject("b",b).setViewName("board/drawBoard/drawDetailView");
			
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}

	@RequestMapping("detail.ac")
	public ModelAndView auctionDetailView(int bno, ModelAndView mv) {
		if(boardService.auctionIncreaseCount(bno) > 0) {
			mv.addObject("b", boardService.selectAuctionBoard(bno)).setViewName("board/drawBoard/auctionDetailView");
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("insert.dr")
	public String insertDrawBoard(ADBoard b, MultipartFile upFile, HttpSession session, Model model) {
		
		//날짜 합치기
		b.setCloseDate(b.getCloseDate() + " " + b.getCloseTime() + ":00");
		 
		if(!upFile.getOriginalFilename().equals("")) { // getOriginalFileName == filename필드의 값을 반환함
			
			/*
			
			// 파일명 수정 작업 후 서버에 업로드 시키기("image.png" =. 202212123141.png)
			// "20221226103530" (년월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String originName = upfile.getOriginalFilename();
			
			// 12321(5자리 랜덤값)
			int ranNum = (int)(Math.random()*90000 + 10000);
			
			// 확장자
			String ext = originName.substring(originName.lastIndexOf(".")); // 마지막 .을 기준으로 뒤에만 자르겠다
			
			String changeName = currentTime + ranNum + ext; //변경된 파일 이름
			
			// 업로드시키고자하는 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
			
			try {
				upfile.transferTo(new File(savePath + changeName)); //서버에 파일을 업로드 해주는 메소드 파일경로랑 이름을 적어야한다 (실질적으로 업로드 하는 녀석)
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			*/
			
			
			b.setOriginName(upFile.getOriginalFilename()); //원본명
			b.setChangeName("resources/uploadFiles/" + saveFile(upFile, session));
			
		} 
		// 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// 넘어온 첨부파일이 있는 경우 b : 제목, 작성자, 내용 + 파일 원본명, 파일 저장경로

		if(boardService.insertDrawBoard(b) > 0) { //성공 => 게시글 리스트 페이지
			//포워딩 => boardListView.jsp => 리스트를 안불러와서 리다이렉트를 해야함
			return "redirect:list.dr";
		} else {
			model.addAttribute("errorMsg", "게시글 작성에 실패했어용 ㅠ");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insert.ac")
	public String insertAuctionBoard(ADBoard b, MultipartFile upFile, HttpSession session, Model model) {
		
		if(!upFile.getOriginalFilename().equals("")) {
			b.setOriginName(upFile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + saveFile(upFile, session));
		} 
		
		if(boardService.insertAuctionBoard(b) > 0) {
			return "redirect:list.ac";
		} else {
			model.addAttribute("errorMsg", "게시글 작성에 실패했어용 ㅠ");
			return "common/errorPage";
		}
	}
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
		
		// 파일명 수정 작업 후 서버에 업로드 시키기("image.png" =. 202212123141.png)
		// "20221226103530" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String originName = upfile.getOriginalFilename();
		
		// 12321(5자리 랜덤값)
		int ranNum = (int)(Math.random()*90000 + 10000);
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf(".")); // 마지막 .을 기준으로 뒤에만 자르겠다
		
		String changeName = currentTime + ranNum + ext; //변경된 파일 이름
		
		// 업로드시키고자하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName)); //서버에 파일을 업로드 해주는 메소드 파일경로랑 이름을 적어야한다 (실질적으로 업로드 하는 녀석)
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	@RequestMapping("delete.dr")
	public String deleteDraw(int boardNo, HttpSession session, ModelAndView mv, String changeName) {
		if(boardService.deleteDrawBoard(boardNo) > 0) {
			if(!changeName.equals("")) {// 만약에 첨부파일이 존재했을 경우
				// 기존에 존재하는 첨부파일을 삭제
				// resources/xxxx/xxxx.jps 요걸 찾으려면
				new File(session.getServletContext().getRealPath(changeName)).delete();
			}
			return "redirect:list.dr";
		} else {
			mv.addObject("errorMsg", "게시글 작성에 실패했어용 ㅠ");
			return "common/errorPage";
		}
		
	}
	@RequestMapping("delete.ac")
	public String deleteAuction(int boardNo, HttpSession session, ModelAndView mv, String changeName) {
		if(boardService.deleteAuctionBoard(boardNo) > 0) {
			if(!changeName.equals("")) {
				new File(session.getServletContext().getRealPath(changeName)).delete();
			}
			return "redirect:list.dr";
		} else {
			mv.addObject("errorMsg", "게시글 작성에 실패했어용 ㅠ");
			return "common/errorPage";
		}
		
	}
	
}

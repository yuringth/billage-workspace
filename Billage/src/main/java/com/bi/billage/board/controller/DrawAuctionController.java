package com.bi.billage.board.controller;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.message.model.service.MessageService;
import com.bi.billage.message.model.vo.Message;
import com.bi.billage.point.model.service.PointService;
import com.bi.billage.point.model.vo.Point;
import com.bi.billage.user.model.service.UserService;
import com.bi.billage.user.model.vo.User;
import com.google.gson.Gson;

@Controller
public class DrawAuctionController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PointService pointService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageService messageService;
	
	//추첨글목록
	@RequestMapping("list.dr")
	public ModelAndView drawBoardList(ModelAndView mv) throws ParseException {
		mv.addObject("list", boardService.selectDrawBoardList()).setViewName("board/drawBoard/drawBoardListView");
		return mv;
	}
	
	//경매글목록
	@RequestMapping("list.ac")
	public ModelAndView auctionBoardList(ModelAndView mv) {
		mv.addObject("list", boardService.selectAuctionBoardList()).setViewName("board/auctionBoard/auctionBoardListView");
		return mv;
	}
	
	//추첨글작성폼
	@RequestMapping("enrollForm.dr")
	public String drawEnrollForm() {
		return "board/drawBoard/drawBoardEnrollForm";
	}
	
	//경매글작성폼
	@RequestMapping("enrollForm.ac")
	public String auctionEnrollForm() {
		return "board/auctionBoard/auctionBoardEnrollForm";
	}
	
	//추첨글상세보기
	@RequestMapping("detail.dr")
	public ModelAndView drawDetailView(int bno, ModelAndView mv) throws ParseException {
		
		if(boardService.drawIncreaseCount(bno) > 0) {
			mv.addObject("b",boardService.selectDrawBoard(bno)).setViewName("board/drawBoard/drawDetailView");
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//경매글상세보기
	@RequestMapping("detail.ac")
	public ModelAndView auctionDetailView(int bno, ModelAndView mv) {
		if(boardService.auctionIncreaseCount(bno) > 0) {
			mv.addObject("b", boardService.selectAuctionBoard(bno)).setViewName("board/auctionBoard/auctionDetailView");
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//추첨글등록
	@RequestMapping("insert.dr")
	public String insertDrawBoard(ADBoard b, MultipartFile upFile, HttpSession session, Model model) {
		
		//날짜 합치기
		b.setCloseDate(b.getCloseDate() + " " + b.getCloseTime() + ":00");
		 
		if(!upFile.getOriginalFilename().equals("")) { // getOriginalFileName == filename필드의 값을 반환함
			String changeName = SaveFile.getSaveFile(upFile, session);
			b.setOriginName(upFile.getOriginalFilename()); //원본명
			b.setChangeName(changeName);
			
		} 
		// 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// 넘어온 첨부파일이 있는 경우 b : 제목, 작성자, 내용 + 파일 원본명, 파일 저장경로

		if(boardService.insertDrawBoard(b) > 0) { //성공 => 게시글 리스트 페이지
			
			//1. 작성한 글 세션에 +1 하기
			((User)session.getAttribute("loginUser"))
			.setBoardCount(((User)session.getAttribute("loginUser")).getBoardCount() + 1);
			
			//2. 등급 별로 조건 넘어가면 등급 +1 하기
			
			//등급이 3일때
			if(((User)session.getAttribute("loginUser")).getUserGrade() == 3) {
				
				if(((User)session.getAttribute("loginUser")).getBoardCount() >= 10){
					
					//등급 +1 하는 메소드
					userService.updateGrade(((User)session.getAttribute("loginUser")).getUserNo());
					
					//등급 +1 하고 세션에 업데이트 된 등급 넣기
					((User)session.getAttribute("loginUser"))
					.setUserGrade(((User)session.getAttribute("loginUser")).getUserGrade() + 1);
					
					
					// 여기에 alertMessage 축하합니다 등급이 ~등급으로 올랐습니다 세션 하실분 하세요
					return "redirect:list.dr";
				}
				
			}
			//등급이 4일때
			if(((User)session.getAttribute("loginUser")).getUserGrade() == 4) {
				
				if(((User)session.getAttribute("loginUser")).getBoardCount() >= 30){
					
					//등급 +1 하는 메소드
					userService.updateGrade(((User)session.getAttribute("loginUser")).getUserNo());
					
					//등급 +1 하고 세션에 업데이트 된 등급 넣기
					((User)session.getAttribute("loginUser"))
					.setUserGrade(((User)session.getAttribute("loginUser")).getUserGrade() + 1);
					
					
					// 여기에 alertMessage 축하합니다 등급이 ~등급으로 올랐습니다 세션 하실분 하세요
					return "redirect:list.dr";
				}
				
			}
				//포워딩 => boardListView.jsp => 리스트를 안불러와서 리다이렉트를 해야함
				return "redirect:list.dr";
			
		} else {
			model.addAttribute("errorMsg", "게시글 작성에 실패했어용 ㅠ");
			return "common/errorPage";
		}
	}
	//경매글등록
	@RequestMapping("insert.ac")
	public String insertAuctionBoard(ADBoard b, MultipartFile upFile, HttpSession session, Model model) {
		
		b.setCloseDate(b.getCloseDate() + " " + b.getCloseTime() + ":00");
		
		if(!upFile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.getSaveFile(upFile, session);
			b.setOriginName(upFile.getOriginalFilename());
			b.setChangeName(changeName);
		} 
		
		if(boardService.insertAuctionBoard(b) > 0) {
			
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
					return "redirect:list.dr";
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
					return "redirect:list.dr";
				}
			}
			
			return "redirect:list.ac";
			
		} else {
			model.addAttribute("errorMsg", "게시글 작성에 실패했어용 ㅠ");
			return "common/errorPage";
		}
	}
	
	//추첨글삭제
	@RequestMapping("delete.dr")
	public String deleteDraw(int boardNo, HttpSession session, ModelAndView mv, String changeName) {
		//먼저 추첨신청한 사람이 있는지 확인 후 없으면 진행
		//if(){
		//
		//	return "redirect:detail.dr";
		//} else {
		if(boardService.deleteDrawBoard(boardNo) > 0) {
			// 기존에 존재하는 첨부파일을 삭제
			// resources/xxxx/xxxx.jps 요걸 찾으려면
			new File(session.getServletContext().getRealPath(changeName)).delete();
			return "redirect:list.dr";
		} else {
			mv.addObject("errorMsg", "게시글 삭제에 실패했어용 ㅠ");
			return "common/errorPage";
		}
			
		//}
		
	}
	
	//경매글삭제
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
	
	//추첨신청
	@RequestMapping("draw.dr")
	public String insertDrawUser(ADBoard b, HttpSession session, ModelAndView mv){
		
		//로그인 한 유저의 포인트 조회
		int point = ((User)session.getAttribute("loginUser")).getPoint();

		Point p = new Point();
		//응모포인트만큼 현재 포인트에서 차감
		p.setUserNo(b.getUserNo());
		p.setPointAdd(-1 * b.getTryPoint());
		p.setPointStatus("사용");
		
		if(pointService.addPoint(p) * boardService.insertDrawUser(b) > 0) {
			// 포인트 차감, 추첨 등록 성공
			((User)session.getAttribute("loginUser")).setPoint(point - b.getTryPoint());
//			System.out.println("응모 성공, 남은 포인트 :" + ((User)session.getAttribute("loginUser")).getPoint());
			return "redirect:detail.dr?bno=" + b.getBoardNo();
		} else { //뭐든 실패
			mv.addObject("errorMsg", "응모 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("cancel.dr")
	public String deleteDrawUser(ADBoard b, HttpSession session, ModelAndView mv) {
		Point p = new Point();
		
		int point = ((User)session.getAttribute("loginUser")).getPoint();
		
		//응모포인트만큼 현재 포인트에서 차감
		p.setUserNo(b.getUserNo());
		p.setPointAdd( b.getTryPoint());
		p.setPointStatus("취소");
		
		if(pointService.addPoint(p) * boardService.deleteDrawUser(b) > 0) {
			// 포인트 환불, 추첨 취소 성공
			((User)session.getAttribute("loginUser")).setPoint(point + b.getTryPoint());

			return "redirect:detail.dr?bno=" + b.getBoardNo();
		} else {//뭐든 실패
			mv.addObject("errorMsg", "취소 실패");
			return "common/errorPage";
		}
	}
	
	// 추첨신청여부에 따라서 버튼 바꾸는 녀석
	@ResponseBody
	@RequestMapping(value="checkDraw.dr", produces="appliction/json; charset=UTF-8")
	public String checkDraw(ADBoard b, HttpSession session){
		b.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		return new Gson().toJson(boardService.checkDraw(b));
	}
	//당첨자 
	@ResponseBody
	@RequestMapping(value="prize.dr", produces="appliction/json; charset=UTF-8")
	public String selectPrizeUser(ADBoard a, HttpSession session){
		
		//추첨자 리스트 가져오기
		ArrayList<Integer> list = boardService.selectPrizeUser(a.getBoardNo());
		
		// 추첨자 리스트에서 랜덤으로 하나 선정, 신청자가 있을 경우에만 실행
		ADBoard b = new ADBoard();
		
		if(list.size() > 0) {
			
			int userNo = 0;

			// 10보다 큰 수면 그냥 랜덤값을 뽑는다
			if(list.size() >= 10) {
				userNo = list.get((int)Math.random() * list.size());
			} else { // 10보다 작으면 계속 0이 나오기 때문에 0~10까지 구한 후에 list.size()보다 큰 값이 나오면 작은 값이 나올때까지 반복한다
				
				int rNo = (int)(Math.random() * 10);
				
				while(rNo >= list.size()) {
					rNo = (int)(Math.random() * 10);
				};
				
				userNo = list.get(rNo);
			};
			
			b.setUserNo(userNo);
			b.setBoardNo(a.getBoardNo());
			// 보드테이블의 당첨자 컬럼에  당첨자 회원번호 입력 
			boardService.insertPrizeUser(b);
			
			
			b = boardService.selectDrawBoard(a.getBoardNo());
			
			// 쪽지 보내기, 조회한 값 반환하기 위해 변수에 넣는다
			Message m = new Message();
			// 1. 당첨자에게 쪽지 보내기
			m.setUserNo(1); //보낸 사람은 관리자
			m.setUserNo2(b.getPrizeUserNo()); //받는 사람은 당첨자
			m.setMessageContent("축하드립니다!\r\n" + 
					" " + a.getTitle() + "의 추첨 결과 당첨되셨습니다.\r\n" + 
					"주소를 확인해 주세요");
			messageService.insertMessage(m);
			// 2. 글 쓴 사람한테 쪽지 보내기
			m.setUserNo2(a.getUserNo()); //받는 사람은 게시글 작성자
			m.setMessageContent( a.getTitle() + "의 추첨 결과가 발표되었습니다.\r\n" + 
					"상품을 저희측으로 보내주시면 포인트 정산해서 적립해드리겠습니다. (생략)");
			messageService.insertMessage(m);
			
			
			// 적립된 포인트를 조회해와서 글 쓴 사람한테 insert
			if(a.getTryPoint() != 0) { //무료추첨이 아닌 경우에만 실행
				
				// 총 적립된 포인트 조회해와서 포인트 적립하기
				Point p = new Point();
				p.setPointAdd(boardService.selectDrawPoint(a.getBoardNo()));
				p.setUserNo(a.getUserNo());
				p.setPointStatus("적립");
				pointService.addPoint(p);
				
				
			}
		}
		
		return new Gson().toJson(b);
	}
	
	
	// 입찰
	@ResponseBody
	@RequestMapping(value="bid.ac", produces="appliction/json; charset=UTF-8")
	public String isnertBidUser(ADBoard b, HttpSession session) {
		
		b.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		int point = ((User)session.getAttribute("loginUser")).getPoint();

		if(boardService.insertBidUser(b) * boardService.updatePrizeUser(b) > 0) {
			Point p = new Point();
			//기존의 입찰자 포인트 환불
			if(b.getPrizeUserNo() != 0) {
				p.setPointAdd(b.getNowPrice());
				p.setUserNo(b.getPrizeUserNo());
				p.setPointStatus("취소");
				
				pointService.addPoint(p);
				
			}
			// 새로운 입찰자 포인트 차감
			p.setPointAdd(-1 * b.getBidPrice());
			p.setUserNo(b.getUserNo());
			p.setPointStatus("사용");
			
			((User)session.getAttribute("loginUser")).setPoint(point - b.getBidPrice());
			pointService.addPoint(p);

			
			
			b = boardService.selectAuctionBoard(b.getBoardNo());
		}
		
		return  new Gson().toJson(b);
	}
	
	
	// 즉시구매
	@ResponseBody
	@RequestMapping(value="buy.ac", produces="appliction/json; charset=UTF-8")
	public String insertBuyer(ADBoard b, HttpSession session) {
		
		b.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		int point = ((User)session.getAttribute("loginUser")).getPoint();
		
		if(boardService.insertBidUser(b) * boardService.updatePrizeEnd(b.getBoardNo()) > 0) {
			
			Point p = new Point();
			
			//기존의 입찰했던 사람 포인트 환불
			if(b.getPrizeUserNo() != 0) {
				p.setPointAdd(b.getNowPrice());
				p.setUserNo(b.getPrizeUserNo());
				p.setPointStatus("취소");
				
				pointService.addPoint(p);
			}
			
			// 새로운 입찰자 포인트 차감
			p.setPointAdd(-1 * b.getBidPrice());
			p.setUserNo(b.getUserNo());
			p.setPointStatus("사용");
			
			pointService.addPoint(p);

			((User)session.getAttribute("loginUser")).setPoint(point - b.getBidPrice());
			
			
			// 쪽지 보내기, 조회한 값 반환하기 위해 변수에 넣는다
			Message m = new Message();
			// 1. 낙찰자에게 쪽지 보내기
			m.setUserNo(1); //보낸 사람은 관리자
			m.setUserNo2(b.getUserNo()); //받는 사람은 구매자
			m.setMessageContent("축하드립니다!\r\n" + 
					" " + b.getTitle() + "의 경매에 낙찰되셨습니다.\r\n" + 
					"주소를 확인해 주세요");
			messageService.insertMessage(m);
			// 2. 글 쓴 사람한테 쪽지 보내기
			m.setUserNo2(b.getUserNo2()); //받는 사람은 게시글 작성자
			m.setMessageContent( b.getTitle() + "의 경매가 종료되었습니다.\r\n" + 
					"상품을 저희측으로 보내주시면 포인트 정산해서 적립해드리겠습니다. (생략)");
			messageService.insertMessage(m);
			
			//글 작성자에게 낙찰포인트 적립
			p.setPointAdd(b.getBidPrice());
			p.setUserNo(b.getUserNo2());
			p.setPointStatus("적립");
			pointService.addPoint(p);
			
			b = boardService.selectAuctionBoard(b.getBoardNo());
		}
		
		return  new Gson().toJson(b);
	}
	
	// 경매 종료
	@ResponseBody
	@RequestMapping(value="prize.ac", produces="appliction/json; charset=UTF-8")
	public String prizeUser(ADBoard b) {
		
		if(b.getPrizeUserNo() != 0) {
			
			// 쪽지 보내기, 조회한 값 반환하기 위해 변수에 넣는다
			Message m = new Message();
			// 1. 낙찰자에게 쪽지 보내기
			m.setUserNo(1); //보낸 사람은 관리자
			m.setUserNo2(b.getPrizeUserNo()); //받는 사람은 낙찰자
			m.setMessageContent("축하드립니다!\r\n" + 
					" " + b.getTitle() + "의 경매에 낙찰되셨습니다.\r\n" + 
					"주소를 확인해 주세요");
			messageService.insertMessage(m);
			
			// 2. 글 쓴 사람한테 쪽지 보내기
			m.setUserNo2(b.getUserNo()); //받는 사람은 게시글 작성자
			m.setMessageContent( b.getTitle() + "의 경매가 종료되었습니다.\r\n" + 
					"상품을 저희측으로 보내주시면 포인트 정산해서 적립해드리겠습니다. (생략)");
			messageService.insertMessage(m);
			
			//글 작성자에게 낙찰포인트 적립
			Point p = new Point();
			p.setPointAdd(b.getBidPrice());
			p.setUserNo(b.getUserNo());
			p.setPointStatus("적립");
			pointService.addPoint(p);
			
		}
		
		if(boardService.updatePrizeEnd(b.getBoardNo()) > 0) {
			b = boardService.selectAuctionBoard(b.getBoardNo());
		};
		
		return  new Gson().toJson(b);
	}
	
	// 실시간 가격 업데이트
	@ResponseBody
	@RequestMapping(value="priceCheck.ac", produces="appliction/json; charset=UTF-8")
	public String checkPrice(ADBoard b) {
		b = boardService.selectAuctionBoard(b.getBoardNo());
		return  new Gson().toJson(b);
	}
}

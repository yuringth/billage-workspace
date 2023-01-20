package com.bi.billage.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.FAQ;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.Serial;
import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.user.model.vo.User;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 광진영역

	// 작품 리스트 화면 +페이징처리
	@RequestMapping("list.nv")
	public ModelAndView selectNovelList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectNovelListCount(), currentPage, 10, 9);
		mv.addObject("pi", pi).addObject("list", boardService.selectNovelList(pi)).setViewName("board/novelBoard/novelListView");
		
		return mv;
	}
	
	// 연재 리스트 화면 +페이징처리 +작품 정보 조회
	@RequestMapping("list.se")
	public ModelAndView selectSerialList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, int nno) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectSerialListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi)
		.addObject("novel", boardService.selectNovelInfo(nno))
		.addObject("list", boardService.selectSerialList(pi, nno))
		.setViewName("board/serialBoard/serialListView");
		
		// mv.addObject("뭐시기", 뭐시기).addObject("화면단에불러올값", 서비스.메소드(넘길꺼).setViewName("최종적으로어디화면에뿌릴건지"); => addObject 계속할수있다.....
		
		//mv.addObject("nv", boardService.selectNovelInfo(nno).serViewName)
		
		return mv;
	}
	
	// 연재 상세보기 화면 +위에 작품정보+ 몇화 제목 작성일 내용...
	@RequestMapping("detail.se")
	public ModelAndView selectSerialDetail(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, @Param("novelNo") int nno, @Param("serialNo") String sno) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectSerialListCount(), currentPage, 10, 5);
		mv.addObject("pi", pi)
		.addObject("serial", boardService.selectSerialDetail(nno, sno))
		.addObject("novel", boardService.selectNovelInfo(nno))
		.setViewName("board/serialBoard/serialDetailView");
		
		return mv;
	}
	
	// 연재 등록 화면
	@RequestMapping("enrollForm.se")
	public String serialEnroll(Integer novelNo, Model model) {
		model.addAttribute("novelNo", novelNo);
		//System.out.println(nno);
		//System.out.println(novel);
		//System.out.println(model);
		return "board/serialBoard/serialEnrollForm";
	}
	
	// 연재 작성 메소드
	@RequestMapping("insert.se")
	public String insertSerial(Serial se,/* Integer novelNo,*/ HttpServletRequest request, HttpSession session, Model model) {
		Integer novelNo = Integer.parseInt(request.getParameter("novelNo"));
		
		if(boardService.insertSerial(se, novelNo) > 0) { // 성공 => 이전화면으로
			session.setAttribute("alertMsg", "등록 완료");
			return "redirect:" + request.getHeader("Referer");
		} else {
			model.addAttribute("erroMsg", "등록 실패");
			return "common/errorPage";
		}
		
	}
	
	// 연재 신청 메소드
	@RequestMapping("insert.sr")
	public String insertSerialRequest(SerialRequest sr, MultipartFile upfile, HttpSession session, Model model) {
			
		if(!upfile.getOriginalFilename().equals("")) { 
				
				
				sr.setOriginName(upfile.getOriginalFilename()); // 원본명
				sr.setChangeName("resources/uploadFiles/" + saveFile(upfile, session));
			}
			
			if(boardService.insertSerialRequest(sr) > 0) { // 성공 => 메인화면으로
				session.setAttribute("alertMsg", "연재 신청 완료");
				return "main"; //
			} else {
				model.addAttribute("errorMsg", "작성 실패");
				return "common/errorPage";
			}
		}
	
	// 작품 등록 메소드
	@RequestMapping("insert.nv")
	public String insertNover(Novel n, MultipartFile upfile, HttpSession session, Model model) {
	
		if(!upfile.getOriginalFilename().equals("")) { 
					
					
				n.setOriginName(upfile.getOriginalFilename()); // 원본명
				n.setChangeName("resources/uploadFiles/" + saveFile(upfile, session));
			}
				
			if(boardService.insertNovel(n) > 0) { // 성공 => 메인화면으로
				session.setAttribute("alertMsg", "작품 등록 완료");
				return "main"; //
			} else {
				model.addAttribute("errorMsg", "작성 실패");
				return "common/errorPage";
			}
		}
	/*
	@ResponseBody
	@RequestMapping(value="novelLike.nv", produces = "application/json; charset=UTF-8")
	public String novelLike(Novel novel, int likeStatus) {
		
		int[] result = new int[2];
		
		// 작품추천 삭제 여부 
		if(likeStatus > 0) {
			result[0] = (boardService.novelLikeDelete(novel) > 0 )? 0 : -1;
		} else {
			result[0] = (boardService.novelLikeInsert(novel) > 0 )? 1 : -1;
		} 
		
		result[1] = boardService.selectNovelLikeCount(novel);

		return new Gson().toJson(result);
	}
	*/
	// 첨부파일 메소드
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
				
			String originName = upfile.getOriginalFilename();
				
			// 년월일시분초
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			// 12321(5자리 랜덤값)
			int ranNum = (int)(Math.random() * 90000 + 10000);
			// 확장자
			String ext = originName.substring(originName.lastIndexOf("."));
				
			String changeName = currentTime + ranNum + ext;
				
			// 업로드 시키고자하는 폴더의 물리적인 경로
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
				
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IOException e) {
				e.printStackTrace();
			}
				
			return changeName;
				
		}
	
	// FAQ화면
	@RequestMapping("faqList.fa")
	public ModelAndView selectfaqList(FAQ faq, ModelAndView mv) {
		mv.addObject("faq", boardService.selectFaqList(faq)).setViewName("board/faqBoard/faqListView");
		return mv;
	}
	
	//ajax 로 버튼 만드는 곳
	@ResponseBody
	@RequestMapping(value="changeBtn.nv", produces = "application/json; charset=UTF-8")
	public String chnageLikeBtnNovel(Novel nv, HttpSession session) {
		if((User)session.getAttribute("loginUser") != null) {
			nv.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		} else {
			nv.setUserNo(1);
		}
		
		
		return new Gson().toJson(boardService.chnageLikeBtnNovel(nv));
	}
	
	//좋아요
	@ResponseBody
	@RequestMapping(value="novelLike.nv", produces = "application/json; charset=UTF-8")
	public String novelLike(Novel nv, HttpSession session) {
		nv.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		
		int[] result = new int[2];
		result[0] = boardService.novelLike(nv);
		result[1] = boardService.selectNovelLikeCount(nv);
		
		return new Gson().toJson(result);
	}
	//취소
	@ResponseBody
	@RequestMapping(value="novelCancel.nv", produces = "application/json; charset=UTF-8")
	public String novelCancel(Novel nv, HttpSession session) {
		nv.setUserNo(((User)session.getAttribute("loginUser")).getUserNo());
		
		int[] result = new int[2];
		result[0] = boardService.novelCancel(nv);
		result[1] = boardService.selectNovelLikeCount(nv);
		
		return new Gson().toJson(result);
	}
	
	// 광진영역 끝

}

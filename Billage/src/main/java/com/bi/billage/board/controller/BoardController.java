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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.service.BoardService;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.Serial;
import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.template.Pagination;

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
	
	// 연재 리스트 화면 +페이징처리
	@RequestMapping("list.se")
	public ModelAndView selectSerialList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, int nno) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectSerialListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi).addObject("list", boardService.selectSerialList(pi, nno)).setViewName("board/serialBoard/serialListView");
		
		// mv.addObject("뭐시기", 뭐시기).addObject("화면단에불러올값", 서비스.메소드(넘길꺼).setViewName("최종적으로어디화면에뿌릴건지"); => addObject 계속할수있다.....
		
		//mv.addObject("nv", boardService.selectNovelInfo(nno).serViewName)
		
		return mv;
	}
	
	// 연재 상세보기 화면
	@RequestMapping("detail.se")
	public ModelAndView selectSerialDetail(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, @Param("novelNo") int nno, @Param("serialNo") String sno) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectSerialListCount(), currentPage, 10, 5);
		mv.addObject("pi", pi).addObject("list", boardService.selectSerialDetail(pi, nno, sno)).setViewName("board/serialBoard/serialDetailView");
		
		return mv;
	}
	
	// 연재 등록 화면
	@RequestMapping("enrollForm.se")
	public String serialEnroll(int novelNo, Model model) {
		model.addAttribute("novelNo", novelNo);
		//System.out.println(nno);
		//System.out.println(novel);
		//System.out.println(model);
		return "board/serialBoard/serialEnrollForm";
	}
	
	// 연재 작성 메소드
	@RequestMapping("insert.se")
	public String insertSerial(Serial se, int novelNo, HttpServletRequest request, HttpSession session, Model model) {
		
		
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
	
	// 광진영역 끝

}

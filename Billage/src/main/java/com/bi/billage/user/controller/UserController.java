package com.bi.billage.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.vo.Inquiry;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.savefile.SaveFile;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.point.model.service.PointService;
import com.bi.billage.point.model.vo.Point;
import com.bi.billage.user.model.service.UserService;
import com.bi.billage.user.model.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PointService pointService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 관리자 관련 컨트롤러
	
	// 관리자 페이지
	@RequestMapping("admin.ad")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	// 회원관리화면
	@RequestMapping("userList.ad")
	public ModelAndView selectUserList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(userService.selectUserListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi).addObject("list", userService.selectUserList(pi)).setViewName("admin/userListView");
		
		return mv;
	}
	
	// 모임관리화면
	@RequestMapping("groupList.ad")
	public ModelAndView selectGroupList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(userService.selectGroupListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi).addObject("list", userService.selectGroupList(pi)).setViewName("admin/groupListView");
		
		return mv;
	}
	
	// 1:1 문의내역
	@RequestMapping("inqList.ad")
	public ModelAndView selectinqList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(userService.selectInqListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi).addObject("list", userService.selectInqList(pi)).setViewName("admin/inqListView");
		
		return mv;
	}
	
	// 문의 상세보기
	@RequestMapping("detail.iq")
	public ModelAndView selectInquiry(ModelAndView mv, int ino) {
		mv.addObject("iq", userService.selectInquiry(ino)).setViewName("admin/inqDetailView");
		
		return mv;
	}
	
	// 1:1 문의 작성폼
	@RequestMapping("enroll.iq")
	public String enrollInquiry() {
		return "admin/inqEnrollForm";
	}
	
	// 문의 요청 메소드
	@RequestMapping("insert.iq")
	public String insertInquiry(Inquiry iq, HttpSession session, Model model) {
			
			if(userService.insertInquiry(iq) > 0) { // 성공 => 메인화면으로
				session.setAttribute("alertMsg", "문의 완료");
				return "main"; //
			} else {
				model.addAttribute("errorMsg", "작성 실패");
				return "common/errorPage";
			}
		}
	
	// 문의 답변 메소드
	@RequestMapping("update.iq")
	public String updateInquiry(int ino, String answer, HttpSession session, Model model) {
		
		Inquiry iq = new Inquiry();
		iq.setInqNo(ino);
		iq.setAnswer(answer);
		
		if(userService.updateInquiry(iq) > 0) { // 성공 => 메인화면으로
			session.setAttribute("alertMsg", "답변 완료");
			return "main";
		} else {
			model.addAttribute("errorMsg", "답변 오류");
			return "common/errorPage";
		}
		
	}
	
	// 연재 요청 리스트 화면 +페이징처리
	@RequestMapping("list.sr")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(userService.selectSerialRequestListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi).addObject("list", userService.selectSerialRequestList(pi)).setViewName("admin/serialRequestListView");
		
		return mv;
	}
	
	// 연재 요청 상세보기
	@RequestMapping("detail.sr")
	public ModelAndView selectSerialRequest(ModelAndView mv, int rno) {
	mv.addObject("sr", userService.selectSerialRequest(rno)).setViewName("admin/serialRequestDetailView");
	
	return mv;
	}
	
	// 연재 요청 작성폼
	@RequestMapping("request.se")
	public String requestSerial() {
		return "admin/serialRequestForm";
	}
	
	// 연재 요청 승락후 변화 - 회원등급변경 / 승락상태로변경 / 메일전송
	@RequestMapping("update.re")
	public String updateSerialRequest(int rno, int uno) {
		if(userService.updateUserGrade(uno) > 0) {
			userService.updateSerialRequest(rno);
		}
		return "main";
	}
	
	// 작품 등록폼
	@RequestMapping("enrollForm.nv")
	public String enrollNovel() {
		return "admin/novelEnrollForm";
	}
	
	
	
	
	
	
	
	// 관리자 관련 끝
	
	// 회원가입 폼으로
	@RequestMapping("userEnrollForm.me")
	public String userEnrollForm() {
		return "user/userEnrollForm";
	}
	
	
	//--------------------------------------------------------------------------------
	// 마이페이지 
	@RequestMapping("mypage.me")
	public String myPage() {
		return "user/myPage";
	}
	
	@RequestMapping("general.cl")
	public String groupGeneral() {
		return "club/clubGeneralView";
	}
	
	
	@RequestMapping("admin.cl")
	public String groupAdmin() {
		return "club/clubAdminView";
	}
	
	// 로그인 폼으로
	@RequestMapping("loginUserForm.me")
	public String loginUserForm() {
		return "user/loginUserForm";
	}
	
	// 회원가입
	@RequestMapping("insert.me")
	public String insertUser(User u, Model model) {
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		
		u.setUserPwd(encPwd);
		
		int result = userService.insertUser(u);
		
		if(result > 0 ) {	// 가입성공되면 메인페이지로
			
			//가입된 아이디로 userNo를 조회한 후에 가입 포인트 50p 등록
			Point p = new Point();
			p.setUserNo(pointService.selectUserNo(u.getUserId()));
			p.setPointAdd(50);
			p.setPointStatus("적립");
			pointService.addPoint(p);
			
			return "redirect:/";
		} else {			// 실패 에러메세지
			model.addAttribute("errorMsg", "가입에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	// 로그인
	@RequestMapping("login.me")
	public ModelAndView loginUser(User u, ModelAndView mv, HttpSession session) {
		
		User loginUser = userService.loginUser(u);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(u.getUserPwd(), loginUser.getUserPwd())) {	// 로그인 성공 시
			
			//로그인 하고 포인트 조회해서 point필드에 넣어줌
			loginUser.setPoint(pointService.selectPoint(loginUser.getUserNo()));
			
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {	// 로그인 실패 시
			// 키 - 밸류 담기
			mv.addObject("errorMsg", "에러입니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// id 중복체크
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		return userService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	// 마이페이지 개인정보
	@RequestMapping("myInfo.me")
	public String myInfo() {
		return "user/myInfo";
	}
	
	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping("nicknameCheck.me")
	public String nicknameCheck(String checkNickname) {
		return userService.nicknameCheck(checkNickname) > 0 ? "NNNNN" : "NNNNY";
	}
	
	// 개인정보 수정
	@RequestMapping("update.me")
	public String updateUser(User u, Model model, HttpSession session, MultipartFile upfile) {
		
		// 프로필 사진 변경
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.getSaveFile(upfile, session);
			u.setProfileImg(changeName);
		}
		
		if(userService.updateUser(u) > 0) {
			
			session.setAttribute("loginUser", userService.loginUser(u));
			
			session.setAttribute("alertMsg", "성공적으로 변경되었습니다.");
			return "redirect:myInfo.me";
			
		} else {
			model.addAttribute("errorMsg", "회원 정보 변경 실패");
			return "common/errorPage";
		}
	}
	
	// 회원탈퇴폼으로 이동
	@RequestMapping("userDeleteForm.me")
	public String userDeleteForm() {
		return "user/userDeleteForm";
	}
	
	// 회원탈퇴
	@RequestMapping("delete.me")
	public String deleteUser(int userNo, String userPwd, HttpSession session) {
		
		String encPwd = ((User)session.getAttribute("loginUser")).getUserPwd();
		
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
			//	비밀번호가 사용자가 입력한 평문으로 만들어진 암호문일 경우
			
			if(userService.deleteUser(userNo) >0) {
				// 탈퇴처리 성공 => session에서 loginUsr지움, alert문구 담기 => 메인페이지 url요청
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "탈퇴처리가 완료됐습니다.");
				return "redirect:/";
				
			} else {
				session.setAttribute("errorMsg", "탈퇴처리실패");
				return "common/errorPage";
			}
			
		} else {
			session.setAttribute("alertMsg", "비밀번호 틀림");
			return "redirect:myPage.me";
		}
		
	}
	
}
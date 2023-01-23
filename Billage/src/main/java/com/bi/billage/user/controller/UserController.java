package com.bi.billage.user.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.vo.FAQ;
import com.bi.billage.board.model.vo.Inquiry;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.common.entity.CertVo;
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
	
	@Autowired
	private JavaMailSender sender;
	
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
	
	// 작품관리화면
	@RequestMapping("novelList.ad")
	public ModelAndView selectNovelList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(userService.selectNovelListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi).addObject("list", userService.selectNovelList(pi)).setViewName("admin/adminNovelListView");
		
		return mv;
	}
	
	// 작품상세화면
	@RequestMapping("novelDetail.ad")
	public ModelAndView selectNovel(ModelAndView mv, Integer nno) {
		mv.addObject("novel", userService.selectNovel(nno)).setViewName("admin/adminNovelDetailView");
		
		return mv;
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
	
	// 작품 수정 메소드
	@RequestMapping("update.nv")
	public String updateNovel(/*Integer nno,
							  String novelTitle,
							  String novelDisplay,
							  String serialStatus,
							  String chargeStatus,
							  String originName,
							  String changeName,*/
							  @ModelAttribute Novel n,
							  HttpSession session,
							  MultipartFile reUpfile,
							  Model model) {
		
//		Novel n = new Novel();
//		n.setNovelNo(nno);
//		n.setNovelTitle(novelTitle);
//		n.setNovelDisplay(novelDisplay);
//		n.setSerialStatus(serialStatus);
//		n.setChargeStatus(chargeStatus);
//		n.setOriginName(originName);
//		n.setChangeName(changeName);

		// 새로운 썸네일이 넘어온 경우
		if(!reUpfile.getOriginalFilename().equals("")) {
			// 기존에 첨부파일이 있었을 경우 ? => 기존의 첨부파일을 삭제
			if(n.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(n.getChangeName())).delete();
			}
			
			// 새로 넘어온 첨부파일 서버 업로드 시키기
			// saveFile() 호출해서 첨부파일을 업로드
			String changeName = saveFile(reUpfile, session);
			
			n.setOriginName(reUpfile.getOriginalFilename());
			n.setChangeName("resources/uploadFiles/" + changeName);
		}

		if(userService.updateNovel(n) > 0) { // 성공
			session.setAttribute("alertMsg", "작품 수정 완료");
			return "redirect:/novelList.ad";
		} else {
			model.addAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
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
			return "redirect:/update.iq";
		} else {
			model.addAttribute("errorMsg", "답변 오류");
			return "common/errorPage";
		}
	}
	
	// 연재 요청 리스트 화면 +페이징처리
	@RequestMapping("list.sr")
	public ModelAndView selectSerialRequestList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
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
		return "redirect:/detail.sr";
	}
	
	// 작품 등록폼
	@RequestMapping("enrollForm.nv")
	public String enrollNovel() {
		return "admin/novelEnrollForm";
	}
	
	// FAQ 관리화면
	@RequestMapping("faqList.ad")
	public ModelAndView selectfaqList(@RequestParam(value="cpage", defaultValue="1") int currentPage, FAQ faq, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(userService.selectFaqListCount(), currentPage, 10, 10);
		mv.addObject("pi", pi).addObject("faq", userService.selectFaqList(pi)).setViewName("admin/adminFaqListView");
		return mv;
	}
	
	// FAQ 등록폼
	@RequestMapping("enrollForm.fa")
	public String enrollFaq() {
		return "board/faqBoard/faqEnrollForm";
	}
	
	// FAQ 등록메소드
	@RequestMapping("insert.fa")
	public String insertFaq(FAQ faq, HttpSession session, Model model) {
			
		if(userService.insertFaq(faq) > 0) { // 성공 => 메인화면으로
			session.setAttribute("alertMsg", "등록 완료");
			return "redirect:/faqList.ad";
		} else {
			model.addAttribute("errorMsg", "작성 실패");
			return "common/errorPage";
		}
	}
	
	// FAQ 삭제메소드
	@RequestMapping("delete.fa")
	public String deleteFaq(FAQ faq, HttpSession session, Model model) {
		
		if(userService.deleteFaq(faq) > 0) {
			session.setAttribute("alertMsg", "삭제 완료");
			return "redirect:/faqList.ad";
		} else {
			model.addAttribute("errorMsg", "삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	// FAQ 수정메소드
	@RequestMapping("update.fa")
	public String updateFaq(FAQ faq, HttpSession session, Model model) {
		
		if(userService.updateFaq(faq) > 0) {
			session.setAttribute("alertMsg", "수정 완료");
			return "redirect:/faqList.ad";
		} else {
			model.addAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
	}
	
	
	// 관리자 관련 끝
	//--------------------------------------------------------------------------------

	// 고객센터 화면
	@RequestMapping("center.cs")
	public String customerService() {
		return "board/customerServiceBoard/csMain";
	}
	
	//--------------------------------------------------------------------------------
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
			//loginUser.setPoint(pointService.selectPoint(loginUser.getUserNo()));
			
			//전체 작성 게시글 수 합하기
			int sum = (loginUser.getAuctionBoard() + loginUser.getBoard() +
						loginUser.getClubBoard() + loginUser.getDrawBoard() +
						loginUser.getReview() + loginUser.getRentBoard() + loginUser.getUsedBoard());
			
			loginUser.setBoardCount(sum);
			
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {	// 로그인 실패 시
			// 키 - 밸류 담기
			mv.addObject("errorMsg", "ID와 비밀번호를 다시 확인해주세요.");
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
	
	// 비밀번호찾기 email입력폼
	@RequestMapping("writeEmailForm.me")
	public String writeEmailForm(String email) {
		return "user/writeEmailForm";
	}
	
	// 작품 후원 메소드
	@RequestMapping("donate.nv")
	public String donateNovel(int point, int userPoint, int userNo1, int userNo2, HttpSession session) {
		
		//System.out.println(userPoint);
		//System.out.println(point);
		if(point <= userPoint) {
			Point p1 = new Point();
			p1.setUserNo(userNo1);
			p1.setPointAdd(-1 * point);
			p1.setPointStatus("사용");
			
			if(pointService.addPoint(p1)> 0) {
				Point p2 = new Point();
				p2.setUserNo(userNo2);
				p2.setPointAdd(point);
				p2.setPointStatus("적립");
				pointService.addPoint(p2);
				session.setAttribute("alertMsg", "후원 성공!");
				//((User)session.getAttribute("loginUser")).setPoint(pointService.selectPoint(userNo1));
				((User)session.getAttribute("loginUser")).setPoint(userPoint - point);
			}
			
				return "redirect:/list.se";
		} else {
			session.setAttribute("alertMsg", "보유 포인트가 부족합니다.");
			return "redirect:/list.se";
		}
	}
	
	// 메일 인증
	@PostMapping("inputEmail")
	public String inputEmail(String email, HttpServletRequest request) throws MessagingException{
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		String secret = generateSecret();
		CertVo certVo = CertVo.builder()
						.who(ip)
						.secret(secret)
						.build();
		
		userService.sendMail(certVo);
		
		helper.setTo(email);
		helper.setSubject("Billage 인증 요청입니다.");
		helper.setText("인증번호는 : " + secret + " 입니다.");
		sender.send(message);
		
		return "user/writeCertForm";
	}
	
	// 메일 인증 번호 생성
	public String generateSecret() {
		
		Random r = new Random();
		int n = r.nextInt(100000);
		Format f = new DecimalFormat("000000");
		String secret = f.format(n);
		
		return secret;
	}
	
}
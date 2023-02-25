package com.bi.billage.follow.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.board.model.vo.ReviewBoard;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.common.template.Pagination;
import com.bi.billage.follow.model.service.FollowService;
import com.bi.billage.follow.model.vo.Follow;
import com.bi.billage.follow.model.vo.Star;
import com.bi.billage.user.model.vo.User;
import com.google.gson.Gson;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	//following list
	@RequestMapping("selectFollowing.fo")
	public ModelAndView selectFollowingList(int uno, ModelAndView mv,HttpSession session) {
		
		
		ArrayList<User> followingList = followService.selectFollowingList(uno);

		
		mv.addObject("followingList",followingList);
		
		//다른 유저의 팔로잉 목록을 클릭 했을 경우
		if(((User)session.getAttribute("loginUser")).getUserNo() != uno) {
			
			//로그인 유저의 팔로잉 리스트 
			//-> 로그인 유저의 팔로잉 리스트와 상대방의 팔로잉 리스트를 비교하여 같은 사람을 팔로잉 하고 있을 경우에는 status를 1로 바꿔준다.
			ArrayList<User> lgFollowingLlist = followService.selectFollowingList(((User)session.getAttribute("loginUser")).getUserNo());
			
			for(int i = 0; i < lgFollowingLlist.size(); i++) {
				
				int luserNo = lgFollowingLlist.get(i).getUserNo();
				
				for(int j = 0; j < followingList.size(); j++ ) {
					
					if (luserNo == followingList.get(j).getUserNo()) {
						
						followingList.get(j).setFollowStatus(1);

					} else {
						
						followingList.get(j).setFollowStatus(0);
						
					};
				};
			};
			
			mv.addObject("followingList", followingList).setViewName("follow/followingListView");			
			
		}else {
			//로그인 유저가 자신의 팔로잉 목록을 보는 경우
			for(int i = 0; i < followingList.size(); i++ ) {
				followingList.get(i).setFollowStatus(1);
			}
			
			mv.setViewName("follow/followingListView");
		}
		
		return mv;
	}	
	
	//followerList 내가 follow 한 사람과 하지 않은 사람을 각각 나누어서 select 함
	@RequestMapping("selectFollower.fo")
	public ModelAndView selectFollowerList(int uno, ModelAndView mv, HttpSession session) {
		
		ArrayList<User> followerList1 = followService.selectFollowerList1(uno);//맞팔임

		ArrayList<User> followerList2 = followService.selectFollowerList2(uno);//맞팔아님 
		
		mv.addObject("followerList1",followerList1)
		.addObject("followerList2", followerList2);
			
		
		if(((User)session.getAttribute("loginUser")).getUserNo() != uno){
			
			ArrayList<User> lgFollowerList1 = followService.selectFollowerList1(((User)session.getAttribute("loginUser")).getUserNo());//loginUser맞팔리스트
			ArrayList<User> lgFollowerList2 = followService.selectFollowerList2(((User)session.getAttribute("loginUser")).getUserNo());//loginUser맞팔아닌 계정 리스트
		
			// 맞팔리스트들 끼리 비교해서 로그인 유저와 같은 계정이 있으면 status를 1로 변경
			for(int i = 0; i<lgFollowerList1.size(); i++) {
				
				int lg1No = lgFollowerList1.get(i).getUserNo();
				
				for(int j = 0; j<followerList1.size(); j++) {
					
					if(lg1No == followerList1.get(j).getUserNo()) {
						
						followerList1.get(j).setFollowStatus(1);
					}else {
						followerList1.get(j).setFollowStatus(0);
					}
				}
				
			}
			
			//맞팔이 아닌 리스트들 끼리 비교해서 로그인 유저와 같은 계정이 있으면 status를 1로 변경 -> 로그인 유저와는 맞팔이라는 뜻 
			for(int m = 0; m<lgFollowerList2.size(); m++) {
				
				int lg2No = lgFollowerList2.get(m).getUserNo();
				
				for(int n = 0; n<followerList2.size(); n++) {
					
					if(lg2No == followerList2.get(n).getUserNo()) {
						
						followerList2.get(n).setFollowStatus(1);
					}else {
						followerList2.get(n).setFollowStatus(0);
					}
					
				}
			}
			mv.setViewName("follow/followerListView");
		}else {
			//로그인한 유저가 자기 자신의 팔로워 목록을 볼 경우
			for(int i = 0; i<followerList1.size(); i++) {
				followerList1.get(i).setFollowStatus(1);
			};
			
			for(int i = 0; i<followerList2.size(); i++) {
				followerList2.get(i).setFollowStatus(0);
			};
				
			mv.setViewName("follow/followerListView");
		}
			
		
		return mv;
	}
	
	//로그인한 유저의 팔로우 프로필 
	@RequestMapping("selectLoginUser.fo")
	public String selectLoginUser(HttpSession session) {
		
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		 User user = followService.selectUser(userNo);
		 
		 Star star = followService.selectStar(userNo);
		 
		 session.setAttribute("user", user);
		 
		 session.setAttribute("star", star);
		 
		return "follow/loginUserFollowView";
	}
	
	@RequestMapping("followDetail.fo")
	public String selectFollowing() {
		return "follow/followDetailView";
	}
	
	@RequestMapping("reviewList.fo")
	public String selectFollowReviewList() {
		return "follow/followReviewListView";
	}
	
	//팔로우 insert
	@ResponseBody
	@RequestMapping(value="insert.fo", produces ="application/json; charset=UTF-8")
	public String insertFollow(int userNo2, ModelAndView mv, HttpSession session) {
		
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			
			Follow follow = new Follow(userNo, userNo2);
			
			int result = followService.insertFollow(follow);
			
			return new Gson().toJson(result);
	}
	
	
	//팔로우 delete
	@ResponseBody
	@RequestMapping(value="delete.fo", produces ="application/json; charset=UTF-8")
	public String deleteFollow(int userNo2, ModelAndView mv, HttpSession session) {
		
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		Follow follow = new Follow(userNo, userNo2);
		
		int result = followService.deleteFollow(follow);
		
		return new Gson().toJson(result);
	}
	
	// 리뷰 목록
	@RequestMapping("selectReviewList.fo")
	public ModelAndView selectReviewList( @RequestParam(value="cpage", defaultValue="1") int currentPage, int uno , ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(followService.selectReviewCount(uno), currentPage, 5, 10);
		
		ArrayList<ReviewBoard> list = followService.selectReviewList(uno , pi);
		System.out.println(list);
		System.out.println(list.size());
		if(list.size() > 0) {
			mv.addObject("pi", pi);
			mv.addObject("list", list).setViewName("follow/followReviewListView");
		} else {
			mv.addObject("list", list).setViewName("follow/followReviewListView");
		}
		
		return mv;
		
	}
	
	//클릭한 사용자 follow 상세프로필
	@RequestMapping("selectUser.fo")
	public ModelAndView selectUser (int uno, HttpSession session ,ModelAndView mv) {
		//로그인 유저 번호 -> userNo1 , 내가 클릭한 유저 번호-> uno로 받아옴
		/*
		 * follow에 담아서 전달
		 * user -> 클릭한 유저에 관한 정보를 user 객체에 담아온다
		 * star -> 클릭한 유저가 준 리뷰 별점을 담아온다.
		 * goodReview => 클릭한 유저와 로그인한 유저가 준 별점5점 책들 중에 동일한 책만 ArrayList로 가져온다.
		 * 
		 */
		
		int userNo1 = ((User)session.getAttribute("loginUser")).getUserNo();
		
		Follow follow = new Follow(userNo1, uno);
		
		User user = followService.selectUser(uno);
		
		Star star = followService.selectStar(uno);
		
		ArrayList<ReviewBoard> goodReview = followService.selectGoodReview(follow);
		
		ArrayList<ReviewBoard> badReview = followService.selectBadReview(follow);
		
		ReviewBoard b = new ReviewBoard();
		
		int rNum;
		
		//상대방과 나와 엇갈린 리뷰의 경우 랜덤 메소드 실행
		if(badReview.size() != 0) {
		
			if(badReview.size() > 10) {
				
				rNum =  (int)(Math.random() * badReview.size());
				
			}else {
				
					rNum = (int)(Math.random() * 10);
					
					while(rNum >= badReview.size()) {
						rNum = (int)(Math.random() * 10);
					};
					
			}
			b = badReview.get(rNum);
		};
		
		
		System.out.println(user);
		
		
		
		mv.addObject("user", user).addObject("star", star).addObject("goodReview",goodReview).addObject("badReview", b).setViewName("follow/followDetailView");
		
		return mv;
		
	}
	
	@ResponseBody
	@RequestMapping(value="checkFollow.fo" , produces ="application/json; charset=UTF-8")
	public String checkFollow (Follow follow) {
		
		int result = followService.checkFollow(follow);
		
		return new Gson().toJson(result);
		
		
	}
	

}

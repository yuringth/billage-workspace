package com.bi.billage.follow.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.follow.model.service.FollowService;
import com.bi.billage.user.model.vo.User;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@RequestMapping("selectFollowing.fo")
	public ModelAndView selectFollowingList(int uno, ModelAndView mv) {
		
		ArrayList<User> followingList = followService.selectFollowingList(uno);
		
		mv.addObject("followingList",followingList).setViewName("follow/followingListView");
		
		return mv;
	}
	
	@RequestMapping("selectFollower.fo")
	public ModelAndView selectFollowerList(int uno, ModelAndView mv) {
		
		ArrayList<User> followerList = followService.selectFollowerList(uno);
		
		ArrayList<User> followingList = followService.selectFollowingList(uno);
		
		mv.addObject("followerList",followerList).addObject("followingList", followingList).setViewName("follow/followerListView");
		
		return mv;
	}
	
	//로그인한 유저의 팔로우 프로필 
	@RequestMapping("selectLoginUser.fo")
	public String selectLoginUser(HttpSession session) {
		
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		 User user = followService.selectLoginUser(userNo);
		 
		 session.setAttribute("user", user);
		 
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

}

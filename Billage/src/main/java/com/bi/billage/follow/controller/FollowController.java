package com.bi.billage.follow.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bi.billage.user.model.vo.User;

@Controller
public class FollowController {
	
	@RequestMapping("selectFollowing.fo")
	public String selectFollowingList() {
		
		return "follow/followingListView";
	}
	
	@RequestMapping("selectFollower.fo")
	public String selectFollowerList() {
		
		return "follow/followerListView";
	}
	
	@RequestMapping("selectLoginUser.fo")
	public String selectLoginUser(HttpSession session) {
		
		User user= (User)session.getAttribute("loginUser");
		
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

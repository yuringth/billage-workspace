package com.bi.billage.group.model.service;

import java.util.ArrayList;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.group.model.vo.Group;

public interface GroupService {
	
	// Group 게시글의 List 총 개수 조회
	int selectListCount();
	
	// 페이징 처리
	ArrayList<Group> selectList(PageInfo pi);
	
	// 게시글 클릭 시 조회수 증가
	int increaseCount(int groupNo);
	
	// 게시글 조회수 증가 후 해당 게시글의 상세정보 조회 
	Group selectDetailGroup(int groupNo);
	
	// 모임 insert 
	int insertGroup(Group group);
}

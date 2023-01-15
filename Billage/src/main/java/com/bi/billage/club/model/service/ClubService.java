package com.bi.billage.club.model.service;

import java.util.ArrayList;

import com.bi.billage.club.model.vo.Club;
import com.bi.billage.common.model.vo.PageInfo;

public interface ClubService {
	
	// Group 게시글의 List 총 개수 조회
	int selectListCount();
	
	// 페이징 처리
	ArrayList<Club> selectList(PageInfo pi);
	
	// 게시글 클릭 시 조회수 증가
	int increaseCount(Club club);
	
	// 게시글 조회수 증가 후 해당 게시글의 상세정보 조회 
	Club selectDetailClub(Club club);
	
	// 모임 insert 
	int insertClub(Club club);
	
	// 모임 insert 후 모임장 club_member insert
	int insertClubAdmin(Club club);
	
	//모임 마이페이지에서 <일반 >리스트 조회해오기
	ArrayList<Club> clubGeneral(int userNo);
	
	// 모임 마이페이지에서 <일반 > 모임가입자 모입 탈퇴하기 
	int ajaxDeleteClub(Club club);
	
	// 모임 마이페이지 <관리자> 모임 관리 페이지 가기 
	ArrayList<Club> clubAdmin(int userNo);
	
	// 모임 리스트 조회 시 로그인 회원 조아요 조회 
	ArrayList<Club> selectClubLike(int userNo);
	
}

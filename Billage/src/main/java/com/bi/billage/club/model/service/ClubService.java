package com.bi.billage.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bi.billage.club.model.vo.Club;
import com.bi.billage.club.model.vo.ClubOpen;
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
	
	// 게시글 조회시 ClubOpen 조회
	ArrayList<ClubOpen> selectDetailClubOpen(Club club);
	
	// clubOpen 신청하기(Insert)
	int ajaxInsertOpenMem(ClubOpen clubOpen);
	
	// 모임 insert 
	int insertClub(Club club);
	
	// 모임 insert 후 모임장 club_member insert
	int insertClubAdmin(Club club);
	
	//모임 마이페이지에서 <일반 >리스트 조회해오기
	ArrayList<Club> clubGeneral(int userNo);
	
	// parti delete
	// 모임 마이페이지에서 <일반 > 모임가입자 모입 탈퇴하기 
	int ajaxDeleteClub(Club club);
	
	// 모임장이 회원들 강퇴시키기 Delete
	int ajaxDeleteClubs(ArrayList<Club> deleteList);
	
	// parti insert
	int ajaxInsertClub(Club club);
	
	// 모임 마이페이지 <관리자> 모임 관리 페이지 가기 
	ArrayList<Club> clubAdmin(int userNo);
	
	// club clubNo에 따른 회원리스트 조회 
	ArrayList<Club> clubMemberSelectAdmin(int clubNo);
	
	// 모임 리스트 조회 시 로그인 회원 조아요 조회 
	ArrayList<Club> selectClubLike(int userNo);
	
	// like insert 
	int clubLikeInsert(Club club);
	
	// like delete 
	int clubLikeDelete(Club club);
	
	// like Count
	int selectClubLikeCount(Club club); 
	
	// ClubOpen List Select 
	ArrayList<ClubOpen> clubOpenSelectAdmin(int ClubNo);
	
	// ClubOpen Insert Form
	int insertClubOpen(ClubOpen clubOpen);
	
	// ClubOpen Select mem Num
	int selectOpenMemNum(ClubOpen clubOpen);
	
	// INSERT SOCKET 
	int insertChat(HashMap<String, String> map);
	
}

package com.bi.billage.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.club.model.dao.ClubDao;
import com.bi.billage.club.model.vo.Club;
import com.bi.billage.club.model.vo.ClubOpen;
import com.bi.billage.club.model.vo.Socket;
import com.bi.billage.common.model.vo.PageInfo;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubDao clubDao;
	
	@Override
	public int selectListCount() {
		return clubDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Club> selectList(PageInfo pi) {
		return clubDao.selectList(sqlSession, pi);
	}
		
	@Override
	public int increaseCount(Club club) {
		return clubDao.increaseCount(sqlSession, club);
	}
	
	@Override
	public Club selectDetailClub(Club club) {
		return clubDao.selectDetailClub(sqlSession, club);
	}
	
	@Override
	public ArrayList<ClubOpen> selectDetailClubOpen(Club club) {
		return clubDao.selectDetailClubOpen(sqlSession, club);
	}
	
	@Override
	public int insertClub( Club club) {
		return clubDao.insertClub(sqlSession, club);
	}

	@Override
	public int insertClubAdmin(Club club) {
		return clubDao.insertClubAdmin(sqlSession, club);
	}

	@Override
	public ArrayList<Club> clubGeneral(int userNo) {
		return clubDao.clubGeneral(sqlSession, userNo);
	}

	@Override
	public int ajaxDeleteClub(Club club) {
		return clubDao.ajaxDeleteClub(sqlSession, club);
	}
	
	@Override
	public int ajaxInsertClub(Club club) {
		return clubDao.ajaxInsertClub(sqlSession, club);
	}

	@Override
	public ArrayList<Club> clubAdmin(int userNo) {
		return clubDao.clubAdmin(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Club> clubMemberSelectAdmin(int clubNo) {
		return clubDao.clubMemberSelectAdmin(sqlSession, clubNo);
	}

	@Override
	public ArrayList<Club> selectClubLike(int userNo) {
		return clubDao.selectClubLike(sqlSession, userNo);
	}

	@Override
	public int clubLikeInsert(Club club) {
		return clubDao.clubLikeInsert(sqlSession, club);
	}

	@Override
	public int clubLikeDelete(Club club) {
		return clubDao.clubLikeDelete(sqlSession, club);
	}

	@Override
	public int selectClubLikeCount(Club club) {
		return clubDao.selectClubLikeCount(sqlSession, club);
	}

	@Override
	public ArrayList<ClubOpen> clubOpenSelectAdmin(int ClubNo) {
		return clubDao.clubOpenSelectAdmin(sqlSession, ClubNo);
	}

	@Override
	public int ajaxDeleteClubs(ArrayList<Club> deleteList) {
		return clubDao.ajaxDeleteClubs(sqlSession, deleteList);
	}

	@Override
	public int insertClubOpen(ClubOpen clubOpen) {
		return clubDao.insertClubOpen(sqlSession, clubOpen);
	}

	@Override
	public int ajaxInsertOpenMem(ClubOpen clubOpen) {
		return clubDao.ajaxInsertOpenMem(sqlSession, clubOpen);
	}

	@Override
	public int selectOpenMemNum(ClubOpen clubOpen) {
		return clubDao.selectOpenMemNum(sqlSession, clubOpen);
	}

	@Override
	public int insertChat(HashMap<String, String> map) {
		return clubDao.insertChat(sqlSession, map);
	}

	@Override
	public ArrayList<Socket> selectChat(int clubNo) {
		return clubDao.selectChat(sqlSession, clubNo);
	}

	

	 







	
}

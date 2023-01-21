package com.bi.billage.club.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.club.model.vo.Club;
import com.bi.billage.club.model.vo.ClubOpen;
import com.bi.billage.club.model.vo.Socket;
import com.bi.billage.common.model.vo.PageInfo;

@Repository
public class ClubDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("clubMapper.selectListCount");
	}
	
	public ArrayList<Club> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String condition){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("clubMapper.selectList", condition, rowBounds);
	}
	
	public int searchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("clubMapper.searchCount", map);
	}
	
	public ArrayList<Club> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String,String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("clubMapper.selectSearchList", map, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.update("clubMapper.increaseCount", club);
	}
	
	public Club selectDetailClub(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.selectOne("clubMapper.selectDetailClub", club);
	}
	
	//ClubOpen List Select : ClubNo에 따른 
	public ArrayList<ClubOpen> selectDetailClubOpen(SqlSessionTemplate sqlSession, Club club) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectDetailClubOpen", club);
	} 
	
	// 클럽 등록 
	public int insertClub(SqlSessionTemplate sqlSession, Club Club) {
		return sqlSession.insert("clubMapper.insertClub", Club);
	}
	
	// 클럽 등록 후 모임장 insert
	public int insertClubAdmin(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.insert("clubMapper.insertClubAdmin", club);
	}
	
	// 클럽 일반회원 리스트 조회
	public ArrayList<Club> clubGeneral(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("clubMapper.clubGeneral", userNo);
	}
	
	
	// 클럽 일반회원 club_member 테이블에서 삭제하기 
	public int ajaxDeleteClub(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.delete("clubMapper.ajaxDeleteClub", club); 
	}
	
	// 클럽 일반회원 club_member 테이블에 isnert 
	public int ajaxInsertClub(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.insert("clubMapper.ajaxInsertClub", club);
	}
	
	// 클럽 모임장 개설리스트 조회
	public ArrayList<Club> clubAdmin(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("clubMapper.clubAdmin", userNo);
	}
	
	// club club_member 회원리스트 조회
	public ArrayList<Club> clubMemberSelectAdmin(SqlSessionTemplate sqlSession, int clubNo){
		return (ArrayList)sqlSession.selectList("clubMapper.clubMemberSelectAdmin", clubNo);
	}
	
	// 회원 조아요 리스트 조회
	public ArrayList<Club> selectClubLike(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("clubMapper.selectClubLike", userNo);
	}
	
	// 클럽 찜하기 Insert
	public int clubLikeInsert(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.insert("clubMapper.clubLikeInsert", club);
	}

	// 클럽 찜하기 Delete
	public int clubLikeDelete(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.delete("clubMapper.clubLikeDelete", club);
	}
	
	// Club Count
	public int selectClubLikeCount(SqlSessionTemplate sqlSession, Club club) {
		return sqlSession.selectOne("clubMapper.selectClubLikeCount", club);
	}
	
	// ClubOpen List Select
	public ArrayList<ClubOpen> clubOpenSelectAdmin(SqlSessionTemplate sqlSession, int clubNo){
		return (ArrayList)sqlSession.selectList("clubMapper.clubOpenSelectAdmin", clubNo);
	}
	
	// Ajax  
	public int ajaxDeleteClubs(SqlSessionTemplate sqlSession, ArrayList<Club> deleteList) {
		return sqlSession.delete("clubMapper.ajaxDeleteClubs", deleteList);
	}
	
	//CLubOpen Insert Form
	public int insertClubOpen(SqlSessionTemplate sqlSession, ClubOpen clubOpen) {
		return sqlSession.insert("clubMapper.insertClubOpen", clubOpen);
	}
	
	// ClubOpen mem Insert
	public int ajaxInsertOpenMem(SqlSessionTemplate sqlSession, ClubOpen clubOpen) {
		return sqlSession.insert("clubMapper.ajaxInsertOpenMem", clubOpen);
	}
	
	// selectOpenMemNum
	public int selectOpenMemNum(SqlSessionTemplate sqlSession, ClubOpen clubOpen) {
		return sqlSession.selectOne("clubMapper.selectOpenMemNum", clubOpen);
	}
	
	//insertChat
	public int insertChat(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("clubMapper.insertChat", map);
	}
	
	//selectChat
	public ArrayList<Socket> selectChat(SqlSessionTemplate sqlSession, int clubNo) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectChat", clubNo);
	}
	
}

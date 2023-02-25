package com.bi.billage.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.board.model.vo.Book;
import com.bi.billage.board.model.vo.FAQ;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.board.model.vo.ReviewBoard;
import com.bi.billage.board.model.vo.ReviewReply;
import com.bi.billage.board.model.vo.Serial;
import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.board.model.vo.UsedBoard;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.heart.model.vo.ReviewLike;

@Repository
public class BoardDao {
	
	//휘수
	
	public int insertReport(SqlSession sqlSession, ReportBoard r) {
		
		return sqlSession.insert("reportMapper.insertReport", r);
	}
	
	
	public ArrayList<ReportBoard> selectReportList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectReportList");
	}
	
	public ReportBoard selectReport(SqlSession sqlSession, int rno) {
		
		return (ReportBoard)sqlSession.selectOne("reportMapper.selectReport", rno);
	}
	
	public int updateReportStatus(SqlSession sqlSession, int reviewNo) {
		
		return (int)sqlSession.update("reportMapper.updateReportStatus", reviewNo);
	}
	
	public int updateReviewStatus(SqlSession sqlSession, int reviewNo) {
		return (int)sqlSession.update("reportMapper.updateReviewStatus",reviewNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//=====================================휘수 구역 끝 =====================================================
	
	// 세헌
	
	
	public int insertDrawBoard(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.insert("ADBoardMapper.insertDrawBoard", b);
	}

	public ArrayList<ADBoard> selectDrawBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ADBoardMapper.selectDrawBoardList", null, rowBounds);
	}

	public int drawIncreaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.drawIncreaseCount", boardNo);
	}

	public ADBoard selectDrawBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("ADBoardMapper.selectDrawBoard", boardNo);
	}
	
	public int deleteDrawBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.deleteDrawBoard", boardNo);
	}

	public ArrayList<ADBoard> selectAuctionBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ADBoardMapper.selectAcutionBoardList", null, rowBounds);
	}

	public int insertAuctionBoard(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.insert("ADBoardMapper.insertAuctionBoard", b);
	}

	public int auctionIncreaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.auctionIncreaseCount", boardNo);
	}

	public ADBoard selectAuctionBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("ADBoardMapper.selectAuctionBoard", boardNo);
	}

	public int deleteAuctionBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.deleteAuctionBoard", boardNo);
	}

	public int insertDrawUser(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.insert("ADBoardMapper.insertDrawUser", b);
	}

	public int deleteDrawUser(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.insert("ADBoardMapper.deleteDrawUser", b);
	}

	public int checkDraw(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.selectOne("ADBoardMapper.checkDraw", b);
	}
	
	public ArrayList<Integer> selectPrizeUser(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("ADBoardMapper.selectPrizeUser", boardNo);
	}

	public int insertPrizeUser(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.update("ADBoardMapper.insertPrizeUser", b);
	}

	public int selectDrawPoint(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("ADBoardMapper.selectDrawPoint", boardNo);
	}

	public int insertBidUser(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.insert("ADBoardMapper.insertBidUser", b);
	}

	public int updatePrizeUser(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.update("ADBoardMapper.updatePrizeUser", b);
	}

	public int insertBuyer(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.insert("ADBoardMapper.insertBuyer", b);
	}

	public int updatePrizeEnd(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.updatePrizeEnd", boardNo);
	}





	
	
	
	// ===================유림 구역=======================================
	
	// 리뷰게시판
	
	
	// BOOK테이블에서 책제목과 일치하는 ISBN select
	public Book selectIsbn(SqlSessionTemplate sqlSession, String title) {
		return sqlSession.selectOne("reviewMapper.selectIsbn", title);
	}
	
	// 게시글의 총 개수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectListCount");
	}
	
	// 게시글 list 조회
	public ArrayList<ReviewBoard> reviewBoardList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reviewMapper.reviewBoardList", null, rowBounds);
	} 
	
	// 글작성 => 1) 중복되는 책 있는지 확인 select : bookTitle로 조회 => 한 행이 있는지 없는지
	public ReviewBoard selectBookTitle(SqlSessionTemplate sqlSession, ReviewBoard b) {
		return sqlSession.selectOne("reviewMapper.selectBookTitle", b); // selectOne은 값이 없으면 null로 리턴됨
	}
	
	// 글작성 => 2) 중복 된 책 없으면 insert : 글작성
	public int insertReviewBoard(SqlSessionTemplate sqlSession, ReviewBoard b) {
		return sqlSession.insert("reviewMapper.insertReviewBoard", b);
	}
	
	// 조회수 증가
	public int increaseReviewCount(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.insert("reviewMapper.increaseReviewCount", reviewNo);
	}
	
	// 조회 성공 시 => DB에서 데이터를 가져옴
	public ReviewBoard selectReviewBoard(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.selectOne("reviewMapper.selectReviewBoard", reviewNo);
	}
	
	// 게시글 삭제
	public int deleteReviewBoard(SqlSessionTemplate sqlSession, ReviewBoard b) {
		return sqlSession.update("reviewMapper.deleteReviewBoard", b);
	}
	
	// 글수정 => 1) 중복되는 책 있는지 확인(리뷰넘버로 책제목조회)
	public ReviewBoard selectBookTitle2(SqlSessionTemplate sqlSession, ReviewBoard b) {
		return sqlSession.selectOne("reviewMapper.selectBookTitle2", b);
	}
	
	// 게시글 수정
	public int updateReviewBoard(SqlSessionTemplate sqlSession, ReviewBoard b) {
		return sqlSession.update("reviewMapper.updateReviewBoard", b);
	}
	
	// 댓글 list 조회
	public ArrayList<ReviewReply> selectReviewReplyList(SqlSessionTemplate sqlSession, int reviewNo){
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewReplyList", reviewNo);
	}

	// 댓글 등록
	public int insertReviewReply(SqlSessionTemplate sqlSession, ReviewReply r) {
		return sqlSession.insert("reviewMapper.insertReviewReply", r);
	}
	
	// 댓글 삭제
	public int deleteReviewReply(SqlSessionTemplate sqlSession, ReviewReply r) {
		return sqlSession.update("reviewMapper.deleteReviewReply", r);
	}
	
	// 댓글 수정
	public int updateReviewReply(SqlSessionTemplate sqlSession, ReviewReply r) {
		return sqlSession.update("reviewMapper.updateReviewReply", r);
	}
	
	// 좋아요 누르면 insert
	public int insertReviewLike(SqlSessionTemplate sqlSession, ReviewLike r) {
		return sqlSession.insert("reviewMapper.insertReviewLike", r);
	}
	
	
	// 중고게시판
	
	// 글작성
	public int insertUsedBoard(SqlSessionTemplate sqlSession, UsedBoard b) {
		return sqlSession.insert("usedMapper.insertUsedBoard", b);	
	}
	
	// 게시글의 총 개수 조회
	public int selectListUsedCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("usedMapper.selectListUsedCount");
	}
	
	// 게시판 list 조회
	public ArrayList<UsedBoard> usedBoardList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("usedMapper.usedBoardList", null, rowBounds);
	}
	
	// 조회수 증가
	public int increaseUsedCount(SqlSessionTemplate sqlSession, int usedNo) {
		return sqlSession.update("usedMapper.increaseUsedCount", usedNo);
	}
	
	// 게시글 상세 조회 => DB에서 정보 가져 오기
	public UsedBoard selectUsedBoard(SqlSessionTemplate sqlSession, int usedNo) {
		return sqlSession.selectOne("usedMapper.selectUsedBoard", usedNo);
	}
	
	// 게시글 삭제
	public int deleteUsedBoard(SqlSessionTemplate sqlSession, int usedNo) {
		return sqlSession.update("usedMapper.deleteUsedBoard", usedNo);
	}
	
	// 게시글 수정버튼 클릭 시 => DB에서 게시글 정보 select해서 가져오기
	public UsedBoard selectUpdateUsedBoard(SqlSessionTemplate sqlSession, int usedNo) {
		return sqlSession.selectOne("usedMapper.selectUpdateUsedBoard", usedNo);
	}

	// 글수정 
	public int usedUpdate(SqlSessionTemplate sqlSession, UsedBoard b) {
		return sqlSession.update("usedMapper.usedUpdate", b);
	}
	
	// Top-N 분석
	public ArrayList<UsedBoard> selectTopUsed(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("usedMapper.selectTopUsed");
	}
	
	// 검색 기능 select
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return sqlSession.selectOne("usedMapper.selectSearchCount", map); 
	}

	// 검색 기능
	// 컬럼에 따라서 달라지기에 condition ..을 넣은 hashmap을 받아야함 + 추가적으로 페이징처리
	// RowBounds가 뭘까
	public ArrayList<UsedBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("usedMapper.selectSearchList", map, rowBounds);
	}
	
	
	
	// 유림끝  ===============================================================================

	
	
	
	// 광진구역 시작
	
	public int selectNovelListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("novelMapper.selectNovelListCount");
	}

	public ArrayList<Novel> selectNovelList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("novelMapper.selectNovelList", null, rowBounds);
	}

	public int selectSerialListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serialMapper.selectSerialListCount");
	}
	
	public ArrayList<Serial> selectSerialList(SqlSessionTemplate sqlSession, PageInfo pi, int novelNo) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("serialMapper.selectSerialList", novelNo, rowBounds);
		
	}

	public Serial selectSerialDetail(SqlSessionTemplate sqlSession, int novelNo, String serialNo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("serial_no", serialNo);
		map.put("novel_no", novelNo);
		return sqlSession.selectOne("serialMapper.selectSerialDetail", map);
		}
	
	public int insertSerialRequest(SqlSessionTemplate sqlSession, SerialRequest sr) {
		return sqlSession.insert("serialMapper.insertSerialRequest", sr);
	}

	public int insertNovel(SqlSessionTemplate sqlSession, Novel n) {
		return sqlSession.insert("novelMapper.insertNovel", n);
	}

	public int insertSerial(SqlSessionTemplate sqlSession, Serial se, Integer novelNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("se", se);
		map.put("novelNo", novelNo);
		return sqlSession.insert("serialMapper.insertSerial", map);
	}

	public Novel selectNovelInfo(SqlSessionTemplate sqlSession, int novelNo) {
		return sqlSession.selectOne("novelMapper.selectNovelinfo", novelNo);
	}

	public ArrayList<FAQ> selectFaqList(SqlSessionTemplate sqlSession, FAQ faq) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectFaqList", faq);
	}

	public int novelLikeDelete(SqlSessionTemplate sqlSession, Novel novel) {
		return sqlSession.delete("novelMapper.novelLikeDelete", novel);
	}

	public int novelLikeInsert(SqlSessionTemplate sqlSession, Novel novel) {
		return sqlSession.insert("novelMapper.novelLikeInsert", novel);
	}

	public int selectNovelLikeCount(SqlSessionTemplate sqlSession, Novel novel) {
		return sqlSession.selectOne("novelMapper.selectNovelLikeCount", novel);
	}


	public int chnageLikeBtnNovel(SqlSessionTemplate sqlSession, Novel nv) {
		return sqlSession.selectOne("novelMapper.chnageLikeBtnNovel", nv);
	}

	public int novelLike(SqlSessionTemplate sqlSession, Novel nv) {
		return sqlSession.insert("novelMapper.novelLike", nv);
	}

	public int novelCancel(SqlSessionTemplate sqlSession, Novel nv) {
		return sqlSession.delete("novelMapper.novelCancel", nv);
	}


	
	


	



	




	

	


	


	



	// 광진구역 끝

}

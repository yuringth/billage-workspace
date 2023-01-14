package com.bi.billage.club.model.vo;

import java.sql.Date;

import lombok.Data;

@Data	
public class Club {
	
	private int clubNo; //CLUB_NO	NUMBER
	private int userNo; //USER_NO	NUMBER
	private String clubName; //CLUB_NAME	VARCHAR2(300 BYTE)
	private int clubLimit; // CLUB_LIMIT	NUMBER
	private String clubCreatedate;//CLUB_CREATEDATE	DATE
	private String clubDiscript; //CLUB_DISCRIPT	VARCHAR2(4000 BYTE)
	private String clubImg; //CLUB_IMG	VARCHAR2(4000 BYTE)
	private String clubLocation; //CLUB_LOCATION	VARCHAR2(100 BYTE)
	private String clubCount;
	private String clubStatus; //CLUB_STATUS	VARCHAR2(1 BYTE)
	private String nickname;
	private String newCount; // 새로 등록된 모임인지 아닌지 컬럼값으로 가져옴 
	private int likeCount; // 클럽 현재 좋아요 수 
	private int memCount; // 클럽 현재 멤버 수 
	private int openCount; // 여태껏 클럽 갯수
	private Date enrollDate;
}

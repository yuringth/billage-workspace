package com.bi.billage.club.model.vo;

import java.sql.Date;

import lombok.Data;

@Data	
public class Club {
	
	private int clubNo; //CLUB_NO	NUMBER
	private String userNo; //USER_NO	NUMBER
	private String clubName; //CLUB_NAME	VARCHAR2(300 BYTE)
	private int clubLimit; // CLUB_LIMIT	NUMBER
	private Date clubCreatedate;//CLUB_CREATEDATE	DATE
	private String clubDiscript; //CLUB_DISCRIPT	VARCHAR2(4000 BYTE)
	private String clubImg; //CLUB_IMG	VARCHAR2(4000 BYTE)
	private String clubLocation; //CLUB_LOCATION	VARCHAR2(100 BYTE)
	private String clubStatus; //CLUB_STATUS	VARCHAR2(1 BYTE)
	private String nickname;
	private String newCount;
	private int groupCount;
	private int likeCount;
}

package com.bi.billage.board.model.vo;

import lombok.Data;

@Data
public class ReviewReply {

	private int replyNo; //REPLY_NO	NUMBER
	private int userNo; //USER_NO	NUMBER
	private int reviewNo; //REVIEW_NO	NUMBER
	private String createDate; //CREATE_DATE	DATE
	private String replyContent; //REPLY_CONTENT	VARCHAR2(2000 BYTE)
	private String deleteStatus; //DELETE_STATUS	VARCHAR2(2 BYTE)
	private String userId; //DELETE_STATUS	VARCHAR2(2 BYTE)



}

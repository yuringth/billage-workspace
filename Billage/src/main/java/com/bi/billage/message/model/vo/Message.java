package com.bi.billage.message.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Message {
	
	private int messageNo;
	private int userNo; //보낸 사람
	private int userNo2; //받는 사람
	private String messageContent;
	private String messageDate;
	private int messageStatus; //읽음확인여부
	
	private String userId;
	private String nickname;
	
	private String userId2;
	private String nickname2;
	
	private String title;
}

package com.bi.billage.message.model.vo;

import lombok.Data;

@Data
public class Message {
	
	private int userNo; //보낸 사람
	private int userNo2; //받는 사람
	private String messageContent;
	private String Date;
	private int messageStatus; //읽음확인여부
	
}

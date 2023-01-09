package com.bi.billage.board.model.vo;

import lombok.Data;

@Data
public class ADBoard {
	
	private int boardNo;
	private String prizeUser;
	private String userNo; //작성자
	private String acceptStatus;
	private int tryPoint;
	private String closeDate;
	private String title;
	private String content;
	private int count;
	private String status;
	private String thumbnail;
	private String createDate;
	private String bookWriter;
	private String genre;
	private String originName;
	private String changeName;
	
	private int startPrice;
	private int InstantlyPrice;
	private int bidPrice;
	private int nowPrice;

}

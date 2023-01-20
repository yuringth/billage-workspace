package com.bi.billage.club.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Socket {
	
	private int socketNo; //SOCKET_NO	NUMBER  SEQ_SOCNO
	private int userNo; //USER_NO	NUMBER
	private int clubNo; //CLUB_NO	NUMBER
	private String message; //MESSAGE	VARCHAR2(4000 BYTE)
	private Date socketDate; // SOCKET_DATE	DATE
	private String socketStatus; //SOCKET_STATUS	VARCHAR2(1 BYTE)
	
}

package com.bi.billage.point.model.vo;

import lombok.Data;

@Data
public class Point {
	private int userNo;			//유저 번호
	private int pointAdd;		// 사용한 포인트 음수/양수로 등록 ex) "100p 충전 시  100" / "200p 사용 시 -200"
	private String pointDate;   // 사용한 날짜
	private String pointStatus; // 사용내역 : 충전/사용/적립/정산  이 4가지로 통일
}

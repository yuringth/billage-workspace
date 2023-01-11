package com.bi.billage.follow.model.vo;

import lombok.Data;

@Data
public class Follow {
	
	private int userNo1;
	private int userNo2;
	
	public Follow(int userNo1, int userNo2) {
		super();
		this.userNo1 = userNo1;
		this.userNo2 = userNo2;
	}

	
}

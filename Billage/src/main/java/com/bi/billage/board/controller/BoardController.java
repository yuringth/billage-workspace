package com.bi.billage.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("list.nv")
	public String novelListView() {
		return "board/novelBoard/novelListView";
	}
	
	@RequestMapping("list.se")
	public String serialListView() {
		return "board/serialBoard/serialListView";
	}

}

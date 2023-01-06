package com.bi.billage.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	
	@RequestMapping("list.ms")
	public String messageList() {
		return "message/messageListView";
	}
	@RequestMapping("sendList.ms")
	public String messageSendList() {
		return "message/messageSendListView";
	}
	@RequestMapping("sendForm.ms")
	public String messageSendForm() {
		return "message/messageSendForm";
	}
}

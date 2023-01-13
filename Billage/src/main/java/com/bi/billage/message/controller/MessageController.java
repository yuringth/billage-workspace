package com.bi.billage.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bi.billage.message.model.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
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

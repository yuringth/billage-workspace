package com.bi.billage.common.socket;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketServer extends TextWebSocketHandler {
	
	
	/*
	 * 사용자 기억하기 위한 저장소
	 * - 중복 불가 / 
	 *  동기화 지원
	 */
	
	private Set<WebSocketSession> users = new CopyOnWriteArraySet();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		users.add(session);
		System.out.println("사용자 접속 : " + users.size() + "명");
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메시지를 모든 사용자에게 전송 (사용자의 수만큼 반복해서 전송)
		// payLoad 필드에 있는 사용자가 실제로 보낸 내용 (본문) 
		TextMessage newMessage = new TextMessage(message.getPayload());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		System.out.println("사용자 접속 ! 현재 " + users.size() + "명");
	}
	
	
	
	
	
}

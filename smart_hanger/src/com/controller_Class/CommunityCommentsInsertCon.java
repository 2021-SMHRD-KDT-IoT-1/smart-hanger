package com.controller_Class;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Board_commentsDAO;
import com.Model.Board_commentsDTO;
import com.Model.Cody_board_commentsDAO;
import com.Model.Cody_board_commentsDTO;
import com.Model.MemberDTO;
import com.command.Command;

public class CommunityCommentsInsertCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String moveURL = "";
	
		
		
		// ���� �޾ƿ�
		String userId = ((MemberDTO)session.getAttribute("userInfo")).getUserId();
		String board_num = request.getParameter("num");
		String comment =request.getParameter("comment");
		
		System.out.println(comment);
		
		
		
		Board_commentsDAO dao = new Board_commentsDAO();
		
		int cnt = dao.Board_comments_Insert(new Board_commentsDTO( userId, board_num,comment));  
		
		// from �±׿��� submit���� �޾� ���°Ŵ� ��� ���
		
		//dao���� ��� ����ϴ°� ã�ƺ� �����ž�
		
		
		
		
		
		
		if(cnt>0) {
			System.out.println("��� ����");
		}else {
			System.out.println("��� ����");
			
			
			 
			
		}
	    moveURL = "viewCommu.jsp?board_num=" + board_num;
		
		
		return moveURL;
	}

}

package com.controller_Class;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Cody_board_commentsDAO;
import com.Model.Cody_board_commentsDTO;
import com.Model.MemberDTO;
import com.command.Command;

public class CodyCommentsInsertCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String moveURL = "";
	
		
		
		// 변수 받아옴
		//String userId = ((MemberDTO)session.getAttribute("userInfo")).getUserId();
		String userId = "aa";
		String board_num = request.getParameter("num");
		String comment =request.getParameter("comment");
		
		System.out.println(comment);
		
		
		
		Cody_board_commentsDAO dao = new Cody_board_commentsDAO();
		
		int cnt = dao.Cody_clothes_Insert(new Cody_board_commentsDTO( userId, board_num,comment));  
		// from 태그에서 submit으로 받아 오는거니 댓글 등록
		
		//dao에서 댓글 등록하는거 찾아봐 있을거야
		
		
		
		
		
		
		if(cnt>0) {
			System.out.println("댓글 성공");
		}else {
			System.out.println("댓글 실패");
			
			
			 
			
		}
	    moveURL = "viewStylist.jsp?num=" + board_num;
		
		
		return moveURL;
	}

}

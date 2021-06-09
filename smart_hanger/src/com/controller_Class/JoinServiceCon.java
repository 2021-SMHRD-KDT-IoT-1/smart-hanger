package com.controller_Class;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDAO;
import com.Model.MemberDTO;
import com.command.Command;

public class JoinServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = null;
		
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// �� �޾ƿ���
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");


	
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(new MemberDTO(userId, userPw, userName, userAge));

		if (cnt > 0) {
			//System.out.println("ȸ������ ����");

			moveURL = "zSmart_hanger/user_manager/join_success.jsp";
			
		} else {
			System.out.println("ȸ������ ����");
			moveURL = "main.jsp";
			
		}

		return moveURL;
	}

}

package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import Model.ClothMemberDAO;
import Model.ClothMemberDTO;

import com.Model.MemberDAO;
import com.Model.MemberDTO;

public class JoinServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = null;
		
		// 값 받아오기
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");

		
		System.out.println(userId);
		System.out.println(userPw);
		System.out.println(userName);
		System.out.println(userAge);
		
		
		MemberDTO dto = new MemberDTO(userId, userPw, userName, userAge);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);

		if (cnt > 0) {
			System.out.println("회원가입 성공");

			HttpSession session = request.getSession();
			session.setAttribute("email", userId);
			moveURL = "join_success.jsp";
			
		} else {
			System.out.println("회원가입 실패");
			moveURL = "Main.jsp";
			
		}

		return moveURL;
	}

}

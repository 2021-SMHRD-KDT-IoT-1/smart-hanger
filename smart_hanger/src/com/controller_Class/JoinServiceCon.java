package com.controller_Class;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.MemberDAO;
import com.Model.MemberDTO;


@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String moveURL = null;
		
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 값 받아오기
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");


	
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(new MemberDTO(userId, userPw, userName, userAge));

		if (cnt > 0) {
			//System.out.println("회원가입 성공");

			moveURL = "zSmart_hanger/user_manager/join_success.jsp";
			
		} else {
			System.out.println("회원가입 실패");
			moveURL = "zSmart_hanger/user_manager/join_fail.jsp";
			
		}

		response.setCharacterEncoding("utf-8");
		response.sendRedirect(moveURL);
	}
}

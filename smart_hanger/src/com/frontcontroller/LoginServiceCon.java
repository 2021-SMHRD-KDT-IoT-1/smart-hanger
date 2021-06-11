package com.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDAO;
import com.Model.MemberDTO;

/**
 * Servlet implementation class LoginServiceCon
 */
@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		
		

		// 값 받아오기.

		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		// rok , 123

		MemberDTO dto = new MemberDTO(userId, userPw);
		MemberDAO dao = new MemberDAO();
		MemberDTO resultDTO = dao.login(dto);

		if (resultDTO != null) {

			HttpSession session = request.getSession();
			session.setAttribute("userInfo", resultDTO);
			
			out.print("goMainPage");			
		} else {
			System.out.println("로그인 실패");

			HttpSession session = request.getSession();
			session.invalidate();

			response.sendRedirect("zSmart_hanger/user_manager/login_fail.jsp");
		}

		
	}

}

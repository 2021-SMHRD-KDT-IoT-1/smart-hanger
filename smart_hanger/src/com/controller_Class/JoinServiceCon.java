package com.controller_Class;

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
		
		// �� �޾ƿ���
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("name");
		String addr = request.getParameter("age");

		MemberDTO dto = new MemberDTO(email, pw, tel, addr);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);

		if (cnt > 0) {
			System.out.println("ȸ������ ����");

			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			moveURL = "join_success.jsp";
			
		} else {
			System.out.println("ȸ������ ����");
			moveURL = "main.jsp";
			
		}

		return moveURL;
	}

}

package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import Model.ClothMemberDAO;
import Model.ClothMemberDTO;

import Model.ClothMemberDAO;
import Model.ClothMemberDTO;

public class JoinServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = null;
		
		// �� �޾ƿ���
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("name");
		String addr = request.getParameter("age");

		ClothMemberDTO dto = new ClothMemberDTO(email, pw, tel, addr);
		ClothMemberDAO dao = new ClothMemberDAO();
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

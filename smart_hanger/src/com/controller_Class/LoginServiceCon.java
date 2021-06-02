package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDAO;
import com.Model.MemberDTO;
import com.command.Command;

public class LoginServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = null;

		// �� �޾ƿ���.

		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		// rok , 123

		MemberDTO dto = new MemberDTO(userId, userPw);
		MemberDAO dao = new MemberDAO();
		MemberDTO resultDTO = dao.login(dto);

		if (resultDTO != null) {
			System.out.println("�α��� ����");

			HttpSession session = request.getSession();
			session.setAttribute("userInfo", resultDTO);
		} else {
			System.out.println("�α��� ����");

			HttpSession session = request.getSession();
			session.removeAttribute("dto");
		}

		moveURL = "Main.jsp";

		return moveURL;
	}

}

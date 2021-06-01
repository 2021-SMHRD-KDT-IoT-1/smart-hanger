package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import Model.ClothMemberDAO;
import Model.ClothMemberDTO;

public class LoginServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = null;

		// 값 받아오기.

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		// rok , 123

		ClothMemberDTO dto = new ClothMemberDTO(email, pw);
		ClothMemberDAO dao = new ClothMemberDAO();
		ClothMemberDTO resultDTO = dao.login(dto);

		if (resultDTO != null) {
			System.out.println("로그인 성공");

			HttpSession session = request.getSession();
			session.setAttribute("dto", resultDTO);
		} else {
			System.out.println("로그인 실패");

			HttpSession session = request.getSession();
			session.removeAttribute("dto");
		}

		moveURL = "Main.jsp";

		return moveURL;
	}

}

package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.Model.MemberDAO;
import com.Model.MemberDTO;

public class MemberUpdateServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String moveURL = null;
		
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("userInfo");
		
		String userId = dto.getUserId();
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		
		MemberDTO updateDto = new MemberDTO(userId, userPw, userName, userAge);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(updateDto);
		
		if(cnt > 0) {
			System.out.println("회원정보 수정 성공!");
			session.setAttribute("userInfo", updateDto);
			
			moveURL = "Main.jsp";
		}else {
			System.out.println("회원정보 수정 실패!");
			moveURL = "MemberUpdate.jsp";
		}

		
		return moveURL;
	}

}

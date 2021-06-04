package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.ServiceDAO;
import com.Model.ServiceDTO;
import com.command.Command;

public class UserServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String moveURL = null;
		
		
		String userId = request.getParameter("UserId");
		String Title = request.getParameter("Title");
		String Content = request.getParameter("Content");
		
		ServiceDTO dto = new ServiceDTO(userId, Title, Content);
		ServiceDAO dao = new ServiceDAO();
		
		int cnt = dao.Service_Insert(dto);
		
		
		if(cnt > 0) {
			System.out.println("메시지 전송 성공");
		}else {
			System.out.println("메시지 전송 실패");
		}
		
		moveURL = "service.jsp";
		
		
		return moveURL;
	}

}

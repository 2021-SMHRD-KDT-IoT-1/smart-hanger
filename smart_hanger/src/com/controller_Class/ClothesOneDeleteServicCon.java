package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.MemberDAO;
import com.command.Command;

public class ClothesOneDeleteServicCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String moveURL = null;
		String num = request.getParameter("message_num");
		
		
		
		MemberDAO dao = new MemberDAO();
		int cnt = 0;// dao.deleteOneMessage(num);
	
		if(cnt >0) {
			System.out.println("�޽��� �ϳ� ���� �Ϸ�");
		}else {
			System.out.println("�޽��� �ϳ� ���� ���ФФФ�");
		}
		
		moveURL ="main.jsp";
				
		return moveURL;
	}

}

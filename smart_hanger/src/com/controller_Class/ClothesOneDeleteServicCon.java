package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.MemberDAO;
import com.Model.My_clothesDAO;
import com.command.Command;

public class ClothesOneDeleteServicCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String moveURL = null;
		
		String num = request.getParameter("num");
		
		
		
		My_clothesDAO dao = new My_clothesDAO();
		int cnt = dao.My_clothes_One_delete(num);
	
		
		
		
		
		if(cnt >0) {
			//System.out.println("삭세 성공");
		}else {
			System.out.println("옷 삭제 실패ㅠㅠㅠ");
		}
		
		moveURL ="Main.jsp";
				
		return moveURL;
	}

}

package com.controller_Class;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.Board_commentsDAO;
import com.Model.Cody_Board_DAO;
import com.Model.CommunityDAO;


@WebServlet("/CommunityBoardLikeUpdate")
public class CommunityBoardLikeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		
		
		
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		String userId = request.getParameter("userId");
		String check =  request.getParameter("check");
		
		CommunityDAO communityDAO = new CommunityDAO();
		
		int dao_state = communityDAO.Community_Board_Like(check ,num, userId);
		
		// 새롭게 반영됨
		if (dao_state == 2) {
			out.print(2);
		
		// 좋아요 기록 있음
		}else if(dao_state == 1){
			out.print(1);
			
			
		// 좋아요 기록 없음
		}else if(dao_state == 0) {
			out.print(0);
			
		}
		
	}

}

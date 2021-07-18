package com.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.ArduinoDAO;
import com.Model.ArduinoDTO;


@WebServlet("/Arduidno_change2")
public class Arduidno_change2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("EUC-KR");
		String set =  request.getParameter("set");
		String userId = request.getParameter("userId");
		String num = request.getParameter("num");
		
		ArduinoDAO dao = new ArduinoDAO();
		
		ArrayList<String> list = dao.Ones_Select(num);
		
		for (int i = 0; i < list.size(); i++) {
			
			dao.One_Select(userId, list.get(i), set);
			
		}
		
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("EUC-KR");
		

		//out.print(list.get(i).getState() );

		
		
		
		
	}

}

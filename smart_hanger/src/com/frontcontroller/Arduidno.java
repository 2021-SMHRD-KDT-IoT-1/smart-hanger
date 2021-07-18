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


@WebServlet("/Arduidno")
public class Arduidno extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("EUC-KR");
		String userId = request.getParameter("userId");
		
		
		ArduinoDAO dao = new ArduinoDAO();
		
		ArrayList<ArduinoDTO> list = dao.All_Select (userId);
		
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("EUC-KR");
		
		for (int i = 0; i < list.size(); i++) {
			out.print(list.get(i).getCloth_num() );
			out.print('A');
			out.print(list.get(i).getState() );
			out.print('B');
			
		}
		
		
		
		
	}

}

package com.controller_Class;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDTO;
import com.Model.My_clothesDAO;
import com.Model.My_clothesDTO;
import com.command.Command;

public class AddServiceCon2 implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// title, writer, content에 대한 인코딩
		
		String board_num = "";
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String moveURL = null;
		HttpSession session = request.getSession();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String local_time = format.format(time);
		local_time = local_time.replace(" ", "_");
		local_time = local_time.replace(":", "-");


		String savePath = request.getServletContext().getRealPath("cloth_img");
		
		
		try {

			// 데이터베이스에 저장하기위해서 fileName, title, content 등의 정보 가져오기.
			//String userId = "a";
			String userId = ((MemberDTO)session.getAttribute("userInfo")).getUserId();
			String clothesType = "no";
			String clothesName = request.getParameter("title");
			String memo = request.getParameter("memo");
			String img_type = request.getParameter("img_type");
			
			


			File file = new File(savePath + "\\blob");
			

			// 파일 받기로 저장된 blob에 이름은 [현재날짜_시간]으로 저장함
			file.renameTo(new File(savePath + "\\" + local_time + ".png"));

			String clothespath = local_time + ".png";

			My_clothesDAO dao = new My_clothesDAO();

			board_num = dao.My_clothes_Insert(new My_clothesDTO(userId, clothesName, clothesType, memo, clothespath));

			moveURL = "viewCloth.jsp?num=" + board_num;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(board_num);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return moveURL;

	}

}

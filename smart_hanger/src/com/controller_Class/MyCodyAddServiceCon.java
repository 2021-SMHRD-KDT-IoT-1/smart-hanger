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
import com.Model.My_codyDAO;
import com.Model.My_codyDTO;
import com.command.Command;

public class MyCodyAddServiceCon implements Command {

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


		String savePath = request.getServletContext().getRealPath("myCody");
		
		
		try {

			// 데이터베이스에 저장하기위해서 fileName, title, content 등의 정보 가져오기.
			//String userId = "a";
			String userID = ((MemberDTO)session.getAttribute("userInfo")).getUserId();
			String clothesname = request.getParameter("title");
			String memo = request.getParameter("memo");
			//String img_type = request.getParameter("img_type");
			
			


			File file = new File(savePath + "\\blob");
			

			// 파일 받기로 저장된 blob에 이름은 [현재날짜_시간]으로 저장함
			file.renameTo(new File(savePath + "\\" + local_time + ".png"));

			String codypath = local_time + ".png";

			My_codyDAO dao = new My_codyDAO();

			board_num = dao.My_cody_Insert(new My_codyDTO(userID, clothesname, memo, codypath));

			moveURL =  board_num;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return moveURL;

	}

}

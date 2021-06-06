package com.controller_Class;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Cody_Board_DAO;
import com.Model.Cody_Board_DTO;
import com.Model.Cody_board_commentsDAO;
import com.Model.MemberDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CodyAddServiceCon__delete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// title, writer, content�� ���� ���ڵ�
		
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


		String savePath = request.getServletContext().getRealPath("cody_img");
		
		
		try {

			// �����ͺ��̽��� �����ϱ����ؼ� fileName, title, content ���� ���� ��������.
			//String userId = "a";
			String userId = ((MemberDTO)session.getAttribute("userInfo")).getUserId();
			String clothesType = "no";
			String clothesName = request.getParameter("title");
			String memo = request.getParameter("memo");
			
			


			File file = new File(savePath + "\\blob");
			

			// ���� �ޱ�� ����� blob�� �̸��� [���糯¥_�ð�]���� ������
			file.renameTo(new File(savePath + "\\" + local_time + ".png"));

			String clothespath = local_time + ".png";
			
			Cody_Board_DAO dao = new Cody_Board_DAO();
			
			String cody_board_num =  dao.Cody_BoardInsert(new Cody_Board_DTO(userId, memo, local_time + ".png"));
			
			
			moveURL="viewStylist.jsp?num=" + cody_board_num;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return moveURL;
		
		
		
		
	}

}

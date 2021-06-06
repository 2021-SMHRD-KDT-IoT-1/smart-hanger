package com.controller_Class;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.Model.Cody_Board_DAO;
import com.Model.Cody_Board_DTO;
import com.Model.MemberDTO;
import com.Model.My_clothesDAO;
import com.Model.My_clothesDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CodyAddformServiceCon2 implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// title, writer, content�� ���� ���ڵ�

		HttpSession session = request.getSession();


		String moveURL = null;

		// �̹����� ���� ��� ����(���� �� ����)
		// getServletContext : ������ ����
		// getRealPath : ���� ���
		String savePath = request.getServletContext().getRealPath("cody_img");

		// �̹��� ũ�� ����
		int maxSize = 5 * 1024 * 1024;

		// ���� �̸� ���ڵ� ����
		String encoding = "EUC-KR";

		// ���� �̸�
		String clothespath = "";

		try {

			// cos.jar ���Ͼȿ� �ִ� Ŭ���� ���
			// ��û, ������, ������ �ִ� ũ��, ���ڵ� ���, DefaultFileRenamePolicy : �̹��������ߺ�����

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
					new DefaultFileRenamePolicy());

			// �����ͺ��̽��� �����ϱ����ؼ� fileName, title, content ���� ���� ��������.
			String userId = (String) ((MemberDTO) session.getAttribute("userInfo")).getUserId();
			String codycontent = multi.getParameter("memo");
			String codypath = multi.getFilesystemName("img_file");
			
			
			Cody_Board_DAO dao = new Cody_Board_DAO();
			
			String cody_board_num =  dao.Cody_BoardInsert(new Cody_Board_DTO(userId, codycontent, codypath));
			
			
			moveURL="zSmart_hanger/cloth/viewStylist.jsp?num=" + cody_board_num;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return moveURL;
		

	}

}

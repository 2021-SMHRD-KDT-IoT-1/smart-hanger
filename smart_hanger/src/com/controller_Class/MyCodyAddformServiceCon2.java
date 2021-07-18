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

import com.Model.MemberDTO;
import com.Model.My_clothesDAO;
import com.Model.My_clothesDTO;
import com.Model.My_codyDAO;
import com.Model.My_codyDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MyCodyAddformServiceCon2 implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// title, writer, content�� ���� ���ڵ�

		HttpSession session = request.getSession();


		String moveURL = null;

		// �̹����� ���� ��� ����(���� �� ����)
		// getServletContext : ������ ����
		// getRealPath : ���� ���
		String savePath = request.getServletContext().getRealPath("myCody");

		// �̹��� ũ�� ����
		int maxSize = 5 * 1024 * 1024;

		// ���� �̸� ���ڵ� ����
		String encoding = "EUC-KR";

		// ���� �̸�
		String clothespath = "";

		try {

			// cos.jar ���Ͼȿ� �ִ� Ŭ���� ���
			// ��û, ������, ������ �ִ� ũ��, ���ڵ� ���, DefaultFileRenamePolicy : �̹��������ߺ�����

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,	new DefaultFileRenamePolicy());

			// �����ͺ��̽��� �����ϱ����ؼ� fileName, title, content ���� ���� ��������.
			String userID = (String) ((MemberDTO) session.getAttribute("userInfo")).getUserId();
			String clothesname = multi.getParameter("title");
			String memo = multi.getParameter("memo");
			clothespath = multi.getFilesystemName("img_file");
			


			My_codyDAO dao = new My_codyDAO();

			String cody_num = dao.My_cody_Insert(new My_codyDTO(userID, clothesname, memo, clothespath));

			
			
			
			
			
			moveURL = "viewCody.jsp?num=" + cody_num;

		} catch (IOException e) {
			e.printStackTrace();
		}

		return moveURL;

	}

}

package com.controller_Class;

<<<<<<< HEAD
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.My_clothesDAO;
import com.Model.My_clothesDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ClothesUpdateServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = null;
		String num = null;

		String savePath = request.getServletContext().getRealPath("cloth_img");

		// �̹��� ũ�� ����
		int maxSize = 5 * 1024 * 1024;

		// ���� �̸� ���ڵ� ����
		String encoding = "EUC-KR";

		// cos.jar ���Ͼȿ� �ִ� Ŭ���� ���
		// ��û ,������ , �������ִ�ũ��, ���ڵ����, DefaultFileRenamePolicy : �̹��������ߺ�����

		System.out.println("�غ�!");
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());

			// �����ͺ��̽��� �����ϱ� ���ؼ� fileName, title, content ���� ���� ��������

			String fileName = URLEncoder.encode(multi.getFilesystemName("fileName"),"EUC-KR");
			String Clothtext = multi.getParameter("Clothtext");
			String Clothtextarea = multi.getParameter("Clothtextarea");
			num = multi.getParameter("num");

			// �̹����±׿� �ۼ��� 16������ ��Ÿ������ؼ� ���ڵ��� ��
			//  String fileName = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
			
			My_clothesDTO dto = new My_clothesDTO(num, Clothtext, Clothtextarea, fileName);
			My_clothesDAO dao = new My_clothesDAO();

			// My_clothesDTO dto = new My_clothesDTO(Clothtext, Clothtextarea, fileName);
			// My_clothesDAO dao = new My_clothesDAO();

			int cnt = dao.My_clothes_Update(dto);

			if (cnt > 0) {
				System.out.println("������Ʈ ����");
			} else {
				System.out.println("������Ʈ ����");
			}
			
		} catch (Exception e) {

		}

		System.out.println(num);
		moveURL = "viewCloth.jsp?num=" + num;

		return moveURL;

	}
=======
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.My_clothesDAO;
import com.Model.My_clothesDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ClothesUpdateServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// title, writer, content�� ���� ���ڵ�
		String moveURL = null;		
		
		try {

					// �̹����� ���� ��� ����(���� �� ����)
					// getServletContext : ������ ����
					// getRealPath : ���� ���
					String savePath = request.getServletContext().getRealPath("cloth_img");


					// �̹��� ũ�� ����
					int maxSize = 5 * 1024 * 1024;

					// ���� �̸� ���ڵ� ����
					String encoding = "EUC-KR";
					
					// cos.jar ���Ͼȿ� �ִ� Ŭ���� ���
					// ��û, ������, ������ �ִ� ũ��, ���ڵ� ���, DefaultFileRenamePolicy : �̹��������ߺ�����
					MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
					
					
					// �����ͺ��̽��� �����ϱ����ؼ� fileName, title, content ���� ���� ��������
					String title = multi.getParameter("title");
					String memo = multi.getParameter("memo");
					String num = multi.getParameter("num");
					
					// �̹����±׿� �ۼ� �� 16������ ��Ÿ������ؼ� ���ڵ��� ����
					String fileName = URLEncoder.encode(multi.getFilesystemName("img_file"), "EUC-KR");
					
					My_clothesDTO dto = new My_clothesDTO(num, title, memo, fileName);
					My_clothesDAO dao = new My_clothesDAO();

					int cnt = dao.My_clothes_Update(dto);

					if (cnt > 0) {
						moveURL="viewCloth.jsp?num="+ num;
					} else {
						moveURL="ERROR";
					}
					
					
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	

	return moveURL;

}
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git

}

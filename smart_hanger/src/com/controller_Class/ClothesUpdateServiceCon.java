package com.controller_Class;

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
					// getServletContext : �������� ����
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
					String num = multi.getParameter("num");   // hidden �Ӽ����� ����
					String old_img_path = multi.getParameter("old_img_path");     // hidden �Ӽ����� ����
					
					// �̹����±׿� �ۼ� �� 16������ ��Ÿ������ؼ� ���ڵ��� ����
					String fileName = old_img_path;
					try {
						fileName = URLEncoder.encode(multi.getFilesystemName("img_file"), "EUC-KR");
						
					} catch (Exception e) {
						//System.out.println("���� ����");
					}

					My_clothesDAO dao = new My_clothesDAO();

					int cnt = dao.My_clothes_Update(new My_clothesDTO(num, title, memo, fileName));
					
				
					moveURL="viewCloth.jsp?num="+ num;
		
					
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	

	return moveURL;

}

}
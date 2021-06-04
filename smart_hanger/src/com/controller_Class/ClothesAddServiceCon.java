package com.controller_Class;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.Model.MemberDTO;
import com.Model.My_clothesDAO;
import com.Model.My_clothesDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ClothesAddServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// title, writer, content�� ���� ���ڵ�
		
		
		HttpSession session = request.getSession();
		
		
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
					
					
					// �����ͺ��̽��� �����ϱ����ؼ� fileName, title, content ���� ���� ��������.
					String userId = (String)((MemberDTO)session.getAttribute("userInfo")).getUserId();
					String clothesType = "no";
					String clothesName = multi.getParameter("title");
					String memo = multi.getParameter("memo");
					//String clothespath = URLEncoder.encode(multi.getFilesystemName("img_file"), "EUC-KR");
					String clothespath = multi.getFilesystemName("img_file");

					
					
					
					My_clothesDAO dao = new My_clothesDAO();

					String clothes_num = dao.My_clothes_Insert(new My_clothesDTO(userId, clothesName, clothesType, memo, clothespath));
					
				
					moveURL="viewCloth.jsp?num="+ clothes_num;
		
					
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	

	return moveURL;

}

}

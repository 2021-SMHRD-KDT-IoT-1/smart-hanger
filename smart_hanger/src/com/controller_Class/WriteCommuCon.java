package com.controller_Class;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.CommunityDAO;
import com.Model.CommunityDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteCommuCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String savePath = request.getServletContext().getRealPath("clothespath");

		System.out.println(savePath);

		int maxSize = 5 * 1024 * 1024;

		String encoding = "EUC-KR";

		// cos.jar ���Ͼȿ� �ִ� Ŭ���� ���
		// ��û, ������, ������ �ִ� ũ��, ���ڵ� ���, DefaultFileRenamePolicy : �̹��������ߺ�����
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding,
					new DefaultFileRenamePolicy());
		
			// �����ͺ��̽��� �����ϱ����ؼ� fileName, title, content ���� ���� ��������
			String title = multi.getParameter("title");
			String userid = multi.getParameter("userid");
			// �̹����±׿� �ۼ� �� 16������ ��Ÿ������ؼ� ���ڵ��� ����
			String clothespath = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
			String content = multi.getParameter("content");

			System.out.println(title);
			System.out.println(userid);
			System.out.println(clothespath);
			System.out.println(content);

			CommunityDTO dto = new CommunityDTO(title,userid,clothespath, content);
			CommunityDAO dao = new CommunityDAO();

			int cnt = dao.community_Insert(dto);

			if (cnt > 0) {
				System.out.println("���� ���ε� ����");
			} else {
				System.out.println("���� ���ε� ����");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		String moveURL = "Community.jsp";

		return moveURL;
	}

}

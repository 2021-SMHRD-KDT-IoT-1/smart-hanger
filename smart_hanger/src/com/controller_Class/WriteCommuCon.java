package com.controller_Class;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.Model.CommunityDAO;
import com.Model.CommunityDTO;
import com.Model.MemberDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteCommuCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
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
			String userid = (String)((MemberDTO)session.getAttribute("userInfo")).getUserId();
			String title = multi.getParameter("title");
			
			// �̹����±׿� �ۼ� �� 16������ ��Ÿ������ؼ� ���ڵ��� ����
			String content = multi.getParameter("memo");
			String clothespath = URLEncoder.encode(multi.getFilesystemName("img_file"), "EUC-KR");

			
			System.out.println(clothespath);


			CommunityDAO dao = new CommunityDAO();
			

			int cnt = dao.community_Insert(new CommunityDTO(userid,title,content,clothespath));

			if (cnt > 0) {
				//System.out.println("���� ���ε� ����");
			} else {
				System.out.println("���� ���ε� ����");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		String moveURL = "../../Main.jsp#Community";

		return moveURL;
	}

}

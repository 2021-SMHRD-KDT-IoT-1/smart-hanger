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

		// cos.jar 파일안에 있는 클래스 사용
		// 요청, 저장경로, 사이즈 최대 크기, 인코딩 방식, DefaultFileRenamePolicy : 이미지파일중복제거
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding,
					new DefaultFileRenamePolicy());
		
			// 데이터베이스에 저장하기위해서 fileName, title, content 등의 정보 가져오기
			String title = multi.getParameter("title");
			String userid = multi.getParameter("userid");
			// 이미지태그에 작성 시 16진수로 나타내줘야해서 인코딩을 진행
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
				System.out.println("파일 업로드 성공");
			} else {
				System.out.println("파일 업로드 실패");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		String moveURL = "Community.jsp";

		return moveURL;
	}

}

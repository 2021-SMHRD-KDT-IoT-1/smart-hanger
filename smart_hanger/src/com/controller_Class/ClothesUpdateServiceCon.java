package com.controller_Class;

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

		// 이미지 크기 지정
		int maxSize = 5 * 1024 * 1024;

		// 사진 이름 인코딩 설정
		String encoding = "EUC-KR";

		// cos.jar 파일안에 있는 클래스 사용
		// 요청 ,저장경로 , 사이즈최대크기, 인코딩방식, DefaultFileRenamePolicy : 이미지파일중복제거

		System.out.println("준비!");
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());

			// 데이터베이스에 저장하기 위해서 fileName, title, content 등의 정보 가져오기

			String fileName = URLEncoder.encode(multi.getFilesystemName("fileName"),"EUC-KR");
			String Clothtext = multi.getParameter("Clothtext");
			String Clothtextarea = multi.getParameter("Clothtextarea");
			num = multi.getParameter("num");

			// 이미지태그에 작성시 16진수로 나타내줘야해서 인코딩을 진
			//  String fileName = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
			
			My_clothesDTO dto = new My_clothesDTO(num, Clothtext, Clothtextarea, fileName);
			My_clothesDAO dao = new My_clothesDAO();

			// My_clothesDTO dto = new My_clothesDTO(Clothtext, Clothtextarea, fileName);
			// My_clothesDAO dao = new My_clothesDAO();

			int cnt = dao.My_clothes_Update(dto);

			if (cnt > 0) {
				System.out.println("업데이트 성공");
			} else {
				System.out.println("업데이트 실패");
			}
			
		} catch (Exception e) {

		}

		System.out.println(num);
		moveURL = "viewCloth.jsp?num=" + num;

		return moveURL;

	}

}

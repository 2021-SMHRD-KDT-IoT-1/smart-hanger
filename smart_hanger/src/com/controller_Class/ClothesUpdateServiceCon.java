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
		// title, writer, content에 대한 인코딩
		String moveURL = null;		
		
		try {

					// 이미지의 저장 경로 지정(서버 내 폴더)
					// getServletContext : 서블릿의 정보
					// getRealPath : 실제 경로
					String savePath = request.getServletContext().getRealPath("cloth_img");


					// 이미지 크기 지정
					int maxSize = 5 * 1024 * 1024;

					// 사진 이름 인코딩 설정
					String encoding = "EUC-KR";
					
					// cos.jar 파일안에 있는 클래스 사용
					// 요청, 저장경로, 사이즈 최대 크기, 인코딩 방식, DefaultFileRenamePolicy : 이미지파일중복제거
					MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
					
					
					// 데이터베이스에 저장하기위해서 fileName, title, content 등의 정보 가져오기
					String title = multi.getParameter("title");
					String memo = multi.getParameter("memo");
					String num = multi.getParameter("num");
					
					// 이미지태그에 작성 시 16진수로 나타내줘야해서 인코딩을 진행
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

}

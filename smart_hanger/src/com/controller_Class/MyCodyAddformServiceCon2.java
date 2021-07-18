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
		// title, writer, content에 대한 인코딩

		HttpSession session = request.getSession();


		String moveURL = null;

		// 이미지의 저장 경로 지정(서버 내 폴더)
		// getServletContext : 서블릿의 정보
		// getRealPath : 실제 경로
		String savePath = request.getServletContext().getRealPath("myCody");

		// 이미지 크기 지정
		int maxSize = 5 * 1024 * 1024;

		// 사진 이름 인코딩 설정
		String encoding = "EUC-KR";

		// 사진 이름
		String clothespath = "";

		try {

			// cos.jar 파일안에 있는 클래스 사용
			// 요청, 저장경로, 사이즈 최대 크기, 인코딩 방식, DefaultFileRenamePolicy : 이미지파일중복제거

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,	new DefaultFileRenamePolicy());

			// 데이터베이스에 저장하기위해서 fileName, title, content 등의 정보 가져오기.
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

package com.controller_Class;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Cody_Board_DAO;
import com.Model.Cody_Board_DTO;
import com.Model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/CodyAddServiceCon2")
public class CodyAddServiceCon2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// title, writer, content에 대한 인코딩

		HttpSession session = request.getSession();


		// 이미지의 저장 경로 지정(서버 내 폴더)
		// getServletContext : 서블릿의 정보
		// getRealPath : 실제 경로
		String savePath = request.getServletContext().getRealPath("cody_img");

		// 이미지 크기 지정
		int maxSize = 5 * 1024 * 1024;

		// 사진 이름 인코딩 설정
		String encoding = "EUC-KR";


		try {

			// cos.jar 파일안에 있는 클래스 사용
			// 요청, 저장경로, 사이즈 최대 크기, 인코딩 방식, DefaultFileRenamePolicy : 이미지파일중복제거

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
					new DefaultFileRenamePolicy());

			// 데이터베이스에 저장하기위해서 fileName, title, content 등의 정보 가져오기.
			String userId = (String) ((MemberDTO) session.getAttribute("userInfo")).getUserId();
			String title = multi.getParameter("title");
			String codycontent = multi.getParameter("memo");
			String codypath = multi.getFilesystemName("img_file");
			
			

			Cody_Board_DAO dao = new Cody_Board_DAO();
			
			String cody_board_num =  dao.Cody_BoardInsert(new Cody_Board_DTO(userId, title, codycontent, codypath));
			
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			
			
			
			out.print("zSmart_hanger/cody/viewStylist.jsp?num=" + cody_board_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

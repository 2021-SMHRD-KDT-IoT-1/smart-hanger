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
		// title, writer, content�� ���� ���ڵ�

		HttpSession session = request.getSession();


		// �̹����� ���� ��� ����(���� �� ����)
		// getServletContext : ������ ����
		// getRealPath : ���� ���
		String savePath = request.getServletContext().getRealPath("cody_img");

		// �̹��� ũ�� ����
		int maxSize = 5 * 1024 * 1024;

		// ���� �̸� ���ڵ� ����
		String encoding = "EUC-KR";


		try {

			// cos.jar ���Ͼȿ� �ִ� Ŭ���� ���
			// ��û, ������, ������ �ִ� ũ��, ���ڵ� ���, DefaultFileRenamePolicy : �̹��������ߺ�����

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
					new DefaultFileRenamePolicy());

			// �����ͺ��̽��� �����ϱ����ؼ� fileName, title, content ���� ���� ��������.
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

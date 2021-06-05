package com.sendEmail;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class Hii
 */
@WebServlet("/Hii")
public class Hii extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String moveURL = null;

		// �̹����� ���� ��� ����(���� �� ����)
		// getServletContext : ������ ����
		// getRealPath : ���� ���
		String savePath = request.getServletContext().getRealPath("cloth_img");

		// �̹��� ũ�� ����
		int maxSize = 5 * 1024 * 1024;

		// ���� �̸� ���ڵ� ����
		String encoding = "EUC-KR";


		try {

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());

			//String clothespath = URLEncoder.encode(multi.getFilesystemName("img_file"), "EUC-KR");

			moveURL = "Mina.jsp";

		} catch (

		IOException e) {
			e.printStackTrace();
		}


	}
}

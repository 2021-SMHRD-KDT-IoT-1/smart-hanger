package com.sendEmail;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Hi implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {



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

			String clothespath = URLEncoder.encode(multi.getFilesystemName("img_file"), "EUC-KR");

			moveURL = "Mina.jsp";

		} catch (

		IOException e) {
			e.printStackTrace();
		}

		return moveURL;

	}

}

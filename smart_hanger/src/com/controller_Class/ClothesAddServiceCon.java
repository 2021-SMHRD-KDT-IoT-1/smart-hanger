package com.controller_Class;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDTO;
import com.Model.My_clothesDAO;
import com.Model.My_clothesDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ClothesAddServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// title, writer, content�� ���� ���ڵ�

		HttpSession session = request.getSession();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date time = new Date();

		String local_time = format.format(time);
		local_time = local_time.replace(" ", "_");
		local_time = local_time.replace(":", "-");

		String moveURL = null;

		// �̹����� ���� ��� ����(���� �� ����)
		// getServletContext : ������ ����
		// getRealPath : ���� ���
		String savePath = request.getServletContext().getRealPath("cloth_img");

		// �̹��� ũ�� ����
		int maxSize = 5 * 1024 * 1024;

		// ���� �̸� ���ڵ� ����
		String encoding = "EUC-KR";

		// ���� �̸�
		String clothespath = "";
		
		
		
		System.out.println(savePath);

		try {

			// cos.jar ���Ͼȿ� �ִ� Ŭ���� ���
			// ��û, ������, ������ �ִ� ũ��, ���ڵ� ���, DefaultFileRenamePolicy : �̹��������ߺ�����

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());

			// �����ͺ��̽��� �����ϱ����ؼ� fileName, title, content ���� ���� ��������.
			String userId = (String) ((MemberDTO) session.getAttribute("userInfo")).getUserId();
			String clothesType = "no";
			String clothesName = multi.getParameter("title");
			String memo = multi.getParameter("memo");
			String img_type = multi.getParameter("img_type");

			
			
			
			
			if (img_type.equals("take_picture")) {

				// String clothespath = URLEncoder.encode(multi.getFilesystemName("img_file"),
				// "EUC-KR");
				clothespath = multi.getFilesystemName("img_file");

			} else {

				// Ȥ�� ������ ���Ͽ� �����ϴ� blob������ ���� ��� ����
				String savePath2 = savePath + "\\blob";

				// blob ������ ���� �����ϸ� �����ϰ� ���ο� blob����
				File file_delete = new File(savePath2);
				if (file_delete.exists()) {
					if (file_delete.delete()) {
						System.out.println("���ϻ��� ����");
					}
				}

				// ���� �ޱ�� ����� blob�� �̸��� [���糯¥_�ð�]���� ������
				file_delete.renameTo(new File(savePath + "\\" + local_time + ".png"));

				clothespath = local_time + ".png";

			}

			My_clothesDAO dao = new My_clothesDAO();

			String clothes_num = dao.My_clothes_Insert(new My_clothesDTO(userId, clothesName, clothesType, memo, clothespath));

			moveURL = "viewCloth.jsp?num=" + clothes_num;

		} catch (IOException e) {
			e.printStackTrace();
		}

		return moveURL;

	}

}

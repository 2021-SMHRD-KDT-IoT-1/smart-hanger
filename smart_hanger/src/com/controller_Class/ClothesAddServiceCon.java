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
		// title, writer, content에 대한 인코딩

		HttpSession session = request.getSession();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date time = new Date();

		String local_time = format.format(time);
		local_time = local_time.replace(" ", "_");
		local_time = local_time.replace(":", "-");

		String moveURL = null;

		// 이미지의 저장 경로 지정(서버 내 폴더)
		// getServletContext : 서블릿의 정보
		// getRealPath : 실제 경로
		String savePath = request.getServletContext().getRealPath("cloth_img");

		// 이미지 크기 지정
		int maxSize = 5 * 1024 * 1024;

		// 사진 이름 인코딩 설정
		String encoding = "EUC-KR";

		// 사진 이름
		String clothespath = "";
		
		
		
		System.out.println(savePath);

		try {

			// cos.jar 파일안에 있는 클래스 사용
			// 요청, 저장경로, 사이즈 최대 크기, 인코딩 방식, DefaultFileRenamePolicy : 이미지파일중복제거

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());

			// 데이터베이스에 저장하기위해서 fileName, title, content 등의 정보 가져오기.
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

				// 혹시 오류로 인하여 존재하는 blob삭제를 위해 경로 설정
				String savePath2 = savePath + "\\blob";

				// blob 파일이 먼저 존재하면 삭제하고 새로운 blob저장
				File file_delete = new File(savePath2);
				if (file_delete.exists()) {
					if (file_delete.delete()) {
						System.out.println("파일삭제 성공");
					}
				}

				// 파일 받기로 저장된 blob에 이름은 [현재날짜_시간]으로 저장함
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

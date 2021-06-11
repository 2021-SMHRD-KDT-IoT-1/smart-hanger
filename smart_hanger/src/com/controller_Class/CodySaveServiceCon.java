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

public class CodySaveServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String savePath = request.getServletContext().getRealPath("cody_img");
		

		// 이미지 크기 지정
		int maxSize = 5 * 1024 * 1024;

		// 사진 이름 인코딩 설정
		String encoding = "EUC-KR";

		String clothespath = "";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
			clothespath = multi.getFilesystemName("img_file");
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return clothespath;

	}

}

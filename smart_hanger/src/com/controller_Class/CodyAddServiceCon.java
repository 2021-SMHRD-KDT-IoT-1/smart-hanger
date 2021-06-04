package com.controller_Class;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Cody_Board_DAO;
import com.Model.Cody_Board_DTO;
import com.Model.Cody_board_commentsDAO;
import com.Model.MemberDTO;
import com.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CodyAddServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		HttpSession session = request.getSession();
		
		
		String moveURL = null;
		
		try {
			
			String sevePath = request.getServletContext().getRealPath("cody_img");
			
			int maxSize = 5 * 1024 * 1024;
			
			String encoding = "EUC-KR";
			
			MultipartRequest multi = new MultipartRequest(request, sevePath, maxSize, encoding, new DefaultFileRenamePolicy());
			
			String userId = (String)((MemberDTO)session.getAttribute("userInfo")).getUserId();
			String codycontent = multi.getParameter("memo");
			String codypath = multi.getFilesystemName("img_file");
			
			
			Cody_Board_DAO dao = new Cody_Board_DAO();
			
			String cody_board_num =  dao.Cody_BoardInsert(new Cody_Board_DTO(userId, codycontent, codypath));
			
			
			moveURL="viewStylist.jsp?num=" + cody_board_num;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return moveURL;
		
		
		
		
	}

}

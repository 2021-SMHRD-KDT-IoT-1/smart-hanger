package com.frontcontroller;

import java.io.IOException;

import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.controller_Class.ClothesOneDeleteServicCon;
import com.controller_Class.ClothesUpdateServiceCon;
//import com.controller_Class.DeleteServiceCon;
import com.controller_Class.JoinServiceCon;
import com.controller_Class.LoginServiceCon;
import com.controller_Class.LogoutServiceCon;
//import com.controller_Class.MessageDeleteOneServiceCon;
//import com.controller_Class.MessageDeleteServiceCon;
//import com.controller_Class.MessageServiceCon;
//import com.controller_Class.UpdateServiceCon;
//import com.controller_Class.WriterBoard;
//import com.model.WebBoardDAO;
//import com.model.WebBoardDTO;
//import com.model.WebMessageDAO;
//import com.model.WebMessageDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("*.do")  // *를 통해서 .do라는 확장자가 붙은 친구들은 다 이 서블릿으로 오게 만들어 준다.
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//인코딩
		request.setCharacterEncoding("euc-kr");
		
		System.out.println("FrontController");
		
		//getRequestURI : 어떤 jsp/servlet에서 들어오는지 알기위한 함수
		String reqURI = request.getRequestURI();
		System.out.println("어디에서 왔는지? : "+reqURI);
		
		//Project이름출력
		String path = request.getContextPath();
		System.out.println("프로젝트 이름은? : "+path);
		
		// servlet 이름만 출력하기
		// 문자열 자르는 함수 : substring
		// substring(start) : start위치부터 끝까지 문자열 자르기
		// substring(start, end) : start부터 end위치까지 문자열 자르기
		// path의 길이에 +1을 해준 이유 : '/' 이것도 뺴야하기 때문에
		String resultURI = reqURI.substring(path.length()+1);
		System.out.println("서블릿 이름 : "+resultURI);
		
		request.setCharacterEncoding("EUC-KR");
		
		//업캐스팅 하기 위해서 수퍼클래스 선언
		Command command = null;
		
		
		
		
		if (resultURI.equals("LoginServiceCon.do")) {
			command = new LoginServiceCon();

		}

		else if (resultURI.equals("JoinServiceCon.do")) {
			System.out.println("들어옴!");
			command = new JoinServiceCon();
		}
		
		else if (resultURI.equals("LogoutServiceCon.do")) {
			command = new LogoutServiceCon();
			
			
			
//		}else if(resultURI.equals("JoinServiceCon.do")) {
//			command = new JoinServiceCon();
//			
//			
//			
//		}else if(resultURI.equals("DeleteServiceCon.do")) {
//			command = new DeleteServiceCon();
//			
//			
//			
//			
//		}else if(resultURI.equals("LogoutServiceCon.do")) {
//			command = new LogoutServiceCon();
//			
//			
//			
//			
//		}else if(resultURI.equals("MessageDeleteServiceCon.do")) {
//			command = new MessageDeleteServiceCon();
//			
//			
//			
//			
//			
//		}else if(resultURI.equals("MessageDeleteOneServiceCon.do")) {
//			command = new MessageDeleteOneServiceCon();
//			
//		
//			
//		}else if(resultURI.equals("MessageServiceCon.do")) {
//			command = new MessageServiceCon();
//			
//			
//			
//		}else if(resultURI.equals("UpdateServiceCon.do")) {
//			command = new UpdateServiceCon();
//			
//			
//			
			
			
		// 여기는 등록된 옷 삭제	
		}else if(resultURI.equals("ClothesOneDeleteServicCon.do")) {
			command = new ClothesOneDeleteServicCon();
			
			
			
	    // 여기는 옷 수정 
		}else if(resultURI.equals("ClothesUpdateServiceCon.do")) {
			command = new ClothesUpdateServiceCon();
			
		}
		
		
		String moveURL = command.execute(request, response);
		System.out.println(moveURL);
		response.sendRedirect(moveURL);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}

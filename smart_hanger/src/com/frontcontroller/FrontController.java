package com.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.controller_Class.ClothesAddServiceCon;
import com.controller_Class.ClothesOneDeleteServicCon;
import com.controller_Class.ClothesUpdateServiceCon;
import com.controller_Class.CodyAddServiceCon;
import com.controller_Class.JoinServiceCon;
import com.controller_Class.LoginServiceCon;
import com.controller_Class.LogoutServiceCon;
import com.controller_Class.MemberUpdateServiceCon;
import com.controller_Class.UserServiceCon;
import com.controller_Class.WriteCommuCon;



@WebServlet("*.do") // *를 통해서 .do라는 확장자가 붙은 친구들은 다 이 서블릿으로 오게 만들어 준다.
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("euc-kr");

		// getRequestURI : 어떤 jsp/servlet에서 들어오는지 알기위한 함수
		String reqURI = request.getRequestURI();

		// Project이름출력
		String path = request.getContextPath();

		// servlet 이름만 출력하기
		// 문자열 자르는 함수 : substring
		// substring(start) : start위치부터 끝까지 문자열 자르기
		// substring(start, end) : start부터 end위치까지 문자열 자르기
		// path의 길이에 +1을 해준 이유 : '/' 이것도 뺴야하기 때문에
		String resultURI = reqURI.substring(path.length() + 1);
		System.out.println("서블릿 이름 : " + resultURI);

		request.setCharacterEncoding("EUC-KR");

		// 업캐스팅 하기 위해서 수퍼클래스 선언
		Command command = null;

		
		
		if (resultURI.equals("LoginServiceCon.do")) {
			command = new LoginServiceCon();
		
		}else if (resultURI.equals("JoinServiceCon.do")) {
			command = new JoinServiceCon();
		
		}else if (resultURI.equals("LogoutServiceCon.do")) {
			command = new LogoutServiceCon();
			
	 			
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
			// 회원 정보 수정
			
		}else if(resultURI.equals("MemberUpdateServiceCon.do")) {
			command = new MemberUpdateServiceCon();
			
			
			

//		}else if(resultURI.equals("UpdateServiceCon.do")) {
//			command = new UpdateServiceCon();
//			
//			
//		
			//요기는 고객센터 등록
		} else if (resultURI.equals("UserServiceCon.do")) {
			command = new UserServiceCon();	
            //여기는 코디 등록
		} else if (resultURI.equals("CodyAddServiceCon.do")) {
			command = new CodyAddServiceCon();
			// 여기는 옷 등록
		} else if (resultURI.equals("ClothesAddServiceCon.do")) {
			command = new ClothesAddServiceCon();

			// 여기는 등록된 옷 삭제
		} else if (resultURI.equals("ClothesOneDeleteServicCon.do")) {
			command = new ClothesOneDeleteServicCon();

			// 여기는 옷 수정
		} else if (resultURI.equals("ClothesUpdateServiceCon.do")) {
			command = new ClothesUpdateServiceCon();


		}
		else if(resultURI.equals("WriteCommuCon.do")) {
			command = new WriteCommuCon();
			}
		
		
		String moveURL = command.execute(request, response);
		response.sendRedirect(moveURL);
	}
}